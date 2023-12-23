local wezterm = require 'wezterm'
local act = wezterm.action
local io = require 'io';

wezterm.on("open_in_vim", function(window, pane)
  local file = io.open("wezterm_buf", "w")
  file:write(pane:get_lines_as_text(3000))
  file:close()
  window:perform_action(
    wezterm.action({
      SpawnCommandInNewTab = { args = { "nvim", "wezterm_buf", "-c", "call cursor(3000,0)" } },
    }),
    pane
  )
end)

wezterm.on("move_pane_to_new_tab", function()
  wezterm.run_child_process({ "wezterm", "cli", "move-pane-to-new-tab" })
  wezterm.run_child_process({ "wezterm", "cli", "activate-tab", "--tab-relative", "1" })
end)

local set_environment_variables = {}
set_environment_variables["DIRCMD"] = "/d"
set_environment_variables["PROFILE.CurrentUserAllHosts"] = "C:\\Users\\yeste\\.config\\Powershell\\Profile.ps1"
-- set_environment_variables["PROFILE"] = "C:\\Users\\yeste\\.config\\Powershell\\Profile.ps1"

return {

  -- animation_fps = 60,
  -- hide_tab_bar_if_only_one_tab = true,
  -- line_height = 1.00,
  -- tab_bar_at_bottom = true,
  adjust_window_size_when_changing_font_size = false,
  bold_brightens_ansi_colors = true,
  check_for_updates = false,
  default_prog = { "pwsh.exe", "-NoLogo" },
  enable_kitty_graphics = true,
  font_size = 10,
  front_end = "WebGpu",
  set_environment_variables = set_environment_variables,
  use_fancy_tab_bar = false,
  window_close_confirmation = "NeverPrompt",

  window_background_opacity = 0.9,
  text_background_opacity = 0.9,
  scrollback_lines = 10000,

  -- foreground_text_hsb = {
  --   hue = 1.00,
  --   saturation = 1.10, --yellow to more yellowish
  --   brightness = 1.90, --yellow to less yellowish
  -- },

  font = wezterm.font("CaskaydiaCove Nerd Font", { weight = "Bold", stretch = "Normal", style = Normal }), -- /usr/share/fonts/TTF/Caskaydia Cove Nerd Font Complete.ttf, FontConfig
  -- font = wezterm.font("CaskaydiaCove Nerd Font Mono", {weight="Bold", stretch="Normal", style=Normal}), -- /usr/share/fonts/TTF/Caskaydia Cove Nerd Font Complete Mono.ttf, FontConfig

  key_tables = {
    copy_mode = {
      {
        key = "q",
        mods = "NONE",
        action = act.Multiple {
          act.SendKey { key = "u", mods = "CTRL" },
          act.CopyMode("ClearPattern"),
          act.CopyMode("Close"),
        }
      },
      {
        key = "i",
        mods = "NONE",
        action = act.Multiple {
          act.SendKey { key = "u", mods = "CTRL" },
          act.CopyMode("ClearPattern"),
          act.CopyMode("Close"),
        }
      },
      {
        key = "Escape",
        mods = "NONE",
        action = act.Multiple {
          act.SendKey { key = "u", mods = "CTRL" },
          act.CopyMode("ClearPattern"),
          act.CopyMode("Close"),
        }
      },

      { key = "h",          mods = "NONE",  action = act.CopyMode("MoveLeft") },
      { key = "j",          mods = "NONE",  action = act.CopyMode("MoveDown") },
      { key = "k",          mods = "NONE",  action = act.CopyMode("MoveUp") },
      { key = "l",          mods = "NONE",  action = act.CopyMode("MoveRight") },

      { key = "LeftArrow",  mods = "NONE",  action = act.CopyMode("MoveLeft") },
      { key = "DownArrow",  mods = "NONE",  action = act.CopyMode("MoveDown") },
      { key = "UpArrow",    mods = "NONE",  action = act.CopyMode("MoveUp") },
      { key = "RightArrow", mods = "NONE",  action = act.CopyMode("MoveRight") },

      { key = "w",          mods = "NONE",  action = act.CopyMode("MoveForwardWord") },
      { key = "W",          mods = "NONE",  action = act.CopyMode("MoveForwardWord") },

      { key = "e",          mods = "NONE",  action = act.CopyMode("MoveForwardWordEnd") },
      { key = "E",          mods = "NONE",  action = act.CopyMode("MoveForwardWordEnd") },

      { key = "b",          mods = "NONE",  action = act.CopyMode("MoveBackwardWord") },
      { key = "B",          mods = "NONE",  action = act.CopyMode("MoveBackwardWord") },

      { key = "0",          mods = "NONE",  action = act.CopyMode("MoveToStartOfLine") },
      { key = "Enter",      mods = "NONE",  action = act.CopyMode("MoveToStartOfNextLine") },

      { key = "$",          mods = "NONE",  action = act.CopyMode("MoveToEndOfLineContent") },
      { key = "$",          mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
      { key = "^",          mods = "NONE",  action = act.CopyMode("MoveToStartOfLineContent") },
      { key = "^",          mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },

      { key = "Tab",        mods = "SHIFT", action = act.ActivateTabRelative(-1) },
      { key = "Tab",        mods = "NONE",  action = act.ActivateTabRelative(1) },
      { key = ";",          mods = "NONE",  action = act.ActivateLastTab },

      -- {key="v", mods="NONE", action=wezterm.action{CopyMode="ToggleSelectionByCell"}},
      { key = " ",          mods = "NONE",  action = act.CopyMode { SetSelectionMode = "Cell" } },
      { key = "v",          mods = "NONE",  action = act.CopyMode { SetSelectionMode = "Cell" } },
      { key = "V",          mods = "NONE",  action = act.CopyMode { SetSelectionMode = "Line" } },
      { key = "V",          mods = "SHIFT", action = act.CopyMode { SetSelectionMode = "Line" } },
      { key = "v",          mods = "CTRL",  action = act.CopyMode { SetSelectionMode = "Block" } },

      { key = "G",          mods = "NONE",  action = act.CopyMode("MoveToScrollbackBottom") },
      { key = "G",          mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
      { key = "g",          mods = "NONE",  action = act.CopyMode("MoveToScrollbackTop") },

      { key = "h",          mods = "ALT",   action = act.CopyMode("MoveToViewportTop") },
      { key = "m",          mods = "ALT",   action = act.CopyMode("MoveToViewportMiddle") },
      { key = "l",          mods = "ALT",   action = act.CopyMode("MoveToViewportBottom") },

      { key = "o",          mods = "NONE",  action = act.CopyMode("MoveToSelectionOtherEnd") },
      { key = "O",          mods = "NONE",  action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
      { key = "O",          mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },

      { key = "PageUp",     mods = "NONE",  action = act.CopyMode("PageUp") },
      { key = "PageDown",   mods = "NONE",  action = act.CopyMode("PageDown") },
      { key = "u",          mods = "NONE",  action = act.CopyMode("PageUp") },
      { key = "d",          mods = "NONE",  action = act.CopyMode("PageDown") },

      {
        key = "H",
        mods = "NONE",
        action = act.Multiple {
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
          act.CopyMode("MoveLeft"),
        },
      },
      {
        key = "J",
        mods = "NONE",
        action = act.Multiple {
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
          act.CopyMode("MoveDown"),
        },
      },
      {
        key = "K",
        mods = "NONE",
        action = act.Multiple {
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
        },
      },
      {
        key = "K",
        mods = "NONE",
        action = act.Multiple {
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
          act.CopyMode("MoveUp"),
        },
      },
    },

    {
      key = "y",
      mods = "NONE",
      action = act.Multiple {
        wezterm.action { CopyTo = "ClipboardAndPrimarySelection" },
        act.CopyMode("ClearPattern"),
        wezterm.action { CopyMode = "Close" }
      },
    },
    {
      key = "/",
      mods = "NONE",
      action = act.Multiple {
        act.Search { CaseInSensitiveString = "" },
      },
    },
    {
      key = "N",
      mods = "NONE",
      action = act.Multiple {
        act.CopyMode("PriorMatch"),
        act.CopyMode { SetSelectionMode = "Cell" },
      },
    },
    {
      key = "n",
      mods = "NONE",
      action = act.Multiple {
        act.CopyMode("NextMatch"),
        act.CopyMode { SetSelectionMode = "Cell" },
      },
    },
    {
      key = "u",
      mods = "CTRL",
      action = act.Multiple {
        act.ClearSelection,
        -- act.CompleteSelection 'Clipboard',
      },
    }
  },
  search_mode = {
    {
      key = "Escape",
      mods = "NONE",
      action = act.Multiple {
        act.SendKey { key = "u", mods = "CTRL" },
        act.CopyMode("ClearPattern"),
        act.CopyMode("Close"),
      }
    },

    -- {key="Enter", mods="NONE", action="ActivateCopyMode"},
    {
      key = "Enter",
      mods = "NONE",
      action = act.Multiple {
        act.ActivateCopyMode,
        act.CopyMode { SetSelectionMode = "Cell" },
        -- act.ClearSelection,
        -- act.CopyMode('ClearSelectionMode'),
      }
    },

    { key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
    { key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
    { key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
    { key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
  },

  -- timeout_milliseconds defaults to 1000 and can be omitted
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    -- {key="m", mods="CMD", action="DisableDefaultAssignment"} ,
    { key = "v", mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "v", mods = "LEADER|SHIFT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "v", mods = "CTRL|ALT",     action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "h", mods = "CTRL|ALT",     action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    { key = "a", mods = "LEADER|CTRL",  action = wezterm.action { SendString = "\x01" } },
    { key = "[", mods = "LEADER",       action = wezterm.action({ EmitEvent = "open_in_vim" }) },
    { key = "]", mods = "LEADER",       action = "QuickSelect" },

    -- {key="i", mods="CTRL", action={SendKey={key="i", mods="CTRL"}}}, -- default:tab
    -- {key="[", mods="CTRL", action={SendKey={key="[", mods="CTRL"}}}, -- default:esc
    -- {key="phys:i", mods="CTRL", action=wezterm.action{SendString="\x09"}}, -- od -c
    -- {key="phys:[", mods="CTRL", action=wezterm.action{SendString="\x1B"}}, -- od -c
    -- {key="LeftArrow", mods="ALT", action=wezterm.action{SendString="\x1bo"}}, -- xxd
    -- {key="RightArrow", mods="ALT", action=wezterm.action{SendString="\x1bo"}}, -- xxd
    -- {key="i", mods="ALT", action=wezterm.action{SendString="\x1b[5A"}}, -- showkey -a
    -- {key="u", mods="ALT", action=wezterm.action{SendString="\x1b[5B"}}, -- showkey -a
    -- {key="y", mods="ALT", action=wezterm.action{SendString="\x1b[5C"}}, -- showkey -a
    -- {key="o", mods="ALT", action=wezterm.action{SendString="\x1b[5D"}}, -- showkey -a

    -- Copy Mode
    {
      key = " ",
      mods = "SHIFT|CTRL|ALT",
      action = act.Multiple {
        act.CopyMode("ClearPattern"),
        act.CopyMode("Close"),
        act.ActivateCopyMode,
      }
    },

    -- Search Case Insensitive
    {
      key = "F",
      mods = "SHIFT|CTRL",
      action = act.Multiple {
        act.Search { CaseInSensitiveString = "" },
        act.SendKey { key = "u", mods = "CTRL" },
        act.CopyMode("ClearPattern"),
      },
    },

    -- quick select
    { key = "q",          mods = "CTRL|SHIFT", action = wezterm.action.QuickSelect },
    {
      key = "u",
      mods = "CTRL|SHIFT",
      action = wezterm.action.QuickSelectArgs {
        label = "open url",
        patterns = {
          '"(https?://\\S+)"|\'(https?://\\S+)\'|(https?://\\S+)'
        },
        action = wezterm.action_callback(function(window, pane)
          local url = window:get_selection_text_for_pane(pane)
          wezterm.log_info("opening: " .. url)
          wezterm.open_with(url)
        end),
      },
    },

    -- Clipboard Shortcuts
    { key = "c",          mods = "ALT",        action = wezterm.action { CopyTo = "Clipboard" } },
    { key = "v",          mods = "ALT",        action = wezterm.action { PasteFrom = "Clipboard" } },

    -- Window shortcuts
    { key = "n",          mods = 'SHIFT|CTRL', action = wezterm.action.SpawnWindow },

    -- Panes Shortcuts
    { key = "w",          mods = "CTRL",       action = wezterm.action { CloseCurrentPane = { confirm = false } } },
    -- {key="l", mods="CTRL|SHIFT", action = 'DisableDefaultAssignment'},
    { key = "r",          mods = "CTRL|ALT",   action = act.RotatePanes("CounterClockwise") },
    { key = "R",          mods = "CTRL|ALT",   action = act.RotatePanes("Clockwise") },

    -- Tab shortcut
    { key = "t",          mods = "CTRL|SHIFT", action = wezterm.action { SpawnCommandInNewTab = { cwd = "" } } },
    { key = "t",          mods = "CTRL",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    { key = ";",          mods = "ALT",        action = wezterm.action.ActivateLastTab },
    { key = "s",          mods = "ALT",        action = wezterm.action.ActivateTabRelative(-1) },
    { key = "f",          mods = "ALT",        action = wezterm.action.ActivateTabRelative(1) },
    { key = 's',          mods = 'SHIFT|ALT',  action = wezterm.action.MoveTabRelative(-1) },
    { key = 'f',          mods = 'SHIFT|ALT',  action = wezterm.action.MoveTabRelative(1) },
    { key = "1",          mods = "ALT",        action = wezterm.action { ActivateTab = 0 } },
    { key = "2",          mods = "ALT",        action = wezterm.action { ActivateTab = 1 } },
    { key = "3",          mods = "ALT",        action = wezterm.action { ActivateTab = 2 } },
    { key = "4",          mods = "ALT",        action = wezterm.action { ActivateTab = 3 } },
    { key = "5",          mods = "ALT",        action = wezterm.action { ActivateTab = 4 } },
    { key = "6",          mods = "ALT",        action = wezterm.action { ActivateTab = 5 } },
    { key = "7",          mods = "ALT",        action = wezterm.action { ActivateTab = 6 } },
    { key = "8",          mods = "ALT",        action = wezterm.action { ActivateTab = 7 } },
    { key = "9",          mods = "ALT",        action = wezterm.action { ActivateTab = 8 } },
    { key = "0",          mods = "ALT",        action = wezterm.action { ActivateTab = -1 } },

    -- Scrolling shortcuts
    { key = "e",          mods = "ALT",        action = wezterm.action { ScrollByLine = -1 } },
    { key = "d",          mods = "ALT",        action = wezterm.action { ScrollByLine = 1 } },
    { key = "q",          mods = "ALT",        action = wezterm.action { ScrollByPage = -1 } },
    { key = "a",          mods = "ALT",        action = wezterm.action { ScrollByPage = 1 } },
    { key = "t",          mods = "ALT",        action = "ScrollToTop" },
    { key = "g",          mods = "ALT",        action = "ScrollToBottom" },
    { key = "LeftArrow",  mods = "CTRL|ALT",   action = wezterm.action { AdjustPaneSize = { "Left", 1 } } },
    { key = "RightArrow", mods = "CTRL|ALT",   action = wezterm.action { AdjustPaneSize = { "Right", 1 } } },
    { key = "UpArrow",    mods = "CTRL|ALT",   action = wezterm.action { AdjustPaneSize = { "Up", 1 } } },
    { key = "DownArrow",  mods = "CTRL|ALT",   action = wezterm.action { AdjustPaneSize = { "Down", 1 } } },
    { key = "LeftArrow",  mods = "CTRL",       action = wezterm.action { ActivatePaneDirection = "Left" } },
    { key = "RightArrow", mods = "CTRL",       action = wezterm.action { ActivatePaneDirection = "Right" } },
    { key = "UpArrow",    mods = "CTRL",       action = wezterm.action { ActivatePaneDirection = "Up" } },
    { key = "DownArrow",  mods = "CTRL",       action = wezterm.action { ActivatePaneDirection = "Down" } },
    -- {key="Home", mods="CTRL", action=wezterm.action{ScrollToPrompt=-1}},
    -- {key="End", mods="CTRL", action=wezterm.action{ScrollToPrompt=1}},
  },

  -- color_scheme = "Retro",
  colors = {
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      -- background = "#0b0022",
      background = "#111111",

      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        -- bg_color = "#2b2042",
        -- bg_color = "#222222",
        bg_color = "#000000",
        -- The color of the text for the tab
        fg_color = "#c0c0c0",

        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = "Normal",

        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = "None",

        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,

        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },

      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        -- bg_color = "#1b1032",
        bg_color = "#111111",
        fg_color = "#808080",

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
        -- bg_color = "#3b3052",
        bg_color = "#111111",
        fg_color = "#909090",
        italic = true,

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab_hover`.
      },

      -- The new tab button that let you create new tabs
      new_tab = {
        -- bg_color = "#1b1032",
        bg_color = "#111111",
        -- fg_color = "#808080",
        fg_color = "#111111",

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over the new tab button
      new_tab_hover = {
        -- bg_color = "#3b3052",
        bg_color = "#111111",
        fg_color = "#909090",
        italic = true,

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab_hover`.
      }
    }
  }
}
