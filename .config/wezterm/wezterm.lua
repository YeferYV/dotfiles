local wezterm = require 'wezterm'
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

local set_environment_variables = {}
set_environment_variables["DIRCMD"] = "/d"
set_environment_variables["PROFILE.CurrentUserAllHosts"] = "C:\\Users\\yeste\\.config\\Powershell\\Profile.ps1"

return {

  default_prog = { "pwsh.exe","-NoLogo" },
  set_environment_variables = set_environment_variables,
  check_for_updates = false,
  enable_kitty_graphics=true,
  use_fancy_tab_bar = false,
  -- hide_tab_bar_if_only_one_tab = true,
  -- tab_bar_at_bottom = true,
  adjust_window_size_when_changing_font_size = false,
  front_end = "OpenGL",
  -- animation_fps = 60,
  font_size = 10,
  -- line_height = 1.00,
  bold_brightens_ansi_colors = true,
  -- window_close_confirmation = "NeverPrompt",
  -- window_padding = {left = 8, right = 8, top = 18, bottom = 8},
  -- window_padding = {left = 8, right = 8, top = 14, bottom = 10},
  -- window_padding = {left = 8, right = 8, top = 12, bottom = 12},
  -- window_padding = {left = 8, right = 8, top = 9, bottom = 9},
  -- window_padding = {left = 8, right = 8, top = 8, bottom = 8},
  -- window_padding = {left = "8px", right = "8px", top = "8px", bottom = "8px"},
  -- window_padding = {left = "6pt", right = "6pt", top = "10pt", bottom = "10pt"},
  -- window_padding = {left = "1cell", right = "1cell", top = "1cell", bottom = "1cell"},
  -- window_padding = {left = "1%", right = "1%", top = "2%", bottom = "2%"},
  window_background_opacity = 0.9,
  -- text_background_opacity = 0.5,
  scrollback_lines = 10000,

  -- foreground_text_hsb = {
  --   hue = 1.00,
  --   saturation = 1.10, --yellow to more yellowish
  --   brightness = 1.90, --yellow to less yellowish
  -- },

  font = wezterm.font("CaskaydiaCove Nerd Font", {weight="Bold", stretch="Normal", style=Normal}), -- /usr/share/fonts/TTF/Caskaydia Cove Nerd Font Complete.ttf, FontConfig
  -- font = wezterm.font("CaskaydiaCove Nerd Font Mono", {weight="Bold", stretch="Normal", style=Normal}), -- /usr/share/fonts/TTF/Caskaydia Cove Nerd Font Complete Mono.ttf, FontConfig
  -- font = wezterm.font("Cascadia Code", {weight="Bold", stretch="Normal", style=Normal}), -- /usr/share/fonts/TTF/CascadiaCode.ttf index=0 variation=6, FontConfig
  -- font = wezterm.font("Cascadia Code", {weight="Bold", stretch="Normal", style=Italic}), -- /usr/share/fonts/TTF/CascadiaCodeItalic.ttf index=0 variation=6, FontConfig

   -- timeout_milliseconds defaults to 1000 and can be omitted
  leader = { key="a", mods="CTRL", timeout_milliseconds=1000 },
  keys = {
   -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    -- {key="m", mods="CMD", action="DisableDefaultAssignment"} ,
    {key="v", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="v", mods="LEADER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    {key="a", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"}},
    {key = "[", mods = "LEADER", action = wezterm.action({ EmitEvent = "open_in_vim" }) },
    {key = "]", mods = "LEADER", action = "QuickSelect"},
    {key = " ", mods = "SHIFT|ALT", action = "ActivateCopyMode"},
    {key="w", mods="CTRL", action=wezterm.action{CloseCurrentPane={confirm=false}}},

    {key="LeftArrow", mods="ALT", action=wezterm.action{SendString="\x1bo"}},
    {key="RightArrow", mods="ALT", action=wezterm.action{SendString="\x1bo"}},

    -- Clipboard Shortcuts
    {key="c", mods="ALT", action=wezterm.action{CopyTo="Clipboard"}},
    {key="v", mods="ALT", action=wezterm.action{PasteFrom="Clipboard"}},

    -- Tab shortcut
    {key="t", mods="CTRL|SHIFT", action=wezterm.action{SpawnCommandInNewTab={cwd=""}}},
    {key="t", mods="CTRL", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
    {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
    {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
    {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
    {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
    {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
    {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
    {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
    {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},
    {key="0", mods="ALT", action=wezterm.action{ActivateTab=-1}},

    -- Scrolling shortcuts
    {key="e", mods="ALT", action=wezterm.action{ScrollByLine=-1}},
    {key="d", mods="ALT", action=wezterm.action{ScrollByLine=1}},
    {key="r", mods="ALT", action=wezterm.action{ScrollByPage=-1}},
    {key="f", mods="ALT|SHIFT", action=wezterm.action{ScrollByPage=1}},
    {key="t", mods="ALT", action="ScrollToTop"},
    {key="g", mods="ALT", action="ScrollToBottom"},
    {key="LeftArrow", mods="CTRL|ALT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
    {key="RightArrow", mods="CTRL|ALT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},
    {key="UpArrow", mods="CTRL|ALT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
    {key="DownArrow", mods="CTRL|ALT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
    {key="LeftArrow", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="RightArrow", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Right"}},
    {key="UpArrow", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="DownArrow", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Down"}},
    -- {key="Home", mods="CTRL", action=wezterm.action{ScrollToPrompt=-1}},
    -- {key="End", mods="CTRL", action=wezterm.action{ScrollToPrompt=1}},

    -- {key="LeftArrow", mods="ALT", action=wezterm.action{SendString="\x1bo"}},
    -- {key="RightArrow", mods="ALT", action=wezterm.action{SendString="\x1bo"}},
    {key="Enter", mods="SHIFT|ALT", action="ToggleFullScreen"},

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

