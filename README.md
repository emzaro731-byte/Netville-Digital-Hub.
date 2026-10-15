# Netville Digital Hub

Netville Digital Hub contains a responsive business website and a Flutter Android app for customers to explore services and send project orders.

## Project features

- `index.html` — responsive public website, service information, enquiry form and order-request form.
- `lib/main.dart` — Flutter Android app with Home, Services, Portfolio and Contact/Order screens.
- Order requests capture the requested service, contact details, budget/project details and preferred payment method, then open WhatsApp for the customer to review and send.
- `.github/workflows/android-apk.yml` — builds a release APK and Play Store AAB.
- `.github/workflows/pages.yml` — deploys the website to GitHub Pages when website files change on `main`.

## Publish the website

1. Open this repository on GitHub.
2. Go to **Settings → Pages**.
3. Under the build/deployment source, choose **GitHub Actions** if prompted.
4. Open **Actions** and select **Publish Netville website to GitHub Pages**.
5. Run it manually if it did not start after the latest commit.
6. Open the successful workflow run or **Settings → Pages** to find the published website address.

The website is not considered live until the Pages deployment finishes successfully.

## Build and download the Android app

1. Open the repository's **Actions** tab.
2. Select **Build Netville Android APK and App Bundle**.
3. Wait for the workflow to finish successfully.
4. Open the completed run and download the `netville-digital-hub-android-builds` artifact.
5. Extract the ZIP. Install `app-release.apk` on your Android phone. The `.aab` is for Play Store publishing and is not installed directly like an APK.

The workflow runs Flutter dependency resolution and analysis before building both release formats. A successful commit does not by itself guarantee the build has passed; check the Actions result.

## Orders and payments

The order forms send the customer's request to WhatsApp so they can review it before sending. No card payment is collected directly by the website or app yet.

For live online checkout, create a Paystack merchant account and configure a valid payment link or integrate a server-side checkout flow that verifies payments before marking an order paid. Do not put a Paystack secret key in this public repository or in the Android app. Confirm the agreed scope, price and delivery terms before requesting payment.

## Before launch

- Confirm the business contact details and WhatsApp number in `index.html` and `lib/main.dart`.
- Replace example portfolio concepts with real work as it becomes available; they are labelled as concepts, not completed client projects.
- Add a privacy policy and terms of service before collecting customer data at scale.
- Keep API keys, passwords and private customer information out of the repository.
