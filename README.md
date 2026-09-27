# Azahar iOS (ARM64)

Unofficial **iOS ARM64 build project** for [Azahar](https://github.com/azahar-emu/azahar) (`azahar-emu/azahar`), the Citra-based 3DS emulator.

This repository is **not** an official Azahar product. Azahar itself does not ship a standalone iOS app.

## What exists today (Sep 2026)

| Thing | Status |
| --- | --- |
| Official standalone Azahar `.ipa` | **Does not exist.** iOS frontend was dropped ([azahar#295](https://github.com/azahar-emu/azahar/issues/295)). FAQ: iOS support is not planned. |
| Official Azahar **libretro** core for iOS ARM64 | **Yes.** Latest stable: `2126.1.2` |
| This repo | Empty until this bootstrap. No Xcode frontend yet. |

Official iOS core download:

https://github.com/azahar-emu/azahar/releases/download/2126.1.2/azahar-libretro-ios-arm64-2126.1.2.zip

Play path that actually works today:

1. Install [RetroArch](https://www.retroarch.com/?page=platforms) for iOS (sideload or App Store variant).
2. Drop the Azahar libretro core into RetroArch.
3. Use your own dumped titles + `aes_keys.txt` / sysdata from a 3DS you own.

JIT is forced off on App Store iOS. Performance is much better on recent iPhones; older devices often sit under 100%.

## What this repo will not pretend to be

A signed, playable, standalone Azahar IPA cannot be produced from Linux CI without:

- an iOS frontend (UIKit/SwiftUI + Metal, replacing the dropped Citra iOS / Qt path)
- Xcode on a macOS runner (this project uses GitHub Actions for the official core only)
- your Apple signing identity for device install (AltStore / SideStore / paid cert)

Porting the full Azahar core + renderer + input + FS sandbox to a native iOS app is a multi-month job, not a one-shot `xcodebuild`.

If you want 3DS on iPhone *now*, use Folium (App Store, Azahar-based core) or RetroArch + the official Azahar iOS core above.

## CI

`.github/workflows/fetch-ios-libretro.yml`

- Manual (`workflow_dispatch`) or on push to `main`
- Downloads the official `azahar-libretro-ios-arm64` zip for tag `2126.1.2`
- Uploads it as a workflow artifact named `azahar-libretro-ios-arm64`

This does **not** compile Azahar. It only mirrors the official iOS core so this repo has a repeatable ARM64 artifact.

## License

Azahar is GPL-2.0. See `https://github.com/azahar-emu/azahar/blob/master/license.txt`.
Any future frontend here that links the Azahar core must stay GPL-compatible.

Nintendo trademarks belong to Nintendo. Dump games you own.
