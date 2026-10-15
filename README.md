# Netville Digital Hub

A starter project for the Netville Digital Hub business, containing a responsive public website and a Flutter Android app.

## Included

- `index.html` — mobile-friendly business website with service listings and a project enquiry form.
- `lib/main.dart` — Flutter app with Home, Services, and Enquiry screens.
- `pubspec.yaml` — Flutter dependencies.
- `.github/workflows/android-apk.yml` — builds a release APK when code is pushed to `main), and can also be run manually.

## Website

The website can be published using GitHub Pages. In the repository, open **Settings → Pages**, choose **Deploy from a branch**, select `main` and `/(root)`, then save. GitHub Pages can take several minutes to publish the site.

The expected project URL for this repository name is:
`https://emzaro731-byte.github.io/Netville-Digital-Hub./`

## Build the Android APK

1. Open the repository's **Actions** tab.
2. Select **Build Netville Android APK**.
3. Press **Run workflow** (or wait for a build after a push).
4. Open the completed workflow run and download the `netville-digital-hub-apk` artifact.

The workflow generates the Android platform files, then builds the release APK.

## Before launching publicly

- Replace the placeholder WhatsApp number in `index.html` with the business WhatsApp number in international format without the plus sign.
- Connect the app enquiry form to a real backend, email, or WhatsApp integration. The current form is a local demo and does not send customer data to a server.
- Add your actual portfolio, contact details, service prices, privacy policy, and terms.
- Do not put API keys, passwords, or private customer information in public source files.
