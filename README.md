# Tmux Configuration

Personal tmux configuration with Catppuccin Mocha theme.

## Features

- **Prefix**: `Ctrl-a` (instead of default `Ctrl-b`)
- **Vim-style navigation**: `Alt+hjkl` for panes (no prefix needed)
- **Window switching**: `Alt+1-9` for direct window access
- **Session management**: Easy session creation and switching
- **Mouse support**: Enabled
- **Status bar**: Weather, battery, date/time, hostname
- **Plugins**: TPM, resurrect, continuum, battery, weather

## Installation

```bash
# Symlink config
ln -sf ~/tmux-config/tmux.conf ~/.tmux.conf

# Install TPM (plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install plugins (inside tmux)
# Press: Ctrl-a + I
```

## Key Bindings

### Panes
- `Ctrl-a s` - Split horizontally
- `Ctrl-a v` - Split vertically
- `Alt-h/j/k/l` - Navigate panes (no prefix)

### Windows
- `Alt-1` through `Alt-9` - Switch to window 1-9
- `Alt-Left/Right` - Previous/next window
- `Ctrl-a ,` - Rename window

### Sessions
- `Ctrl-a N` - New session
- `Ctrl-a K` - Kill current session
- `Alt-[/]` - Previous/next session

### Other
- `Ctrl-a r` - Reload config
- `Ctrl-a [` - Copy mode (vim keys)
