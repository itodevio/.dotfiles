lvim.leader = "space"

-- set SHIFT + l to go to next window in buffer (like from explorer to code)
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- set SHIFT + h to go to previous window in buffer (like from code to explorer)
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- set CONTROL + s to save
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"


lvim.builtin.which_key.mappings["r"] = { ":TroubleToggle<CR>", "TroubleToggle" }
lvim.builtin.which_key.mappings["v"] = { ":VimBeGood<CR>", "VimBeGood" }


