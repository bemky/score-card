# ScoreCard

A tiny, offline-friendly score keeper for tabletop games. Players are columns, rounds are rows, and the totals are always visible at the bottom. It replaces the phone spreadsheet.

Everything lives in one static `index.html` (no build step, no dependencies, no network requests). Home-screen icons and `manifest.webmanifest` sit beside it.

## Using it

- Tap a player name in the header to rename it. Tap `+` at the end of the header to add a player, or `×` on a name to remove one.
- Tap a cell and type a score. Only numbers are accepted (integers or decimals, negatives allowed); anything else is stripped. A blank cell is not counted.
- On phones whose numeric keypad has no minus key, tap the `±` button in the totals bar while a cell is focused to flip its sign.
- Enter / Next moves to the next player, then to the first player of the next round. Typing in the last round adds a fresh empty one.
- Tap `×` at the end of a round to remove it, or `+ Add round` to add one. Removing something that has scores asks first.
- Totals update as you type, and the leader is highlighted.
- `Reset` offers "Clear scores" (keep players) or "Start over".

## Data

Scores are stored only in your browser's `localStorage` (key `scorecard:v1`). Nothing is sent anywhere. Clearing site data or switching browsers/devices starts fresh.

## Hosting

Serve the folder from any static host (GitHub Pages, Netlify, an nginx directory, ...). All paths are relative, so a subdirectory works. For local testing:

```sh
python3 -m http.server
```

## Add to home screen

- **iOS (Safari):** Share button, then "Add to Home Screen".
- **Android (Chrome):** menu (three dots), then "Install app" or "Add to Home screen".

## License

See `LICENSE`.
