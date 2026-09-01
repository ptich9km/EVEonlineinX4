# EVE Online in X4

A mod for **X4: Foundations** that brings four pirate factions from EVE Online into the universe of X4.

## Features

- **Four new pirate factions**:
  - Angel Cartel
  - Blood Raiders
  - Guristas Pirates
  - Sansha's Nation
- **CONCORD bounty faction** pays both credits and CONCORD points for destroying pirate ships.
- **No stations** are added for any of the new factions — they exist purely as roaming ships.
- **Pirates are hostile only to the player** and neutral to all other factions, so they never attack NPCs or trigger faction wars.
- **Dynamic spawn system** in the neutral sector **Heretic's End**:
  - Up to 10 active pirate groups at a time.
  - Group size scaled by PLEX multiplier (x1–x10).
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
- **Extension Options menu** (`Extensions → EVE Online in X4`):
  - Toggle pirate spawning on/off.
  - Live CONCORD score display.
  - Spend CONCORD points to call abandoned S/M/L support warships.
  - **Roleplay faction selector** — cycle through playable X4 factions; support ships use that faction's hull pool (Xenon limited to player-pilotable F/B/PE/H).
  - **PLEX upgrades** — convert 100M Cr into PLEX to boost pirate group size multiplier (x2, x3, x5, x10).
  - **CONCORD Bounty Board** — subscribe, take/decline procedural bounty missions, earn CONCORD points.

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
│   └── icons.xml            # Custom icon definitions
├── md/
│   ├── EVE_Init.xml         # Faction relations initialization
│   ├── EVE_Loot.xml         # Mod-part loot drops
│   ├── EVE_Options.xml      # Extension Options menu + support ships + Bounty Board
│   └── EVE_Spawner.xml      # Pirate group spawn + CONCORD bounty logic
└── t/
    ├── 0001-L007.xml        # Russian
    ├── 0001-L033.xml        # English
    ├── 0001-L034.xml        # Spanish
    ├── 0001-L044.xml        # French
    ├── 0001-L049.xml        # German
    ├── 0001-L055.xml        # Portuguese
    ├── 0001-L081.xml        # Japanese
    ├── 0001-L086.xml        # Simplified Chinese
    ├── 0001-L088.xml        # Traditional Chinese
    └── 0001-L090.xml        # Brazilian Portuguese
```

## Development Notes

- **Languages**: Russian translation; English fallback placeholders for French, German, Spanish, Portuguese, Japanese, Simplified/Traditional Chinese, Brazilian Portuguese. Persian/Farsi is not supported by the game engine.
- **Compatibility**: Designed for the base game and all DLCs. DLC factions are only used as templates if they are active in the current universe.
- **Saves**: A new game is recommended after each major update, because MD script state may not migrate cleanly between versions.

## UI Notes (based on Enhanced Kill Credit)

Studied `Enhanced Kill Credit` for advanced SirNukes Simple Menu API usage. Key takeaways:

- **Text references in menu widgets**: Simple Menu API does **not** resolve `{page,id}` strings inside `Make_Text`/`Make_Button`/etc. Menu labels must be plain strings; `show_notification` can still use `{page,id}`.
- Available widgets:
  - `Make_Text` — `$text`, `$font`, `$color`, `$halign`, `$fontsize`, `$height`, `$minRowHeight`, `$colSpan`.
  - `Make_Button` — `$id`, `$width`, `$height`, `$scaling`, `$text = table[$text, $color, $halign]`, `$onClick`.
  - `Make_CheckBox` — `$id`, `$checked`, `$width`, `$height`, `$onClick`.
  - `Make_Slider` — `$id`, `$min`, `$max`, `$step`, `$start`, `$suffix`, `$readOnly`, `$onSliderCellConfirm`.
  - `Make_Dropdown` — `$id`, `$options`, `$startOption`, `$onDropDownConfirmed`; callback gets `event.param.$option` and `event.param.$option_index`.
  - `Make_EditBox` — `$id`, `$defaultText`, `$maxChars`, `$active`, `$onTextChanged`, `$onEditBoxDeactivated`.
- `Add_Row` can take `param="table[$selectable = false]"` to make a row non-interactive (good for spacers/headers).
- Refresh an open menu with `<signal_cue_instantly cue="md.Simple_Menu_API.Refresh_Menu"/>`.
- Callbacks read values from `event.param.$value`, `event.param.$checked`, `event.param.$option`, etc.
- Menu registration can be lost on UI reload; track registration state and re-register on `md.Simple_Menu_API.Reloaded`.
- Keep a separate static namespace cue for persistent UI state and config defaults.
- Build the menu with fallback defaults so it still renders even if main state is not initialized.

## Author

ptich9km
