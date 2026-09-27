# RetroArch iOS — official Azahar core

Official Azahar iOS build is `azahar_libretro.dylib`, not an IPA.

Core zip:
https://github.com/azahar-emu/azahar/releases/download/2126.1.2/azahar-libretro-ios-arm64-2126.1.2.zip

SHA-256: `a45a56662109df241848b72a58d6981a8d2633dad6cf69662a462614f977d918`

On iOS 9+, cores must be **inside the signed RetroArch app**. You cannot copy a `.dylib` into Files.app and expect App Store RetroArch to load it.

Docs: https://docs.libretro.com/guides/install-ios/

## Path A — App Store RetroArch (easiest)

1. Install [RetroArch](https://apps.apple.com/us/app/retroarch/id6499539433) (developer: Libretro).
2. Open RetroArch once.
3. Online Updater: Update Core Info Files, Assets, Databases.
4. Main Menu → Load Core. Look for **Azahar**.
5. If Azahar is listed, use Path C for games/keys. If not listed, use Path B. App Store builds cannot download extra cores at runtime, and JIT is off.

## Path B — Sideload RetroArch IPA (more cores)

1. Get the official iOS IPA from https://docs.libretro.com/guides/install-ios/ (Stable, iOS 12+).
2. Sideload with AltStore or SideStore.
3. Those IPAs already bundle available iOS cores. Open Load Core and look for Azahar.
4. Still missing? The `.dylib` from Azahar 2126.1.2 must be baked into a custom RetroArch build (Path D). Dropping it into Documents does not work on modern iOS.

## Path C — Games and 3DS keys

Use dumps from a 3DS you own. Do not commit ROMs or `aes_keys.txt`.

1. Launch RetroArch once so it creates its folder.
2. Files app → Browse → On My iPhone/iPad → RetroArch.
3. Put game files in that folder (or a subfolder).
4. Put `aes_keys.txt` / sysdata where Azahar expects them (same Documents tree RetroArch exposes).
5. RetroArch → Load Content → Open… → pick the game → choose Azahar if asked.

## Path D — Custom RetroArch + official Azahar dylib (Mac + Xcode)

1. Unzip official core to get `azahar_libretro.dylib`.
2. Clone RetroArch. Copy the dylib to `RetroArch/pkg/apple/iOS/modules/`.
3. Archive/sign in Xcode so the core is codesigned with the app.
4. Sideload that IPA.

See https://docs.libretro.com/development/retroarch/compilation/ios/

## JIT

App Store RetroArch has no JIT. Azahar on iOS ships with JIT off. Recent iPhones are the realistic target.
