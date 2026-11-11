config.load_autoconfig()

c.colors.webpage.darkmode.enabled = True
config.set("colors.webpage.preferred_color_scheme", "dark")
c.downloads.location.directory = "~/downloads"
c.downloads.location.prompt = False
c.tabs.position = "right"
c.tabs.width = "25%"

c.content.javascript.clipboard = "access-paste"

config.bind(" t", "config-cycle tabs.position top right")

c.url.searchengines = {"DEFAULT": "https://noai.duckduckgo.com/?q={}"}

# Gruvbox Dark Theme for qutebrowser
# Save this as ~/.config/qutebrowser/config.py or add it to your existing config

# Base Gruvbox colors
bg0  = '#282828'
bg1  = '#3c3836'
bg2  = '#504945'
fg0  = '#ebdbb2'
red  = '#fb4934'
green= '#b8bb26'
yellow= '#fabd2f'
blue = '#83a598'
purple= '#d3869b'
aqua = '#8ec07c'
gray = '#928374'

# Completion widget
# c.colors.completion.bg = bg1
# c.colors.completion.category.fg = fg0
# c.colors.completion.category.bg = bg0
# c.colors.completion.category.border.top = bg1
# c.colors.completion.category.border.bottom = bg1
# c.colors.completion.item.selected.fg = bg0
# c.colors.completion.item.selected.bg = blue
# c.colors.completion.item.selected.border.top = blue
# c.colors.completion.item.selected.border.bottom = blue
# c.colors.completion.match.fg = yellow

# Statusbar
c.colors.statusbar.normal.fg = fg0
c.colors.statusbar.normal.bg = bg0
c.colors.statusbar.insert.fg = bg0
c.colors.statusbar.insert.bg = green
c.colors.statusbar.passthrough.fg = bg0
c.colors.statusbar.passthrough.bg = purple
c.colors.statusbar.private.fg = bg0
c.colors.statusbar.private.bg = gray
c.colors.statusbar.command.fg = fg0
c.colors.statusbar.command.bg = bg0
c.colors.statusbar.caret.fg = bg0
c.colors.statusbar.caret.bg = yellow
c.colors.statusbar.caret.selection.fg = bg0
c.colors.statusbar.caret.selection.bg = blue

# Tabs
c.colors.tabs.bar.bg = bg0
c.colors.tabs.odd.fg = fg0
c.colors.tabs.odd.bg = bg1
c.colors.tabs.even.fg = fg0
c.colors.tabs.even.bg = bg2
c.colors.tabs.selected.odd.fg = bg0
c.colors.tabs.selected.odd.bg = blue
c.colors.tabs.selected.even.fg = bg0
c.colors.tabs.selected.even.bg = blue
c.colors.tabs.indicator.start = green
c.colors.tabs.indicator.stop = red
c.colors.tabs.indicator.error = red

# Hints
c.colors.hints.fg = bg0
c.colors.hints.bg = yellow
c.colors.hints.match.fg = red

# Prompts
c.colors.prompts.fg = fg0
c.colors.prompts.bg = bg1
c.colors.prompts.selected.bg = blue

# Misc
c.colors.keyhint.fg = fg0
c.colors.keyhint.suffix.fg = yellow
c.colors.keyhint.bg = bg1

c.colors.messages.error.fg = red
c.colors.messages.error.bg = bg1
c.colors.messages.warning.fg = yellow
c.colors.messages.warning.bg = bg1
c.colors.messages.info.fg = fg0
c.colors.messages.info.bg = bg1

c.colors.downloads.bar.bg = bg1
c.colors.downloads.start.fg = bg0
c.colors.downloads.start.bg = blue
c.colors.downloads.stop.fg = bg0
c.colors.downloads.stop.bg = green
