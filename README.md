# Netville Digital Hub

Netville Digital Hub includes a responsive business website and a Flutter Android app.

## Included

- `index.html` — public website with service descriptions and an enquiry form.
- `lib/main.dart` — Flutter Android app with Home, Services, Portfolio and Contact screens.
- `pubspec.yaml` — Flutter package configuration, including WhatsApp link support.
- `.github/workflows/android-apk.yml` — automatic Android release APK build on pushes to `main`, with manual workflow support.

## Publish the website

1. Open **Settings → Pages** in this repository.
2. Choose **Deploy from a branch**.
3. Select branch `main` and folder `/(root)`, then save.
4. Wait for GitHub Pages to finish publishing.

Because the repository name ends with a period, GitHub's project URL may be unusual. Use the Pages URL shown in **Settings → Pages** as the source of truth.

## Build and download the Android APK

1. Open the **Actions** tab.
2. Choose **Build Netville Android APK**.
3. Tap **Run workflow**, if a run is not already in progress.
4. Open a completed run and download the `netville-digital-hub-apk` artifact.

The workflow creates the Android platform files, resolves Flutter packages, and builds a release APK. The build must finish successfully before an APK artifact will be available.

## Required setup before launch

- In `lib/main.dart`, replace `businessWhatsApp = '2340000000000'` with the business WhatsApp number in international format without a plus sign or spaces.
- In `index.html`, replace the placeholder WhatsApp number in the contact form script with the same business number.
- Add real project examples and correct contact details. Portfolio cards currently show example concepts, not completed client work.
- The app form opens WhatsApp after the number is configured. It does not currently save enquiries to a database.
- Add a privacy policy and terms before collecting customer information at scale.
- Never commit API keys, passwords, or private customer data into this public repository.
