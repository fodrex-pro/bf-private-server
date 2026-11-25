# Personal Windows setup (preparation only, 2026-11-25)

Scope: one personal local account, no public listener, no external account changes, no proprietary client or assets in GitHub. Windows x64 portable target. No WSL or Docker required on player PC.

## Resource configuration

The built-in starter overlay is preferable to changing code. In the extracted server directory set `plugins[0].config.server.balance_root` in config.json to `./balance`. Place this JSON at `balance/server/starter.json`:

```json
{"format":1,"gems":9999,"zel":10000,"karma":0,"items":[{"id":20000,"count":3}],"units":[]}
```

All six keys required. Source: server/gimuserver/forge/StarterPack.hpp and .cpp; Tutorial.cpp queues the gifts at tutorial completion, Present.cpp caps normal gem grants at 9999. Do not set a larger balance: source warns client counters can wrap. The native optional DebugCli has a `gems <n>` command, but the release preset disables the console and its command does not enforce the normal gem cap; if enabled in a personal build, use 9999 only, against the owned local save. Refill approach is not yet tested.

## Required local directories

- archive/: curated server data from the companion repository (obtain separately).
- mst/: decoded client tables from lawfully obtained game data.
- system/: tracked server configuration fixtures.
- game_content/: downloadable content and mst directories, obtained separately.
- gme.sqlite: created by the local server, never commit.

The portable release script requires a complete content inventory even with ContentMode None. Compile-only CI does not demonstrate startup or game compatibility. Android v2.19.6 patch tool exists, but the uploaded variant has not been validated against it. Default server bind 127.0.0.1:9960; for mobile connectivity later choose local-only transport, not public port forwarding.

## Acceptance tests (pending)

1. Windows x64 compilation succeeds and executable hash recorded.
2. DLLs and legal local content assembled; package checks pass.
3. Server starts locally, fresh account created.
4. Tutorial gifts claimed; gem balance 9999; summon subtracts expected amount.
5. Refill to 9999 locally and verify persistence after restart.
6. Verify Android client connects only to own server, using a fresh account.
