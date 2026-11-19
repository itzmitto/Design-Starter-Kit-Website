# Project instructions

## Project direction
- Build this project with Gleam as the primary programming language and Lustre as the frontend framework.
- Target JavaScript for browser-facing code.
- Do not introduce React, Next.js, Astro, TypeScript frameworks, or another frontend framework.
- Keep changes scoped to this repository and follow the existing Gleam and Lustre conventions.

## Scope and implementation
- Make only the changes requested for the current task. Do not expand a starter task into a complete website or a large component catalogue.
- Prefer small, readable Gleam modules and Lustre's documented APIs.
- Keep static styles and assets under `assets/`.
- Do not install or download dependencies unless the user explicitly requests it.
- SCSS, compiled with Dart Sass, is the project's only authored styling language. Do not add Tailwind, CSS-in-JS, CSS frameworks, or styled-components.
- Keep reusable SCSS tokens and spacing values in `assets/_variables.scss`, mixins in `assets/_mixins.scss`, and shared library styles in `assets/_library.scss`; author browser styles in SCSS partials or `assets/styles.scss`. Treat generated `assets/styles.css` as build output and never edit it by hand.
- Future components should use Gleam/Lustre for markup and follow the established component class and SCSS organization.

## Images and licensing
- Use real internet-sourced images that are free to use under a clearly checked license.
- Save image files locally under `assets/images/`; do not hotlink them at runtime.
- Record each image's local filename, creator, source URL, license, and access date in `IMAGE_SOURCES.md`.
- Do not create generated SVG illustrations or SVG placeholders. Use real, freely usable internet images saved locally under `assets/images/`, and check and document each license and source.

## Verification
- Do not run installation, dependency download, or build commands unless the user asks.
- If verification is requested, state exactly which commands were run and report their results.
