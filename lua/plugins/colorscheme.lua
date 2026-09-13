-- "forest" is a plain colors/forest.lua (no plugin), ported from the iTerm2 "Forest"
-- preset + the matching VSCode theme's syntax colors. Registering it as a fake
-- zero-dependency "plugin" just lets LazyVim's `opts.colorscheme` pick it up normally.
return {
  { "LazyVim/LazyVim", opts = { colorscheme = "forest" } },
}
