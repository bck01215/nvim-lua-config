# Neovim Shortcuts to Memorize

Based on your config: LazyVim (leader = `Space`), Snacks explorer/picker,
toggleterm (Claude Code / OpenCode), gitsigns.

## Your Custom Keymaps (highest value — you added these on purpose)

| Key | Action |
|---|---|
| `<leader>ac` | Toggle Claude Code floating terminal |
| `<leader>ao` | Toggle OpenCode floating terminal |
| `<leader>fA` | Save all open buffers |
| `<leader>gB` | Toggle inline git blame for current line |
| `<leader>bd` | Delete buffer, preserve window layout |
| `<leader>e` | Focus/toggle Snacks explorer (root dir) |
| `<S-CR>` (terminal mode) | Newline without submitting (great inside Claude/OpenCode) |

## File & Project Navigation

| Key | Action |
|---|---|
| `<leader><space>` | Find files (root dir) |
| `<leader>,` | Switch buffer |
| `<leader>/` | Grep search (live grep) |
| `<leader>e` | File explorer (your custom Snacks binding) |
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fg` | Git files |

## Code Navigation & Movement

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `<C-o>` / `<C-i>` | Jump back / forward in jumplist |
| `j` / `k` | Down/up (wraps visually on long lines) |
| `<C-u>` / `<C-d>` | Half page up/down |
| `n` / `N` | Next/prev search result (auto-centers) |
| `<esc>` | Clear search highlight |
| `*` / `#` | Search word under cursor fwd/back |

## Windows, Buffers & Tabs

| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Move between windows |
| `<C-Up/Down/Left/Right>` | Resize window |
| `<leader>-` | Split window below |
| `<leader>\|` | Split window right |
| `<leader>wd` | Delete/close window |
| `<leader>wm` / `<leader>uZ` | Zoom (maximize) current window |
| `<leader>uz` | Zen mode |
| `<S-h>` / `<S-l>` | Prev / next buffer |
| `[b` / `]b` | Prev / next buffer |
| `<leader>bb` / `` <leader>` `` | Switch to other (alt) buffer |
| `<leader>bd` | Delete buffer (your custom, layout-safe) |
| `<leader>bo` | Delete all other buffers |
| `<leader>bi` | Delete invisible buffers |
| `<leader>bD` | Delete buffer **and** window |
| `<leader><tab><tab>` | New tab |
| `<leader><tab>d` | Close tab |
| `<leader><tab>]` / `[` | Next / prev tab |
| `<leader><tab>o` | Close other tabs |

## Editing

| Key | Action |
|---|---|
| `<C-s>` | Save file (insert/normal/visual) |
| `<leader>fA` | Save **all** buffers (your custom) |
| `<A-j>` / `<A-k>` | Move line/selection down/up |
| `gcc` | Comment line |
| `gco` / `gcO` | Add comment below / above |
| `gc` (visual) | Comment selection |
| `<` / `>` (visual) | Indent/outdent, keeps selection |
| `<leader>cf` | Format buffer |
| `<leader>uf` | Toggle format-on-save |
| `<leader>uF` | Toggle format-on-save (buffer-local) |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename symbol |
| `<leader>K` | Run keywordprg (`K`) on word |
| `<leader>fn` | New file |
| `<leader>l` | Open Lazy plugin manager |
| `<leader>L` | LazyVim changelog |

## Search & Replace

| Key | Action |
|---|---|
| `<leader>/` | Grep in project |
| `<leader>sg` | Search grep (picker) |
| `<leader>sr` | Search & replace (if configured) |
| `*` / `#` | Search word under cursor fwd/back |

## Git

| Key | Action |
|---|---|
| `<leader>gB` | Toggle current-line blame (your custom — overrides LazyVim's "Git Browse") |
| `<leader>gg` | Open lazygit (root dir) |
| `<leader>gG` | Open lazygit (cwd) |
| `<leader>gl` | Git log (root dir, picker) |
| `<leader>gL` | Git log (cwd, picker) |
| `<leader>gb` | Git blame for current line (picker) |
| `<leader>gf` | Git file history (current file) |
| `<leader>gY` | Copy git browse URL to clipboard |
| `]h` / `[h` | Next/prev git hunk (gitsigns) |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghp` | Preview hunk |

## Terminal / AI Tools

| Key | Action |
|---|---|
| `<leader>ac` | Claude Code (float, your custom) |
| `<leader>ao` | OpenCode (float, your custom) |
| `<S-CR>` | Newline w/o submit in terminal (your custom) |
| `<C-/>` or `<C-_>` | Toggle/focus floating terminal (root dir) |
| `<leader>ft` | Open terminal (root dir) |
| `<leader>fT` | Open terminal (cwd) |
| `<C-\><C-n>` | Exit terminal mode to normal |

## Errors & Diagnostics (viewing errors)

| Key | Action |
|---|---|
| `<leader>cd` | Show diagnostics for current line (floating popup) |
| `]d` / `[d` | Next / prev diagnostic (any severity) |
| `]e` / `[e` | Next / prev **error** specifically |
| `]w` / `[w` | Next / prev **warning** specifically |
| `<leader>xx` | Trouble: all diagnostics (project-wide list) |
| `<leader>xX` | Trouble: diagnostics for current buffer only |
| `<leader>xL` | Trouble: location list |
| `<leader>xQ` | Trouble: quickfix list |
| `<leader>xt` | Trouble: TODO list |
| `<leader>xT` | Trouble: TODO/FIX/FIXME only |
| `<leader>cs` | Trouble: document symbols |
| `<leader>cS` | Trouble: LSP refs/defs (symbols) |
| `[q` / `]q` | Prev / next quickfix item |
| `<leader>xq` | Toggle quickfix window |
| `<leader>xl` | Toggle location list window |
| `<leader>ud` | Toggle diagnostics on/off |
| `<leader>ul` | Toggle line diagnostics display |
| Inside Trouble list | `<cr>` jump to item, `o` jump & stay, `q`/`<esc>` close |

Quick mental model: `<leader>cd` = "what's wrong *here*", `]e`/`[e` = "jump to next/prev error", `<leader>xx` = "show me everything wrong in the project."

## Useful Toggles (`<leader>u...`)

| Key | Action |
|---|---|
| `<leader>us` | Toggle spelling |
| `<leader>uw` | Toggle wrap |
| `<leader>uL` | Toggle relative line numbers |
| `<leader>ul` | Toggle line numbers |
| `<leader>uc` | Toggle conceal level |
| `<leader>ub` | Toggle light/dark background |
| `<leader>uh` | Toggle inlay hints |
| `<leader>uT` | Toggle treesitter highlighting |
| `<leader>uD` | Toggle dim (focus current paragraph) |
| `<leader>ur` | Redraw / clear search / update diff |

## Inspecting Code

| Key | Action |
|---|---|
| `<leader>ui` | Inspect highlight group under cursor |
| `<leader>uI` | Inspect treesitter tree under cursor |

## Misc

| Key | Action |
|---|---|
| `<leader>qq` | Quit all |
| `ZZ` | Save & quit |
| `<localleader>r` | Run current Lua file (in .lua files) |
</content>
