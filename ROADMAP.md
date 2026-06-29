# Roadmap

Long-running items that aren't ready to be a ticket yet. Pull from here when
you have time + the context to scope properly.

## Rebrand `-iamguarded` variants

**Status:** open, no timeline

`-iamguarded` is currently used as the suffix for our Bitnami-replacement
variants of upstream images (mirroring the `bitnami/bitnami-shell`-style
"opinionated hardened" packaging that some downstream Kubernetes charts pin
against). The name leaks the origin and isn't a great brand for a
nix-containers-maintained build.

**To figure out later:**

- Pick a new suffix — candidates: `-nix`, `-nx`, `-nc`, `-hardened`,
  `-secured`, `-base`, or even unsuffixed if the bare image already covers
  the same surface. Want something short, lowercase, dash-prefixed, and
  unmistakably ours.
- Decide whether to keep `-iamguarded` as an alias during a transition
  window (so chart consumers can switch at their own pace) or hard-cut.
- Update `chart-image-mapping.nix`, `IMAGE-POPULARITY.md`, the website's
  variant-folding suffix list (`_POPULARITY_VARIANT_SUFFIXES` in
  `website/render.py`), and any chart values files that pin the suffix.
- Plan a deprecation note + redirect in the per-image page on the website
  so existing pull commands keep working until the alias retires.

Touches ~330 image directories today (everything under `images/*-iamguarded*/`).
