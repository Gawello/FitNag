# Release

How to ship a build. The project is private (no Play Store / App Store presence yet); this document captures the steps that *would* apply, plus the steps that already do.

---

## Pre-release checklist

Run this list every time, in order. Skipping any step is how regressions ship.

- [ ] **`flutter analyze`** is clean. Warnings investigated.
- [ ] **`flutter test`** passes. Coverage hasn't regressed (see [TESTING.md](TESTING.md)).
- [ ] **Build_runner regen** is committed. `git status` should be clean post-regen.
- [ ] **Schema migration tested.** If `schemaVersion` changed, install the *previous* release on a device, open it (lets it create the old DB), then install this build *over the top* and verify it launches without error. Required for any v1.0+ user-facing release.
- [ ] **Onboarding from a clean install works** end-to-end. Uninstall, reinstall, complete onboarding, verify a plan is generated and a notification fires.
- [ ] **Notifications fire on a real device.** Emulator notifications are unreliable for testing OS-level alarm survival.
- [ ] **Boot survival.** Schedule a notification ≥ 5 minutes from now, reboot the device, wait — it should still fire.
- [ ] **Metronome audio + haptics** verified on a real device with media volume up and ringer in normal mode.
- [ ] **Version bumped** in [`pubspec.yaml`](../pubspec.yaml) (`version: <semver>+<buildNumber>`). The build number must increase monotonically for store uploads.
- [ ] **Recent commits documented.** A one-paragraph release note is enough; reference the commit SHAs.

---

## Version numbering

`pubspec.yaml`:

```yaml
version: 1.2.0+15
```

- The semver string (`1.2.0`) is what users see.
- The build number (`+15`) is what the store dedupes uploads by. **Bump this on every store-bound build**, even if the semver doesn't change.

---

## Building

### Android — App Bundle (Play Store)

```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`. This is the artifact uploaded to Play Console. Signing config must be present in `android/app/build.gradle.kts` (see signing section).

### Android — Universal APK (sideload / private distribution)

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`. Larger than the bundle (no per-architecture splits) but works as a single file.

### Android — Split APKs (smaller per-arch downloads, sideload)

```bash
flutter build apk --split-per-abi --release
```

Outputs three APKs (`app-armeabi-v7a-release.apk`, `app-arm64-v8a-release.apk`, `app-x86_64-release.apk`). Most modern devices need `arm64-v8a`.

### iOS

```bash
flutter build ios --release
```

Requires Xcode on macOS. Then archive in Xcode (`Product → Archive`) and upload via Organizer or Transporter. iOS notifications are not currently exercised — see [NOTIFICATIONS.md → iOS](NOTIFICATIONS.md#ios). Treat iOS as untested.

---

## Signing (Android)

The app currently does not have a committed release-signing configuration. To add one:

1. Generate a keystore (one-time, keep this file secret and backed up):

   ```bash
   keytool -genkey -v -keystore upload-keystore.jks \
     -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```

2. Create `android/key.properties` (gitignored):

   ```properties
   storePassword=…
   keyPassword=…
   keyAlias=upload
   storeFile=/absolute/path/to/upload-keystore.jks
   ```

3. Wire it into `android/app/build.gradle.kts` per the [Flutter docs](https://docs.flutter.dev/deployment/android#signing-the-app).

**Lose the keystore = lose the ability to publish updates to the same Play listing.** Back it up to at least two locations.

---

## Store submission (when applicable)

The app does not currently have store listings. When this changes, document:

- Play Console application ID
- App Store Connect application ID
- Listing copy (description, keywords, screenshots) — owned by product, not engineering
- Privacy policy URL — required by both stores. Since the app is offline-first with zero data collection, the privacy policy is short but must exist.
- Data safety section (Play Console) — declare "no data collected, no data shared" if that remains true.

Until then: distribute via direct APK or internal testing tracks.

---

## Release tagging

Once a build is shipped, tag the commit:

```bash
git tag -a v1.2.0 -m "Release v1.2.0"
git push origin v1.2.0
```

The tag value matches the `pubspec.yaml` semver, without the build number suffix.

---

## Rollback strategy

There is no remote-config kill switch in v1. Rollback options:

- **For a Play Store release:** halt the rollout in Play Console (if staged), then publish the previous AAB version. The `+buildNumber` of the rollback must be higher than the broken release, so bump it accordingly.
- **For a sideloaded APK:** distribute the prior APK; users with the broken version must uninstall and reinstall (signing keys must match).
- **For DB-corrupting bugs:** the only mitigation is to ship a fix that detects and repairs corrupt state on launch. Plan for this in the migration code, not after the fact.

The single-user, no-cloud architecture means **lost user data is unrecoverable**. Treat schema migrations and data-touching code paths with extra care.
