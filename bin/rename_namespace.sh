#!/usr/bin/env bash
set -euo pipefail
# Rename Hanami:: -> Hanami2:: across lib/ AND spec/, EXCEPT references to the
# shared gems that are NOT forked and keep the Hanami:: namespace:
#   hanami-utils   (Hanami::Utils)
#   hanami-assets  (Hanami::Assets)
#   hanami-helpers (Hanami::Helpers)
# Note: Hanami::View::Helpers and Hanami::Middleware ARE part of the forked gems
# and DO get renamed — only the three top-level shared namespaces are preserved.
#
# Uses perl (macOS/BSD sed doesn't support \b word boundaries). Idempotent.
# Still does NOT rewrite top-level `Hanami.method` calls (e.g. Hanami.bundled?);
# fix those by hand after — `grep -rn 'Hanami' lib spec` then Hanami. -> Hanami2.
find lib spec -name '*.rb' -print0 2>/dev/null | xargs -0 perl -pi -e \
  's/\bHanami::(?!(?:Utils|Assets|Helpers)\b)/Hanami2::/g; s/\bmodule Hanami\b/module Hanami2/g; s/\bclass Hanami\b/class Hanami2/g'
