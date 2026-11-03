import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';

const kInfoUrl = 'https://firsching.ch/guessaday';
const kAuthorName = 'Moritz Firsching';
const kAuthorEmail = 'moritz.firsching@gmail.com';

Future<void> showAboutGuessaday(BuildContext context) async {
  final info = await PackageInfo.fromPlatform();
  if (!context.mounted) return;
  final l10n = AppLocalizations.of(context);
  final linkStyle = TextStyle(color: Theme.of(context).colorScheme.primary);

  await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      icon: Image.asset('assets/icon/icon.png', width: 48, height: 48),
      title: Text(l10n.appName),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.appDescription),
            const SizedBox(height: 12),
            Text(l10n.howTo),
            _Link(
              label: l10n.moreInfo,
              uri: Uri.parse(kInfoUrl),
              style: linkStyle,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text('${l10n.author}: '),
                _Link(
                  label: kAuthorName,
                  uri: Uri(
                    scheme: 'mailto',
                    path: kAuthorEmail,
                    queryParameters: {'subject': 'Feedback for Guessaday'},
                  ),
                  style: linkStyle,
                ),
              ],
            ),
            Text('${l10n.version}: ${info.version}'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.ok),
        ),
      ],
    ),
  );
}

class _Link extends StatelessWidget {
  const _Link({required this.label, required this.uri, required this.style});

  final String label;
  final Uri uri;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(uri, mode: LaunchMode.externalApplication),
      child: Text(label, style: style),
    );
  }
}
