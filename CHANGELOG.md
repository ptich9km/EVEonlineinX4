# Changelog

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
