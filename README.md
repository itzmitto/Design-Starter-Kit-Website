# Design Starter Kit Website

A Gleam and Lustre project that is growing into a library of reusable UI components and complete design examples. It currently includes previews for buttons, cards, and forms, with interactive filters and form controls.

The browser application is written in Gleam and targets JavaScript. Lustre provides the frontend architecture. All authored styles use SCSS, compiled by Dart Sass to `assets/styles.css`; Lustre loads that stylesheet at `/styles.css`.

## Development

- `npm run dev` watches SCSS and starts the Lustre development server at <http://localhost:1234>.
- `npm run scss` compiles SCSS once.
- `npm run build` compiles SCSS and then builds the Lustre application.

Install the npm dependencies with `npm install` and make sure Gleam is available on `PATH` or in `~/.local/bin`. The browser app targets JavaScript, so Erlang/OTP is not required for this workflow; install Erlang only if adding an Erlang-targeted app or dependency later.

SCSS is the only authored styling language. Keep design tokens, shared mixins, and library component rules in `assets/_variables.scss`, `assets/_mixins.scss`, and `assets/_library.scss`. Future UI components should use Gleam/Lustre for markup and interaction, with styles authored in SCSS; `assets/styles.css` is generated output and must not be edited by hand.

The library includes five button patterns, four card patterns, and four form controls. Its image card uses a locally stored Pexels image; the source and license are documented in [IMAGE_SOURCES.md](IMAGE_SOURCES.md).

## Images

Use real, freely usable internet-sourced images, check each license, store the files in `assets/images/`, and document their credits in [IMAGE_SOURCES.md](IMAGE_SOURCES.md).
