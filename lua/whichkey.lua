-- TODO: set up whichkey
-- groupings of keys with <leader>
-- -------------------------------
-- d(ebug)
-- g(it)
-- c(omment)
-- s(urround)
-- f(ind) (telescope)
-- l(sp) (language server stuff + autocomplete)
-- e(xplorer) (file explorer)
-- m(ove) between windows/buffers
-- resizing
-- -------------------------------

local wk = require("which-key")

wk.register({
  f = {
    name = "find",                                    -- optional group name
    f = {
      "<cmd>Telescope find_files<cr>",                -- command to run
      "Find File"                                     -- name to display
    },
    B = {
      "<cmd>Telescope buffers<cr>",                   -- fuzzy search over all open buffer names
      "Find Open Buffer"
    },
    g = {
      "<cmd>Telescope grep_string<cr>",               -- fuzzy search over all project files
      "Grep in all project files"
    },
    G = {
      "<cmd>Telescope current_buffer_fuzzy_find<cr>", -- fuzzy search in current open buffer
      "Grep in current buffer only"
    },
    b = {                                             -- fuzzy search git branches
      "<cmd>Telescope git_branches<cr>",
      "Find git branch"
    },
    c = {                                             -- fuzzy search git commits
      "<cmd>Telescope git_commits<cr>",
      "Find git commit"
    },
    m = {
      "<cmd>Telescope man_pages<cr>",                 -- fuzzy search man pages
      "Find man page"
    },
    h = {
      "<cmd>Telescope help_tags<cr>",                 -- fuzzy search vim help tags (:h <tag>)
      "Find neovim help"
    },
  },
  -- s = {                    -- TODO: find way to use tpop/surround plugin with which-key
  --   -- name = "surround",
  --   "<cmd>Yssurround",
  --   "Surround"
  -- }
},
{ prefix = "<leader>" }                -- <leader> should be pressed before any of the other keys)
)

