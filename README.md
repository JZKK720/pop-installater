# 智方云cubecloud

Windows desktop app-launch board. One-click access to local EXE programs and localhost URLs, with a glassmorphism UI.

![Platform](https://img.shields.io/badge/platform-Windows%20x64-blue)
![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Electron](https://img.shields.io/badge/electron-34-47848F)
![License](https://img.shields.io/badge/license-Elastic%20License%202.0-orange)

---

## Features

- Launch local EXE programs or `http://` URLs in one click
- Add, edit, delete app shortcuts with custom icons, tags, and tile colors
- Glassmorphism frosted-glass UI with deep-blue panel
- Persistent data in `%AppData%` — survives reinstalls
- Minimize to system tray, restore on double-click
- NSIS installer with Start Menu and Desktop shortcuts

---

## Installation

### Download (recommended)

1. Go to [Releases](../../releases/latest)
2. Download `智方云cubecloud Setup 1.0.0.exe`
3. Run the installer — choose install directory, click Install
4. Launch from Start Menu or Desktop shortcut: **智方云cubecloud**

**Requirements:** Windows 10 / 11, x64

---

## Development

### Setup

```bash
git clone https://github.com/JZKK720/pop-installater.git
cd pop-installater
npm install
```

### Run

```bash
npm start
```

### Build installer

```bash
npm run build
# Output: dist/智方云cubecloud Setup 1.0.0.exe
```

---

## Data & Storage

All user data is stored in `%AppData%\智方云cubecloud\`:

| Path | Contents |
|---|---|
| `apps.json` | App list (name, path, icon, tag, color) |
| `icons/` | Uploaded icon images |

Default apps and icons are seeded from the bundle on first launch.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Desktop shell | Electron 34 |
| Frontend | Vanilla HTML / CSS / JS |
| IPC bridge | `contextBridge` + `preload.js` |
| Packaging | electron-builder, NSIS, Windows x64 |

---

## License

© 2026 智方云 cubecloud.io. Released under the [Elastic License 2.0](LICENSE).

Free to use. Source available. Branding and trademark belong to 智方云 cubecloud.io — you may not alter, remove, or redistribute under a different name or brand.
