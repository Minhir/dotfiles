local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = 'Dracula+'

config.window_decorations = 'RESIZE'

config.font = wezterm.font_with_fallback { 'Iosevka' }
config.font_size = 14

config.keys = {
    { key = 'UpArrow',    mods = 'SHIFT', action = act.SplitPane { direction = 'Up' } },
    { key = 'RightArrow', mods = 'SHIFT', action = act.SplitPane { direction = 'Right' } },
    { key = 'DownArrow',  mods = 'SHIFT', action = act.SplitPane { direction = 'Down' } },
    { key = 'LeftArrow',  mods = 'SHIFT', action = act.SplitPane { direction = 'Left' } },
    { key = 'LeftArrow',  mods = 'OPT',   action = act.SendKey { key = 'b', mods = 'ALT' } },
    { key = 'RightArrow', mods = 'OPT',   action = act.SendKey { key = 'f', mods = 'ALT' } },
    { key = 'LeftArrow',  mods = 'OPT',   action = act.SendKey { key = 'b', mods = 'ALT' } },
    { key = 'RightArrow', mods = 'OPT',   action = act.SendKey { key = 'f', mods = 'ALT' } },
    {
        key = 'R',
        mods = 'CTRL|SHIFT',
        action = act.PromptInputLine {
            description = wezterm.format { { Attribute = { Intensity = 'Bold' } }, { Text = 'Enter tab name:' } },
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    } }

return config
