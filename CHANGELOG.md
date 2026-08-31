# Changelog

## [2.52] - 2026-08-31

### Added
- **CONCORD Bounty Board** in the Extension Options menu:
  - Players can subscribe to / leave the bounty program.
  - Up to 4 procedurally generated missions are offered at a time (kill S/M/L/XL ships, destroy a pirate group, or destroy an officer fleet).
  - Missions auto-refresh every 30 minutes and expire after 2 hours.
  - Taking a mission moves it to the active list; progress updates from pirate kills and destroyed groups.
  - Rewards are paid in CONCORD points.
- Mission progress hooks in `md/EVE_Spawner.xml`: single kills report ship class and officer status; wiped groups report a group kill.

### Changed
- Shortened `content.xml` description and added mention of the CONCORD Bounty Board and PLEX upgrades.
- Extension Options menu labels for the Bounty Board now use plain English strings because SirNukes Simple Menu API does not resolve `{page,id}` references in menu widgets.

## [2.50] - 2026-08-27

### Added
- **PLEX currency and group-size upgrades**: players can now convert excess credits (100M Cr) into PLEX and spend PLEX to increase pirate group sizes (x2, x3, x5, x10).
- New **PLEX Upgrades** section in the Extension Options menu showing PLEX balance, a "Buy 1 PLEX" button and a group-size upgrade button.
- Added English placeholder localizations for the new PLEX texts in all supported language files; Russian translation included.

### Changed
- Pirate groups now spawn **only while the player is in Heretic's End**. This prevents the sector from filling up while the player is elsewhere or after multiple save/load cycles.
- Normal pirate group sizes are multiplied by the purchased PLEX multiplier; named officer fleets remain fixed at 8–12 ships.

## [2.26] - 2026-08-26

### Added
- **Roleplay faction selector** in the Extension Options menu. Players can cycle through playable X4 factions; CONCORD support ships are now spawned from the selected faction's ship pool.
- Xenon support ships use a hard-coded pool of the only player-pilotable Xenon hulls: S (Fighter), M (B / PE corvettes), L (H terraformer).
- DLC factions (Split, Boron, Terran) are included in the cycle; missing DLCs automatically fall back to Argon.
- English placeholder localizations for **Portuguese (55)**, **Japanese (81)**, **Simplified Chinese (86)** and **Traditional Chinese (88)**. Persian/Farsi is not supported by the game, so no stub was created.

## [2.25] - 2026-08-26

### Fixed
- **Support ship purchases no longer consume CONCORD points before the ship is actually spawned.** In `md/EVE_Options.xml` the score is now deducted only after a valid spawn position and ship definition are found. If `create_ship` fails for any reason, the points are refunded.
- **Eliminated duplicate CONCORD bounty payouts after reloading a save.** Added `global.$EVEonlineinX4.$SpawnerInitialized` guard to the `Data` cue in `md/EVE_Spawner.xml` so the bounty listener and spawn ticks are registered only once per game.

## [2.21] - 2026-08-21

### Fixed
- Support ships now spawn **next to the player's ship** instead of at the sector centre by using `object="player.occupiedship"` in `get_safe_pos`.

## [2.20] - 2026-08-21

### Fixed
- Fixed `$Size.knownname` crash when calling a support ship; size label is now resolved manually (S/M/L).
- Added debug logging to `Call_Support` to diagnose ship-spawn failures.
- Replaced empty `Add_Row` spacers with empty `Make_Text` widgets so they actually render in the Options menu.

## [2.19] - 2026-08-21

### Changed
- Extension Options menu title changed to **ptich9km: EVE Online in X4**.
- Added visual spacers in the Options menu to separate the spawn toggle, CONCORD score and support-ship sections.

## [2.18] - 2026-08-21

### Fixed
- **Extension Options menu now displays readable English text** instead of `readtext` codes. SirNukes Simple Menu API does not resolve `{page,id}` strings in menu widgets, so the labels are passed as plain strings.

## [2.17] - 2026-08-21

### Added
- **Extension Options menu** (`md/EVE_Options.xml`) using SirNukes Simple Menu API:
  - Toggle to **enable/disable pirate spawning** in Heretic's End (default: ON).
  - Live display of current **CONCORD score**.
  - Spend CONCORD points to call an **abandoned support warship** near the player:
    - S-class warship — 10 points.
    - M-class warship — 25 points.
    - L-class warship — 100 points.
- **CONCORD score system**: earn points for destroying EVE pirate ships.
  - Regular pirate — 1 point.
  - Soldier/Officer-preset ships — 2 points.
  - Named officer fleets — 3 points.
- New localization strings (IDs 200–230) for the options menu in `t/0001-L044.xml`, `t/0001-L007.xml`, `t/0001-L033.xml` and `t/0001-L049.xml`.
- Added `md/EVE_Options.xml` to `build_mod.sh` copy list.

## [2.16] - 2026-08-21

### Changed
- Added proper **Russian, French and German descriptions** inside `content.xml` for Steam Workshop language entries.

## [2.15] - 2026-08-21

