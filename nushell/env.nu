# ~/.config/nushell/env.nu
$env.PATH = ($env.PATH | split row (char esep) | append '~/.cargo/bin')
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.EDITOR = 'nvim'  # or 'vim', 'code', whatever you prefer

# History configuration
$env.HISTORY_FILE_SIZE = 5000
$env.HISTORY_SIZE = 5000

# FZF configurations
$env.FZF_CTRL_T_OPTS = "--preview 'bat -n --color=always --line-range :500 {}'"
$env.FZF_ALT_C_OPTS = "--preview 'eza --tree --color=always {} | head -200'"
