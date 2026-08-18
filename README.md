# EVE Online in X4

A mod for **X4: Foundations** that brings four pirate factions from EVE Online into the universe of X4.

## Features

- **Four new pirate factions**:
  - Angel Cartel
  - Blood Raiders
  - Guristas Pirates
  - Sansha's Nation
- **CONCORD bounty faction** that pays the player for destroying pirate ships.
- **No stations** are added for any of the new factions — they exist purely as roaming ships.
- **Pirates are hostile only to the player** and neutral to all other factions, so they never attack NPCs or trigger faction wars.
- **Dynamic spawn system** in the neutral sector **Heretic's End**:
  - Up to 10 active pirate groups at a time.
  - Group size: 2–5 ships.
  - First ship in every group is always a combat-capable S/M escort.
  - Inner zone (0–200 km): S/M ships only.
  - Outer zone (200–400 km): S/M ships plus a chance for one L/XL ship.
  - All ships use vanilla X4 ship generation, covering all DLC races (Argon, Paranid, Teladi, Split, Boron, Terran) with their race-appropriate equipment.
- **Faction-specific paint schemes** for the pirate groups.
- **CONCORD bounty rewards**:
  - S ship: 18,000 Cr
  - M ship: 125,000 Cr
  - L ship: 800,000 Cr
  - XL ship: 10,000,000 Cr

## Installation

1. Download the latest release archive from the GitHub Releases page.
2. Extract the `ptich_EVEonlineinX4` folder into your X4 `extensions/` directory.
3. Start a **new game** to ensure all MD scripts initialize correctly.

Example path:

```
Steam\steamapps\common\X4 Foundations\extensions\ptich_EVEonlineinX4\
```

## File Structure

```
ptich_EVEonlineinX4/
├── content.xml              # Mod metadata
├── logo.jpg                 # Workshop / game logo
├── README.md                # This file
├── CHANGELOG.md             # Version history
├── libraries/
│   ├── factions.xml         # Pirate + CONCORD faction definitions
│   └── icons.xml          # (legacy) custom icon definitions
├── md/
│   ├── EVE_Bounty.xml       # CONCORD bounty payment logic
│   ├── EVE_Init.xml         # Faction relations initialization
│   └── EVE_Spawner.xml    # Pirate group spawn logic
└── t/
    └── 0001-L044.xml      # English in-game text
```

## Development Notes

- **Language**: English only.
- **Compatibility**: Designed for the base game and all DLCs. DLC factions are only used as templates if they are active in the current universe.
- **Saves**: A new game is recommended after each major update, because MD script state may not migrate cleanly between versions.

## Author

ptich9km
