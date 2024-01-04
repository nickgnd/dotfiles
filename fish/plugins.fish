#!/usr/bin/env fish

if not type -q fisher
  echo 'Error: fisher is not installed.' >&2
  return 1
end

# It requires `fzf`, `fd``, and `bat` too…
fisher install PatrickF1/fzf.fish
