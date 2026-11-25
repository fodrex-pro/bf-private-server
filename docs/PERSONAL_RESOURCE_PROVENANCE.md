# Resource provenance review — 2026-11-25

Status: source references confirmed; no third-party asset archives downloaded or executed, no content validated.

- Upstream getting-started guide: https://github.com/joppe2001/bf-private-server/blob/main/docs/GETTING_STARTED.md — requires separately obtained decoded client tables and client content.
- BF Revive preservation inventory: https://bfrevive.net/bounty/ — identifies BluuArc's April 2022 archive as containing decoded and older client tables and Windows client assets.
- Original community announcement: https://www.reddit.com/r/bravefrontier/comments/ucngf1/a_gift_to_the_community_dropbox_link_with_the/ — provenance lead, not an integrity or licensing certificate.
- Companion curated data: https://github.com/joppe2001/bf-private-server-data — archive files, not the missing client MST tables.
- https://github.com/BluuArc/bfmt-data — transformed datamine for BFMT, not a drop-in substitute for the emulator's expected MST schema.

Acceptance: obtain lawfully accessible copies only; inspect directory listing, compare against personal-resource-inventory.json, verify JSON schemas and hash files before use. Do not upload game assets or APK to the public fork, do not run binaries or scripts supplied in archive, do not use external live game service as a dependency or probe it. No primary-device execution until security gate passes.

CI run 45642139246: build-tools setup passed, compilation ongoing when checked. Job log download unavailable while running; no exact compiler phase established. Existing workflow timeout 45 minutes; do not restart or change running build prematurely.
