# Build notes

## Why there is no IPA in Releases yet

`MuntazirFX/-Azahar-iOS` started empty on 2026-09-27.

`azahar-emu/azahar` is a large CMake/C++ tree (desktop Qt + Android). The old Citra iOS target was removed. There is no `project.yml` / `.xcodeproj` here that can emit `Azahar.app`.

Santa-ios style CI (`xcodegen` + `xcodebuild` unsigned on `macos-latest`) only works after an iOS app target exists.

## Official ARM64 artifact (available now)

```bash
TAG=2126.1.2
curl -L -o azahar-libretro-ios-arm64-${TAG}.zip \
  "https://github.com/azahar-emu/azahar/releases/download/${TAG}/azahar-libretro-ios-arm64-${TAG}.zip"
unzip -l azahar-libretro-ios-arm64-${TAG}.zip
```

Load that core in RetroArch iOS.

## Next work if this becomes a real standalone port

1. Vendor or submodule a pinned Azahar revision (GPL-2.0, `--recursive`).
2. Replace Qt/Android UI with UIKit + Metal view (same pattern as Santa-ios `MetalView.mm`).
3. iOS sandbox FS: Documents dir for NAND / SD / sysdata / keys.
4. Decide interpreter vs JIT. App Store JIT is blocked; sideload can use `pthread_jit_write_protect_np` on newer iOS.
5. Add `project.yml` + `.github/workflows/ios-build.yml` copied from Santa-ios (`CODE_SIGNING_ALLOWED=NO`).
6. Sideload the unsigned IPA with AltStore / SideStore / your team cert.

Do not commit ROMs, `aes_keys.txt`, or NAND dumps.
