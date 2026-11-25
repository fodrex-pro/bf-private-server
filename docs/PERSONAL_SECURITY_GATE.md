# Personal deployment security gate — 2026-11-25

Status: NOT APPROVED to run on the primary computer or phone. This is a preliminary static review, not a malware verdict. No executable or APK runtime test has been completed.

## Verified from source

- `server/packaging/config.json`: listener 127.0.0.1:9960, local SQLite, extra logging disabled, legacy external notice_url still present. Loopback restricts inbound connections; it does not restrict outbound traffic.
- `server/standalone_frontend/main.cpp`: startup loads local config, runs SQLite migrations and starts the Drogon service; optional debug console is off in the release preset.
- `server/vcpkg-configuration.json`: dependency registry baseline pinned; dependency safety and actual compiled files still need verification.
- `SECURITY.md`: upstream explicitly does not support forks/third-party deployments or certify the original client.
- `tools/patch_apk.py`: supports local HTTP and HTTPS; APK variant and its runtime behavior remain unverified.
- Our compile workflow uses a separate branch, standard GitHub-hosted runner and read-only contents permissions; no business credentials, game accounts, APK or proprietary assets should be committed or passed to it.

## Required before use

1. Build from reviewed source, record commit and SHA256 hashes, inspect dependency inventory and packaged binaries; review all build scripts and runtime networking paths.
2. Test on an isolated disposable system without personal files, browser sessions, password stores, API tokens, cloud drives or shared folders; do not run an unverified executable on the main Windows account. A separate ordinary Windows account is defense in depth, not a full sandbox.
3. Scan server files and APK locally with available security tools; no upload of private files to public scanners without permission.
4. Restrict network to the minimum; first test offline/loopback and confirm actual process connections, including legacy notice URLs, then allow only required local traffic. No router port forwarding, no firewall/Defender disabling, no new root CA installed on primary devices.
5. Keep fresh game identity separate; do not reuse Google/Facebook or business passwords, account transfer codes, device backups or personal app sessions. Prefer a spare isolated Android device, not the primary phone.
6. Validate start, login, summon, refill and persistence on a disposable save. Review residual risks before any installation on the user's primary equipment.

No new software installations on the user's Windows machine have been authorized. If adequate isolation cannot be achieved at zero incremental cost, pause deployment rather than weaken the gate.
