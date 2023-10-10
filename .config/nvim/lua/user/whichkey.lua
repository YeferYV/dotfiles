local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "<Plug>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",
  ["v"] = "which_key_ignore", -- vertical ToggleTerm
  ["V"] = "which_key_ignore", -- horizontal ToggleTerm
  ["<Tab>"] = { "which_key_ignore" },
  ["<S-Tab>"] = { "which_key_ignore" },

  ["'"] = { "<Cmd>Telescope marks initial_mode=normal<CR>", "Marks" },

  b = {
    name = "Buffer",
    b = {
      function()
        require('telescope.builtin').buffers(
          require('telescope.themes').get_cursor {
            previewer = false,
            initial_mode = 'normal'
          })
      end,
      "Telescope Buffer cursor-theme"
    },
    B = {
      function()
        require('telescope.builtin').buffers(
          require('telescope.themes').get_dropdown {
            previewer = false,
            initial_mode = 'insert'
          })
      end,
      "Telescope Buffer"
    },
    C = { "<cmd>%bd|e#|bd#<cr>", "Close others Buffers" },
    s = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
    f = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
    S = { "<cmd>BufferLineMovePrev<cr>", "Move to Previous Buffer" },
    F = { "<cmd>BufferLineMoveNext<cr>", "Move to Next Buffer" },
    t = {
      function()
        vim.cmd [[ enew ]]
        vim.cmd [[ BufferlineShow ]]
      end,
      "New buffer"
    },
    ["<TAB>"] = {
      function()
        vim.cmd [[ setlocal nobuflisted ]]
        vim.cmd [[ bprevious ]]
        vim.cmd [[ tabe # ]]
        vim.cmd [[ BufferlineShow ]]
      end,
      "buffer to Tab"
    },
    -- T = {
    --   function()
    --     vim.cmd [[ bufdo | :setlocal nobuflisted | :b# | :tabe # ]]
    --     vim.cmd [[ BufferlineShow ]]
    --   end,
    --   "buffers to Tab"
    -- },
    v = { "<cmd>vertical ball<cr>", "Buffers to vertical windows" },
    V = { "<cmd>belowright ball<cr>", "Buffers to horizontal windows" },
    x = { "<cmd>:bp | bd #<cr>", "Close Buffer" },
    [";"] = { "<cmd>buffer #<cr>", "Recent buffer" },
  },

  [";"] = {
    name = "Tabs",
    C = { "<cmd>tabonly<cr>", "Close others Tabs" },
    n = { "<cmd>tabnext<cr>", "Next Tab" },
    p = { "<cmd>tabprevious<cr>", "Previous Tab" },
    N = { "<cmd>+tabmove<cr>", "move tab to next tab" },
    P = { "<cmd>-tabmove<cr>", "move tab to previous tab" },
    t = {
      function()
        vim.cmd [[ tabnew ]]
        vim.cmd [[ BufferlineShow ]]
      end,
      "New Tab"
    },
    x = { "<cmd>tabclose<cr>", "Close Tab" },
    -- ["!"] = { "<cmd>tabmove 0<cr>", "move to #1 tab" },
    -- ["("] = { "<cmd>tabmove $<cr>", "move to last tab" },
    -- [":"] = { "<cmd>tabmove #<cr>", "move to recent tab" },
    ["1"] = { "<cmd>tabnext 1<cr>", "go to #1 tab" },
    ["2"] = { "<cmd>tabnext 2<cr>", "go to #2 tab" },
    ["3"] = { "<cmd>tabnext 3<cr>", "go to #3 tab" },
    ["4"] = { "<cmd>tabnext 4<cr>", "go to #4 tab" },
    ["5"] = { "<cmd>tabnext 5<cr>", "go to #5 tab" },
    ["6"] = { "<cmd>tabnext 6<cr>", "go to #6 tab" },
    ["7"] = { "<cmd>tabnext 7<cr>", "go to #7 tab" },
    ["8"] = { "<cmd>tabnext 8<cr>", "go to #8 tab" },
    ["9"] = { "<cmd>tabnext 9<cr>", "go to #9 tab" },
    [";"] = { "<cmd>tabnext #<cr>", "Recent Tab" },
    ["<Tab>"] = { "<cmd>tabprevious<cr>", "Previous Tab" },
    ["<S-Tab>"] = { "<cmd>tabnext<cr>", "Next Tab" },
  },

  c = {
    name = "Compiler",
    b = { "<cmd>!bash %<cr>", "Exec with bash" },
    c = { "<cmd>w! | !compiler '<c-r>%'<cr>", "Exec with compiler" },
    p = { "<cmd>!python %<cr>", "Exec with python" },
    o = { "<cmd>!$HOME/.local/bin/i3cmds/opout %<cr><cr>", "Output Document" },
  },

  d = {
    name = "Debugger",
    b = { function() WhichkeyRepeat("lua require'dap'.toggle_breakpoint()") end, "Toggle Breakpoint" },
    B = { function() WhichkeyRepeat("lua require'dap'.clear_breakpoints()") end, "Clear Breakpoints" },
    c = { function() WhichkeyRepeat("lua require'dap'.continue()") end, "Start/Continue" },
    h = { function() WhichkeyRepeat("lua require'dap.ui.widgets'.hover()") end, "Debugger Hover" },
    i = { function() WhichkeyRepeat("lua require'dap'.step_into()") end, "Step Into" },
    l = { function() WhichkeyRepeat("lua require'dap'.run_last()") end, "Run last" },
    o = { function() WhichkeyRepeat("lua require'dap'.step_over()") end, "Step Over" },
    O = { function() WhichkeyRepeat("lua require'dap'.step_out()") end, "Step Out" },
    q = { function() require 'dap'.close() end, "Close Session" },
    Q = { function() require 'dap'.terminate() end, "Terminate Session" },
    p = { function() WhichkeyRepeat("lua require'dap'.pause()") end, "Pause" },
    r = { function() WhichkeyRepeat("lua require'dap'.restart_frame()") end, "Restart" },
    R = { function() WhichkeyRepeat("lua require'dap'.repl.toggle()") end, "Toggle REPL" },
    u = { function() WhichkeyRepeat("lua require'dapui'.toggle()") end, "Toggle Debugger UI" },
  },

  ["f"] = {
    function()
      require('telescope.builtin').find_files(
        require('telescope.themes').get_dropdown {
          previewer = false
        })
    end,
    "Find Files",
  },

  ["h"] = { "<cmd>noh<cr>", "NoHighlight" },
  ["e"] = { "<cmd>lua _G.neotree_blend=false<cr><cmd>Neotree toggle left<cr>", "Neotree Toggle" },
  ["o"] = { "<cmd>lua _G.neotree_blend=true<cr><cmd>Neotree focus<cr>", "Neotree focus" },
  ["."] = { "<cmd>Telescope resume<cr>", "Telescope resume" },
  ["q"] = {
    function()
      _G.neotree_blend = true
      vim.cmd [[ Neotree filesystem reveal float ]]
      vim.cmd [[ hi NeoTreeTabInactive guibg=none ]]
      vim.cmd [[ hi NeoTreeTabSeparatorInactive guibg=none ]]
    end,
    "Neotree float"
  },

  g = {
    name = "Git",
    g = {
      function()
        _LAZYGIT_TOGGLE()
        vim.cmd [[ BufferlineShow ]]
      end,
      "Tab Lazygit"
    },
    G = { function() _LAZYGIT_FLOAT_TOGGLE() end, "Float Lazygit" },
    L = { "<cmd>terminal lazygit<cr><cmd>set ft=tab-terminal<cr>", "Buffer Lazygit" },
    j = { function() WhichkeyRepeat("lua require 'gitsigns'.next_hunk()") end, "Next Hunk" },
    k = { function() WhichkeyRepeat("lua require 'gitsigns'.prev_hunk()") end, "Prev Hunk" },
    l = { function() WhichkeyRepeat("lua require 'gitsigns'.blame_line()") end, "Blame" },
    p = { function() WhichkeyRepeat("lua require 'gitsigns'.preview_hunk()") end, "Preview Hunk" },
    r = { function() WhichkeyRepeat("lua require 'gitsigns'.reset_hunk()") end, "Reset Hunk" },
    R = { function() WhichkeyRepeat("lua require 'gitsigns'.reset_buffer()") end, "Reset Buffer" },
    s = { function() WhichkeyRepeat("lua require 'gitsigns'.stage_hunk()") end, "Stage Hunk" },
    u = { function() WhichkeyRepeat("lua require 'gitsigns'.undo_stage_hunk()") end, "Undo Stage Hunk" },
    o = { function() WhichkeyRepeat("Gitsigns diffthis HEAD") end, "Open ChangedFile/Diff" },
    O = { "<cmd>Telescope git_status initial_mode=normal<cr>", "Open All ChangedFile/Diff" },
    b = { "<cmd>Telescope git_branches initial_mode=normal<cr>", "Checkout Branch" },
    c = { "<cmd>Telescope git_commits initial_mode=normal<cr>", "Checkout Commit" },
  },

  l = {
    name = "LSP",
    A = { function() WhichkeyRepeat("lua vim.lsp.buf.code_action()") end, "Code Action" },
    c = { "<cmd>Telescope lsp_incoming_calls initial_mode=normal<cr>", "Telescope incoming calls" },
    C = { "<cmd>Telescope lsp_outgoing_calls initial_mode=normal<cr>", "Telescope outgoing calls" },
    d = { function() WhichkeyRepeat("lua vim.lsp.buf.definition()") end, "Goto Definition" },
    D = { function() WhichkeyRepeat("lua vim.lsp.buf.declaration()") end, "Goto Declaration" },
    F = { function() WhichkeyRepeat("lua vim.lsp.buf.format()") end, "Format" },
    h = { function() WhichkeyRepeat("lua vim.lsp.buf.hover()") end, "Hover" },
    H = { function() WhichkeyRepeat("lua vim.lsp.buf.signature_help()") end, "Signature" },
    I = { function() WhichkeyRepeat("lua vim.lsp.buf.implementation()") end, "Goto Implementation" },
    L = { function() WhichkeyRepeat("lua vim.lsp.codelens.run()") end, "CodeLens" },
    n = { function() WhichkeyRepeat("lua vim.diagnostic.goto_next()") end, "Next Diagnostic", },
    o = { function() WhichkeyRepeat("lua vim.diagnostic.open_float()") end, "Open Diagnostic" },
    p = { function() WhichkeyRepeat("lua vim.diagnostic.goto_prev()") end, "Prev Diagnostic", },
    q = { function() WhichkeyRepeat("lua vim.diagnostic.setloclist()") end, "Diagnostic List" },
    Q = { "<cmd>Telescope loclist initial_mode=normal<cr>", "Telescope QuickFix LocList" },
    r = { function() WhichkeyRepeat("lua vim.lsp.buf.references()") end, "References" },
    R = { function() WhichkeyRepeat("lua vim.lsp.buf.rename()") end, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Telescope Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Telescope Dynamic Workspace Symbols", },
    T = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Telescope Workspace Symbols", },
    t = { function() WhichkeyRepeat("lua vim.lsp.buf.type_definition()") end, "Goto TypeDefinition" },
    v = { "<cmd>Telescope diagnostics<cr>", "Telescope View Diagnostics", },
    V = { "<cmd>Telescope lsp_references initial_mode=normal<cr>", "Telescope View References" },
    w = { "<cmd>Telescope lsp_implementations initial_mode=normal<cr>", "Telescope View Implementations" },
    W = { "<cmd>Telescope lsp_definitions initial_mode=normal<cr>", "Telescope View Definitions" },
    z = { "<cmd>AerialToggle<cr>", "Symbols outline" },
    Z = { "<cmd>AerialToggle float<cr>", "Symbols outline (float)" },
  },

  p = {
    name = "Peek LspSaga",
    a = { function() WhichkeyRepeat("Lspsaga code_action") end, "Code Action" },
    b = { function() WhichkeyRepeat("Lspsaga show_buf_diagnostics") end, "Show Buf Diagnostics" },
    c = { function() WhichkeyRepeat("Lspsaga incoming_calls") end, "Incomming Calls" },
    C = { function() WhichkeyRepeat("Lspsaga outgoing_calls") end, "outgoing Calls" },
    d = { function() WhichkeyRepeat("Lspsaga peek_definition") end, "Peek Definition" },
    D = { function() WhichkeyRepeat("Lspsaga goto_definition") end, "Peek Definition" },
    f = { function() WhichkeyRepeat("Lspsaga lsp_finder") end, "Finder" },
    h = { function() WhichkeyRepeat("Lspsaga hover_doc") end, "Hover" },
    n = { function() WhichkeyRepeat("Lspsaga diagnostic_jump_next") end, "Next Diagnostics" },
    N = {
      function()
        WhichkeyRepeat('require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })')
      end,
      "Next Error"
    },
    o = { function() WhichkeyRepeat("Lspsaga show_line_diagnostics") end, "Show Line Diagnostics" },
    O = { function() WhichkeyRepeat("Lspsaga show_cursor_diagnostics") end, "Show Cursor Diagnostics" },
    p = { function() WhichkeyRepeat("Lspsaga diagnostic_jump_prev") end, "Prev Diagnostics" },
    P = {
      function()
        WhichkeyRepeat('require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })')
      end,
      "Prev Error"
    },
    r = { function() WhichkeyRepeat("Lspsaga term_toggle ranger") end, "Ranger" },
    R = { function() WhichkeyRepeat("Lspsaga rename") end, "Rename" },
    t = { function() WhichkeyRepeat("Lspsaga term_toggle") end, "Toggle Terminal" },
    z = { function() WhichkeyRepeat("Lspsaga outline") end, "Toggle outline" },
  },

  P = {
    name = "Packages",
    ["C"] = { "<cmd>Lazy clean<cr>", "Lazy Clean" },
    ["i"] = { "<cmd>Lazy install<cr>", "Lazy Install" },
    ["m"] = { "<cmd>Mason<cr>", "Mason Installer" },
    ["L"] = { "<cmd>LspInfo<cr>", "Lsp Info" },
    ["N"] = { "<cmd>NullLsInfo<cr>", "NullLs Info" },
    ["P"] = { "<cmd>Lazy profile<cr>", "Lazy Profile" },
    ["s"] = { "<cmd>Lazy<cr>", "Lazy Status" },
    ["S"] = { "<cmd>Lazy sync<cr>", "Lazy Sync" },
    ["U"] = { "<cmd>Lazy update<cr>", "Lazy Update" },
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope buffers initial_mode=normal<cr>", "Buffers" },
    B = { "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Ripgrep" },
    c = {
      function()
        require('telescope.builtin').colorscheme({ enable_preview = true, initial_mode = 'normal' })
      end,
      "Colorscheme"
    },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    f = { "<cmd>Telescope grep_string search= theme=ivy<cr>", "Grep string" },
    F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Live Grep" },
    g = { "<cmd>Telescope git_files theme=ivy<cr>", "Git Files (hidden included)" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find Highlights" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    n = { "<cmd>Telescope neoclip initial_mode=normal<cr>", "NeoClip" },
    N = { "<cmd>Telescope notify initial_mode=normal<cr>", "Search notifications" },
    O = { "<cmd>lua require('notify').history()<cr>", "History notifications" },
    o = { "<cmd>Telescope file_browser initial_mode=normal<cr>", "Open File Browser" },
    -- O = {
    --   function()
    --     require 'telescope'.extensions.file_browser.file_browser({ path = vim.fn.expand('%:p:h') })
    --   end,
    --   "Open FileBrowser (cwd)"
    -- },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    q = { "<cmd>Telescope quickfixhistory initial_mode=normal<cr>", "Telescope QuickFix History" },
    Q = { "<cmd>Telescope quickfix initial_mode=normal<cr>", "Telescope QuickFix" },
    r = { "<cmd>Telescope oldfiles initial_mode=normal<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers initial_mode=normal<cr>", "Registers" },
    s = { "<cmd>Telescope grep_string<cr>", "Grep string under cursor" },
    z = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end
      end,
      "Search symbols",
    },
    ["+"] = { "<cmd>Telescope builtin previewer=false initial_mode=normal<cr>", "More" },
    ["/"] = { "<cmd>Telescope find_files theme=ivy hidden=true<cr>", "Find files" },
    [";"] = { "<cmd>Telescope jumplist theme=ivy initial_mode=normal<cr>", "Jump List" },
    ["'"] = { "<cmd>Telescope marks theme=ivy initial_mode=normal<cr>", "Marks" },
  },

  S = {
    name = "Session",
    l = { "<cmd>SessionManager! load_last_session<cr>", "Load last session" },
    s = { "<cmd>SessionManager! save_current_session<cr>", "Save this session" },
    d = { "<cmd>SessionManager! delete_session<cr>", "Delete session" },
    f = { "<cmd>SessionManager! load_session<cr>", "Search sessions" },
    ["."] = { "<cmd>SessionManager! load_current_dir_session<cr>", "Load current directory session" },
  },

  t = {
    name = "Terminal",
    --   n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    --   u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    --   t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    --   p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    ["<TAB>"] = {
      function()
        vim.cmd [[ wincmd T ]]
        vim.cmd [[ BufferlineShow ]]
      end,
      "Terminal to Tab"
    },
    b = {
      function()
        vim.cmd [[ terminal ]]
        vim.cmd [[ startinsert | set ft=buf-terminal nonumber ]]
      end,
      "Buffer terminal (TabSame)"
    },
    B = {
      function()
        vim.cmd [[ tabnew|terminal ]]
        vim.cmd [[ startinsert | set ft=tab-terminal nonumber ]]
        vim.cmd [[ BufferlineShow ]]
      end,
      "Buffer Terminal (TabNew)"
    },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float ToggleTerm" },
    l = {
      function()
        _LF_TOGGLE(vim.api.nvim_buf_get_name(0), 'vsplit')
      end,
      "lf (TabSame)"
    },
    L = {
      function()
        _LF_TOGGLE(vim.api.nvim_buf_get_name(0), 'tabnew')
        vim.cmd [[ BufferlineShow ]]
      end,
      "lf (TabNew)"
    },
    r = {
      function()
        _LF_TOGGLE(vim.api.nvim_buf_get_name(0), 'tabreplace')
      end,
      "lf (TabReplace)"
    },
    t = { "<cmd>ToggleTerm <cr>", "Toggle ToggleTerm" },
    T = {
      function()
        vim.cmd [[ ToggleTerm direction=tab ]]
        vim.cmd [[ BufferlineShow ]]
      end,
      "Tab ToggleTerm"
    },
    -- H = { "<cmd>split +te  | resize 10          | setlocal ft=sp-terminal nonumber noruler laststatus=3 cmdheight=0 | startinsert<cr>", "Horizontal terminal (status-hidden)" },
    -- V = { "<cmd>vsplit +te | vertical resize 80 | setlocal ft=vs-terminal nonumber noruler laststatus=0 cmdheight=1 | startinsert<cr>", "Vertical terminal (status-hidden)" },
    H = { "<cmd>split +te | resize 10 | setlocal ft=sp-terminal<cr>", "Horizontal terminal" },
    V = { "<cmd>vsplit +te | vertical resize 80 | setlocal ft=vs-terminal<cr>", "Vertical terminal" },
    h = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Horizontal ToggleTerm" },
    v = { "<cmd>ToggleTerm direction=vertical   size=80<cr>", "Vertical ToggleTerm" },
    ["1h"] = { "<cmd>1ToggleTerm direction=vertical   <cr>", "Toggle first horizontal ToggleTerm" },
    ["1v"] = { "<cmd>1ToggleTerm direction=horizontal <cr>", "Toggle first vertical ToggleTerm" },
    ["2h"] = { "<cmd>2ToggleTerm direction=vertical   <cr>", "Toggle second horizontal ToggleTerm" },
    ["2v"] = { "<cmd>2ToggleTerm direction=horizontal <cr>", "Toggle second vertical ToggleTerm" },
    ["3h"] = { "<cmd>3ToggleTerm direction=vertical   <cr>", "Toggle third horizontal ToggleTerm" },
    ["3v"] = { "<cmd>3ToggleTerm direction=horizontal <cr>", "Toggle third vertical ToggleTerm" },
    ["4h"] = { "<cmd>4ToggleTerm direction=vertical   <cr>", "Toggle fourth horizontal ToggleTerm" },
    ["4v"] = { "<cmd>4ToggleTerm direction=horizontal <cr>", "Toggle fourth vertical ToggleTerm" },
    ["5h"] = { "<cmd>5ToggleTerm direction=vertical   <cr>", "Toggle fifth horizontal ToggleTerm" },
    ["5v"] = { "<cmd>5ToggleTerm direction=horizontal <cr>", "Toggle fifth vertical ToggleTerm" },
    ["6h"] = { "<cmd>6ToggleTerm direction=vertical   <cr>", "Toggle sixth horizontal ToggleTerm" },
    ["6v"] = { "<cmd>6ToggleTerm direction=horizontal <cr>", "Toggle sixth vertical ToggleTerm" },
    ["7h"] = { "<cmd>7ToggleTerm direction=vertical   <cr>", "Toggle seventh horizontal ToggleTerm" },
    ["7v"] = { "<cmd>7ToggleTerm direction=horizontal <cr>", "Toggle seventh vertical ToggleTerm" },
    ["8h"] = { "<cmd>8ToggleTerm direction=vertical   <cr>", "Toggle eighth horizontal ToggleTerm" },
    ["8v"] = { "<cmd>8ToggleTerm direction=horizontal <cr>", "Toggle eighth vertical ToggleTerm" },
    ["9h"] = { "<cmd>9ToggleTerm direction=vertical   <cr>", "Toggle ninth horizontal ToggleTerm" },
    ["9v"] = { "<cmd>9ToggleTerm direction=horizontal <cr>", "Toggle ninth vertical ToggleTerm" },
    ["0h"] = { "<cmd>0ToggleTerm direction=vertical   <cr>", "Toggle tenth horizontal ToggleTerm" },
    ["0v"] = { "<cmd>0ToggleTerm direction=horizontal <cr>", "Toggle tenth vertical ToggleTerm" },
  },

  u = {
    name = "UI Toggle",
    ["0"] = { "<cmd>set showtabline=0<cr>", "Hide Buffer" },
    ["1"] = { "<cmd>BufferlineShow<cr>", "Enable Buffer offset" },
    ["2"] = {
      function()
        require('bufferline').setup {
          options = {
            offsets = {},
            show_close_icon = false
          }
        }
      end,
      "Disable Buffer offset"
    },
    a = { "<cmd>Alpha<cr>", "Alpha (TabSame)" },
    A = { "<cmd>tabnew | Alpha<cr>", "Alpha (TabNew)" },
    b = { "<cmd>BufferlineShow<cr>", "Show Buffer" },
    B = {
      function()
        require('bufferline').setup {
          options = {
            offsets = { { filetype = 'neo-tree', padding = 1 } },
            show_close_icon = false,
            always_show_bufferline = false,
          }
        }
      end,
      "Hide Buffer (if < 2)" -- "Reset Buffer"
    },
    -- c = { "<cmd>Codi<cr>", "Codi Start"},
    -- C = { "<cmd>Codi!<cr>", "Codi Stop" },
    c = {
      function()
        local cmdheight = vim.opt.cmdheight:get()
        if cmdheight == 0 then
          vim.opt.cmdheight = 1
        else
          vim.opt.cmdheight = 0
        end
      end
      , "Toggle cmdheight"
    },
    C = { "<cmd>ColorizerToggle<cr>", "Toggle Colorizer" },
    d = {
      function()
        if vim.g.diagnostics_enabled then
          vim.diagnostic.disable()
          vim.g.diagnostics_enabled = false
        else
          vim.diagnostic.enable()
          vim.g.diagnostics_enabled = true
        end
      end,
      "Toggle Diagnostics"
    },
    G = {
      function()
        if vim.g.ToggleNormal == nil then
          vim.api.nvim_set_hl(0, "Normal", { bg = "#0b0b0b" })
          vim.g.ToggleNormal = true
        else
          vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
          vim.g.ToggleNormal = nil
        end
      end
      , "Toggle Background"
    },
    h = { function() require('user.autocommands').EnableAutoNoHighlightSearch() end, "Disable AutoNoHighlightSearch" },
    H = { function() require('user.autocommands').DisableAutoNoHighlightSearch() end, "Enable AutoNoHighlightSearch" },
    i = {
      function()
        local input_avail, input = pcall(vim.fn.input, "Set indent value (>0 expandtab, <=0 noexpandtab): ")
        if input_avail then
          local indent = tonumber(input)
          if not indent or indent == 0 then return end
          vim.bo.expandtab = (indent > 0)
          indent = math.abs(indent)
          vim.bo.tabstop = indent
          vim.bo.softtabstop = indent
          vim.bo.shiftwidth = indent
        end
      end,
      "Change Indent Setting"
    },
    I = { "<cmd>IndentBlanklineToggle<cr>", "Toggle IndentBlankline" },
    l = { "<cmd>set cursorline!<cr>", "Toggle Cursorline" },
    L = { "<cmd>setlocal cursorline!<cr>", "Toggle Local Cursorline" },
    -- n = { "<cmd>Neotree show<cr>", "Neotree show" },
    -- N = { "<cmd>Neotree close<cr>", "Neotree close" },
    m = { "<cmd>lua MiniMap.toggle()<cr>", "Toggle MiniMap" },
    p = { "<cmd>popup PopUp<cr>", "Toggle PopUp" },
    P = { function() vim.opt.paste = not vim.opt.paste:get() end, "Toggle Paste Mode" },
    o = { "<cmd>Legendary<cr>", "Open Legendary" },
    r = {
      function()
        _RESTO_TOGGLE()
        vim.cmd [[ BufferlineShow ]]
      end,
      "Rest Client"
    },
    s = {
      function()
        local laststatus = vim.opt.laststatus:get()
        if laststatus == 0 then
          vim.opt.laststatus = 2
        elseif laststatus == 2 then
          vim.opt.laststatus = 3
        elseif laststatus == 3 then
          vim.opt.laststatus = 0
        end
      end
      , "Toggle StatusBar"
    },
    -- u = {
    --   function()
    --     GoToParentIndent()
    --     vim.call("repeat#set", "0 uu")
    --   end,
    --   "Jump to current_context",
    -- },
    u = {
      function()
        WhichkeyRepeat(
          "normal! 0",
          "lua GoToParentIndent()"
        )
      end,
      "Jump to current_context",
    },
    v = {
      function()
        local function bool2str(bool) return bool and "on" or "off" end

        if vim.g.diagnostics_enabled then
          vim.g.diagnostics_enabled = false
        else
          vim.g.diagnostics_enabled = true
        end

        vim.diagnostic.config(require("user.lsp.handlers").setup(bool2str(vim.g.diagnostics_enabled)))
      end,
      "Toggle VirtualText"
    },
    -- w = { "<cmd>set winbar=%@<cr>", "enable winbar" },
    -- W = { "<cmd>set winbar=  <cr>", "disable winbar" },
    [";"] = { ":clearjumps<cr>:normal m'<cr>", "Clear and Add jump" }, -- Reset JumpList
  },

  w = {
    name = "Window",
    b = { "<cmd>call WinBufSwap()<cr>", "WinBufSwap (any node)" },
    B = { "<cmd>all<cr>", "Windows to buffers" },
    C = { "<C-w>o", "Close Other windows" },
    h = { "<C-w>H", "Move window to Leftmost" },
    j = { "<C-w>J", "Move window to Downmost" },
    k = { "<C-w>K", "Move window to Upmost" },
    l = { "<C-w>L", "Move window to Rightmost" },
    m = { "<C-w>_ | <c-w>|", "Maximize window" },
    n = { "<C-w>w", "Switch to next window CW " },
    N = { "<C-w>w<cmd>call SwitchWindow2()<cr>", "move to next window CW" },
    p = { "<C-w>W", "Switch to previous window CCW" },
    P = { "<C-w>W<cmd>call SwitchWindow2()<cr>", "Move to previous window CCW" },
    q = { "<cmd>qa<cr>", "Quit all" },
    s = { "<cmd>wincmd x<cr>", "window Swap CW (same parent node)" },
    S = { "<cmd>-wincmd x<cr>", "window Swap CCW (same parent node)" },
    r = { "<C-w>r", "Rotate CW (same parent node)" },
    R = { "<C-w>R", "Rotate CCW (same parent node)" },
    ["<TAB>"] = {
      function()
        vim.cmd [[ setlocal nobuflisted ]]
        vim.cmd [[ wincmd T ]]
        vim.cmd [[ BufferlineShow ]]
      end,
      "window to Tab"
    },
    v = { "<cmd>vsplit<cr>", "split vertical" },
    V = { "<cmd>split<cr>", "split horizontal" },
    w = { "<cmd>new<cr>", "New horizontal window" },
    W = { "<cmd>vnew<cr>", "New vertical window" },
    x = { "<cmd>wincmd q<cr>", "Close window" },
    [";"] = { "<C-w>p", "recent window" },
    [":"] = { "<C-w>p<cmd>call SwitchWindow2()<cr>", "Move to recent window" },
    ["="] = { "<C-w>=", "Reset windows sizes" },
  },
  y = {
    name = "second clipboard",
    ["p"] = { '"*p', "Paste After" },
    ["P"] = { '"*P', "Paste Before" },
    ["y"] = { '"*yg_', "Yank Forward" },
    ["Y"] = { '"*Y', "Yank Line" },
  },
  z = {
    name = "folding",
    ["j"] = { "zj", "next fold" },
    ["k"] = { "zk", "previous fold" },
    ["J"] = { "]z", "go to bottom of current fold" },
    ["K"] = { "[z", "go to top of current fold" },
    ["d"] = { "zd", "remove fold" },
    ["E"] = { "zE", "remove all fold" },
    ["i"] = { "<cmd>set foldlevel=0 foldlevelstart=-1 foldmethod=indent<cr>", "fold all indentation" },
    ["m"] = { "<cmd>set foldlevel=99 foldlevelstart=99 foldmethod=manual<cr>", "manual fold" },
    ["s"] = { "<cmd>mkview<cr>", "save folds" },
    ["l"] = { "<cmd>loadview<cr>", "load folds" },
    ["p"] = { "zfip", "fold paragraph" },
    ["P"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, "peek FoldedLines" },
    ["}"] = { "zfa}", "fold curly-bracket block" },
    ["]"] = { "zfa]", "fold square-bracket block" },
    [")"] = { "zfa)", "fold parenthesis block" },
    [">"] = { "zfa>", "fold greater-than block" },
  },
}

-- require('legendary').setup({ which_key = { auto_register = true } })
which_key.setup(setup)
which_key.register(mappings, opts)

local mini_textobj = {
  q = '@call',
  Q = '@class',
  g = '@comment',
  G = '@conditional',
  B = '@block',
  F = '@function',
  L = '@loop',
  P = '@parameter',
  R = '@return',
  ["="] = '@assignment.side',
  ["+"] = '@assignment.whole',
  ["*"] = '@number',
  ['a'] = 'Function Parameters',
  ['A'] = 'Whole Buffer',
  ['b'] = 'Alias )]}',
  ['f'] = 'Function Definition',
  ['k'] = 'Key',
  ['n'] = 'Number',
  ['p'] = 'Paragraph',
  ['s'] = 'Sentence',
  ['t'] = 'Tag',
  ['u'] = 'Alias "\'`',
  ['v'] = 'Value',
  ['w'] = 'Word',
  ['x'] = 'Hex',
  ['y'] = 'Whitespace',
  ['z'] = 'ClosedFold',
  ['?'] = 'Prompt',
  ['('] = 'Same as )',
  ['['] = 'Same as ]',
  ['{'] = 'Same as }',
  ['<'] = 'Same as >',
  ['"'] = 'punctuations...',
  ["'"] = 'punctuations...',
  ["`"] = 'punctuations...',
  ['.'] = 'punctuations...',
  [','] = 'punctuations...',
  [';'] = 'punctuations...',
  ['-'] = 'punctuations...',
  ['_'] = 'punctuations...',
  ['/'] = 'punctuations...',
  ['|'] = 'punctuations...',
  ['&'] = 'punctuations...',
  -- `!@#$%^&*()_+-=[]{};'\:"|,./<>?
}

which_key.register({
  mode = { "o", "x" },
  ["i"] = mini_textobj,
  ["il"] = { name = "+Last", mini_textobj },
  ["iN"] = { name = "+Next", mini_textobj },
  ["a"] = mini_textobj,
  ["al"] = { name = "+Last", mini_textobj },
  ["aN"] = { name = "+Next", mini_textobj },
  ["Q"] = { "Textsubjects Prev Selection" },
  ["K"] = { "Textsubjects Smart" },
  ["aK"] = { "Textsubjects Container Outer" },
  ["iK"] = { "Textsubjects Container Inner" },
})

which_key.register({
  mode = { "n" },
  ["g["] = vim.tbl_extend("force", { name = "+Cursor to Left Around" }, mini_textobj),
  ["g]"] = vim.tbl_extend("force", { name = "+Cursor to Rigth Around" }, mini_textobj),
})

-- Disable some operators (like v)
-- make sure to run this code before calling setup()
-- refer to the full lists at https://github.com/folke/which-key.nvim/blob/main/lua/which-key/plugins/presets/init.lua
-- local presets = require("which-key.plugins.presets")
-- presets.operators["v"] = nil
