# Changelog

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
