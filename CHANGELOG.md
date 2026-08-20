# Changelog

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
