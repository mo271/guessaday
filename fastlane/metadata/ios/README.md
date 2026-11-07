# App Store listing texts

One folder per App Store locale, in the file layout that fastlane's
`deliver` expects (`deliver --metadata_path fastlane/metadata/ios`). The
texts can just as well be pasted into App Store Connect by hand. They are
derived from the Google Play / F-Droid texts in `../android/`; keep the two
in sync when editing.

| File                   | App Store Connect field | Limit     |
|------------------------|-------------------------|-----------|
| `name.txt`             | Name                    | 30 chars  |
| `subtitle.txt`         | Subtitle                | 30 chars  |
| `promotional_text.txt` | Promotional text        | 170 chars |
| `description.txt`      | Description             | 4000 chars|
| `keywords.txt`         | Keywords (comma-separated) | 100 chars |
| `release_notes.txt`    | What's new in this version | 4000 chars |
| `support_url.txt`      | Support URL             |           |
| `marketing_url.txt`    | Marketing URL           |           |
| `privacy_url.txt`      | Privacy Policy URL      |           |

Subtitle and keywords exist only for en-US and de-DE so far; Apple requires
them only for the primary language. The privacy policy is published at
https://firsching.ch/guessaday/privacy/ (German:
https://firsching.ch/guessaday/de/datenschutz/).

Screenshots are not stored here. The `ios-simulator` job in
`.github/workflows/build.yml` produces iPhone and iPad screenshots of every
screen on each push. Open the newest green run at
https://github.com/mo271/guessaday/actions/workflows/build.yml?query=branch%3Amaster
and download the `ios-screenshots-iphone` (iPhone 17 Pro Max, 1320×2868,
Apple's 6.9" size) and `ios-screenshots-ipad` (iPad Pro 13", 2064×2752)
zip files under "Artifacts" at the bottom of the run page. Artifacts are
kept for 90 days.

App Privacy questionnaire: the app collects no data at all ("Data Not
Collected"). It has no network access, no accounts, no analytics and no ads.
