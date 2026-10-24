# LabHouse fork notes

Fork of `phosphor_flutter` 2.1.0. Upstream's `PhosphorIconData extends IconData`
no longer compiles because `IconData` is a final class in Flutter 3.47.

Changes against upstream:

- Icons are plain `IconData` constants (`PhosphorIconData` is a typedef kept for
  source compatibility). `PhosphorFlatIconData` / `PhosphorDuotoneIconData` are gone.
- Duotone icons are `IconData` in the `PhosphorDuotone` font. `PhosphorIcon`
  draws the second layer by looking the code point up in
  `lib/src/phosphor_duotone_secondary.dart`. Passing a duotone icon to a plain
  `Icon` shows only the primary layer, as before.
- Minimum Dart SDK raised to 3.0.

Drop this fork once upstream ships a Flutter 3.47 compatible release.
