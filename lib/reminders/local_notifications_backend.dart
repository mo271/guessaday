import 'dart:io' show Platform;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import 'reminder_schedule.dart';
import 'reminders.dart';

const _channelId = 'reminders';
const _categoryId = 'guessaday_reminder';
const _icon = 'ic_notification';
const _revealAction = 'reveal';
const _practiceAction = 'practice';

/// Reminders through flutter_local_notifications (Android, iOS, macOS).
class LocalNotificationsBackend implements ReminderBackend {
  final _plugin = FlutterLocalNotificationsPlugin();
  ReminderTexts? _texts;

  @override
  bool get supported => true;

  /// iOS keeps at most 64 pending notifications per app; Android allows
  /// 500 alarms. Stay well below both.
  @override
  int get maxPending => Platform.isAndroid ? 300 : 60;

  @override
  Future<void> initialize(
    ReminderTexts texts,
    void Function(ReminderPayload payload) onOpen,
  ) async {
    _texts = texts;
    await _plugin.initialize(
      settings: InitializationSettings(
        android: const AndroidInitializationSettings(_icon),
        // Permission is requested only when the user turns reminders on.
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          notificationCategories: [
            DarwinNotificationCategory(
              _categoryId,
              actions: [
                DarwinNotificationAction.plain(_revealAction, texts.reveal),
                DarwinNotificationAction.plain(
                  _practiceAction,
                  texts.practice,
                  options: {DarwinNotificationActionOption.foreground},
                ),
              ],
            ),
          ],
        ),
      ),
      onDidReceiveNotificationResponse: (response) {
        final payload = ReminderPayload.decode(response.payload);
        if (payload != null && response.actionId != _revealAction) {
          onOpen(payload);
        }
      },
      onDidReceiveBackgroundNotificationResponse: reminderBackgroundHandler,
    );
  }

  @override
  Future<ReminderPayload?> launchPayload() async {
    final details = await _plugin.getNotificationAppLaunchDetails();
    final response = details?.notificationResponse;
    if (details?.didNotificationLaunchApp != true || response == null) {
      return null;
    }
    if (response.actionId == _revealAction) return null;
    return ReminderPayload.decode(response.payload);
  }

  @override
  Future<bool> requestPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      // Older Android versions have no runtime permission; the plugin then
      // reports null, and notifications are allowed unless the user blocked
      // the app in the system settings.
      final granted = await android.requestNotificationsPermission();
      return granted ?? (await android.areNotificationsEnabled() ?? true);
    }
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    if (ios != null) {
      return await ios.requestPermissions(alert: true, sound: true) ?? false;
    }
    final macos = _plugin
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >();
    if (macos != null) {
      return await macos.requestPermissions(alert: true, sound: true) ?? false;
    }
    return false;
  }

  @override
  Future<void> replaceSchedule(List<ReminderRequest> requests) async {
    await _plugin.cancelAllPendingNotifications();
    final texts = _texts!;
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        texts.channelName,
        channelDescription: texts.channelDescription,
        icon: _icon,
        category: AndroidNotificationCategory.reminder,
        actions: [
          AndroidNotificationAction(_revealAction, texts.reveal),
          AndroidNotificationAction(
            _practiceAction,
            texts.practice,
            showsUserInterface: true,
          ),
        ],
      ),
      iOS: const DarwinNotificationDetails(categoryIdentifier: _categoryId),
      macOS: const DarwinNotificationDetails(categoryIdentifier: _categoryId),
    );
    for (final request in requests) {
      await _plugin.zonedSchedule(
        id: request.id,
        title: request.title,
        body: request.payload.dateText,
        payload: request.payload.encode(),
        // A local DateTime converted to its UTC instant: no time zone
        // database needed, and off by at most an hour across a DST change,
        // which does not matter for a random moment.
        scheduledDate: tz.TZDateTime.from(request.at, tz.UTC),
        notificationDetails: details,
        // Inexact timing needs no exact-alarm permission and is all a random
        // reminder needs.
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    }
  }

  @override
  Future<void> cancelAll() => _plugin.cancelAll();
}

/// Runs in a separate isolate when the user taps "Reveal" on a reminder,
/// also when the app is not running: replaces the question with the answer.
@pragma('vm:entry-point')
Future<void> reminderBackgroundHandler(NotificationResponse response) async {
  if (response.actionId != _revealAction) return;
  final payload = ReminderPayload.decode(response.payload);
  if (payload == null) return;
  await FlutterLocalNotificationsPlugin().show(
    id: response.id ?? 0,
    title: payload.dateText,
    body: payload.weekdayText,
    notificationDetails: const NotificationDetails(
      // The channel exists by now, so the name is not used.
      android: AndroidNotificationDetails(
        _channelId,
        'Reminders',
        icon: _icon,
        category: AndroidNotificationCategory.reminder,
      ),
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
    ),
  );
}
