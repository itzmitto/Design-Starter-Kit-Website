# Design Starter Kit Website

A Gleam and Lustre project that will grow into a library of reusable UI components and complete design examples. Planned areas include buttons, cards, forms, navigation, animations, and loaders.

The browser application is written in Gleam and targets JavaScript. Lustre provides the frontend architecture. All authored styles use SCSS, compiled by Dart Sass to `assets/styles.css`; Lustre loads that stylesheet at `/styles.css`.

## Development

- `npm run dev` watches SCSS and starts the Lustre development server at <http://localhost:1234>.
- `npm run scss` compiles SCSS once.
- `npm run build` compiles SCSS and then builds the Lustre application.

Keep shared SCSS variables and mixins in `assets/_variables.scss` and `assets/_mixins.scss`. Future UI components should follow the existing Gleam/Lustre markup and SCSS class structure, with styles authored in SCSS rather than generated or handwritten CSS.

The homepage introduces the Buttons, Cards, and Forms component categories.

## Images

Use real, freely usable internet-sourced images, check each license, store the files in `assets/images/`, and document their credits in [IMAGE_SOURCES.md](IMAGE_SOURCES.md).