### Added
- **Russian language support**: added `t/0001-L007.xml` with full translations for faction names, descriptions, prefixes and notifications.
- **French and German placeholders**: added `t/0001-L033.xml` and `t/0001-L049.xml` with English fallback text to prevent `readtext...` errors for those languages until proper translations are added.
- Added `<text language="7"/"33"/"49"/>` entries to `content.xml` so Steam shows the mod as supporting Russian, French and German.

## [2.14] - 2026-08-20

### Changed
- **High-preset officer groups**: the first ship is now always an **L or XL military commander** (70% L, 30% XL); remaining ships are S/M military escorts.
- Removed accidental XL-only chance from high-preset officer big-ship logic; big-ship fallback is now only used for low/medium outer-zone spawns.

## [2.13] - 2026-08-20

### Changed
- **Officer and named-officer fleets now use military-only ship definitions** via `get_ship_definition` with `tag.military`.
- **Named officer fleets** (8–12 ships) now always spawn:
  - XL military flagship.
  - L military heavy ship.
  - Extra random L/XL military ships in slots 3–4.
  - Remaining slots are random military S/M/L ships.
- **High-preset officer groups** (2–5 ships) now always include at least one L/XL military ship; first ship is always a military S/M escort.
- Civilian/builder/supply XL ships can no longer appear as named-officer flagships.

## [2.12] - 2026-08-20

### Changed
- **Loot drops now behave like normal ship loot**: mod parts spawn as collectable containers in space at the wreck's location instead of being added directly to the player inventory.
- **Loot is restricted to officer/named-officer fleets** spawned by the mod:
  - Regular EVE pirate groups no longer drop mod parts.
  - Officer fleets (`Officer` / named-officer prefix) have a 60% base chance to drop one mod part.
  - Debug flag forces a 100% drop chance for testing.
- `md/EVE_Spawner.xml` now stores an `$IsOfficer` flag for every spawned ship so `md/EVE_Loot.xml` can identify officer kills reliably.

## [2.11] - 2026-08-20

### Added
- **Rare named officer fleets** with a 5% spawn chance:
  - Group size 8–12 ships led by an XL flagship.
  - Named officer per faction (e.g. `Domni Avasarala`, `Arak Nirak`).
  - Elite loadout (0.85–1.00) and 400% CONCORD bounty.
  - Special notification when an officer fleet spawns.
- **Loot drops**: destroyed EVE pirate ships have a 15% chance to drop a random ship mod part (T1–T3 engine/shield/hull/weapon mods plus generic parts).
- `md/EVE_Loot.xml` handles mod-part drops.
- Debug flags in `md/EVE_Spawner.xml` and `md/EVE_Loot.xml` to force officer spawns / loot drops for testing.

## [2.10] - 2026-08-20

### Added
- **Loadout presets** for pirate groups:
  - **Pirate** (Low, 40% chance): weak loadout (0.15–0.35), 50% bounty.
  - **Soldier** (Medium, 40% chance): standard loadout (0.45–0.65), 100% bounty.
  - **Officer** (High, 20% chance): elite loadout (0.80–1.00), 200% bounty.
- Preset is shown as a prefix in the ship name on the map (e.g. `Pirate Nova`, `Soldier Minotaur`, `Officer Behemoth`).
- CONCORD bounty notification now includes the preset prefix.

### Changed
- Moved bounty logic into `md/EVE_Spawner.xml` so it can read the per-ship preset table reliably.
- Removed standalone `md/EVE_Bounty.xml`.

## [2.00] - 2026-08-18

### Added
- Pirate group spawning now covers **all X4 ship sizes** (S, M, L, XL) and **all DLC races** (Argon, Paranid, Teladi, Split, Boron, Terran) using vanilla ship generation.
- **Spawn zones** in Heretic's End:
  - 0–200 km from sector centre: S/M ships only.
  - 200–400 km from sector centre: S/M ships plus a chance for one L/XL ship.
- **Guaranteed escort**: the first ship in every group is always a combat-capable S/M ship.
- **CONCORD bounty for XL ships**: 10,000,000 Cr.
- New `logo.jpg` (512×512) featuring an X4 space background, the mod title, and icons for all four pirate factions.

### Changed
- Replaced fixed ship macros and custom loadouts with vanilla `<select faction="..." size="..."/>` generation. This ensures DLC-specific ships only use their race-appropriate equipment.
- Increased spawn radius range from 50–200 km to 10–400 km.
- Faction menu icons now use the vanilla **Buccaneers** icon for all five new factions.

### Removed
- Custom `libraries/loadouts.xml` and faction-specific weapon loadouts.

## [1.00] - 2026-08-13

### Added
- Initial release.
- Four EVE Online pirate factions: Angel Cartel, Blood Raiders, Guristas Pirates, Sansha's Nation.
- CONCORD bounty faction that pays for destroyed pirate ships.
- Periodic spawn of pirate groups in Heretic's End.
- Pirate factions are hostile only to the player; all other factions are neutral to them.
- Faction-specific paint schemes (Cobalt, Cardinal, Saffron, Sage).
- English localization.
