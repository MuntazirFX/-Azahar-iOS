# Azahar iOS (ARM64)

Unofficial **iOS ARM64 build project** for [Azahar](https://github.com/azahar-emu/azahar).

Frontend layout follows **[Santa-ios](https://github.com/MuntazirFX/Santa-ios)**: `project.yml` + XcodeGen + unsigned `xcodebuild` on `macos-latest`.

This is **not** official Azahar. The emulator core is not linked yet. The app target is a Metal/UIKit shell so the same IPA pipeline as Santa-ios can run.

## Santa-ios pattern (used here)

| File | Same idea as Santa-ios |
| --- | --- |
| `project.yml` | XcodeGen iOS app, `CODE_SIGNING_ALLOWED: NO`, Metal + UIKit |
| `ios/AppDelegate.*` `ios/MetalView.*` | ObjC++ / MetalKit view |
| `.github/workflows/ios-build.yml` | `macos-latest` → xcodegen → xcodebuild → zip `AzaharEngine.ipa` |

## CI

1. **iOS Build on macOS Runner** — unsigned IPA artifact `AzaharEngine-unsigned-ipa`
2. **Fetch official Azahar iOS ARM64 libretro core** — official `2126.1.2` core zip

Run: Actions → iOS Build on macOS Runner → Run workflow.

Sideload the unsigned IPA with AltStore / SideStore / your team cert. It will launch a blank Metal view until the Azahar core is ported in.

## Official playable iOS path today

https://github.com/azahar-emu/azahar/releases/download/2126.1.2/azahar-libretro-ios-arm64-2126.1.2.zip

Use that core inside RetroArch iOS. Standalone official IPA does not exist.

## License

Azahar is GPL-2.0. Nintendo marks belong to Nintendo. No ROMs or keys in this repo.
