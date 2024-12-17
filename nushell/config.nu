# ~/.config/nushell/config.nu

# Load completions
$env.config = {
    show_banner: false  # Disable the welcome message
    
    # History configurations - similar to your zsh setup
    history: {
        max_size: 5000
        sync_on_enter: true      # similar to sharehistory
        file_format: "plaintext"
        isolation: false         # similar to sharehistory
    }
    
    # Completion settings
    completions: {
        case_sensitive: false    # similar to your matcher-list
        quick: true             # similar to menu no
        partial: true
        algorithm: "fuzzy"      # enables fuzzy matching
    }
    
    # Color configurations
    ls: {
        use_ls_colors: true
    }
}

# Aliases - similar to your zsh aliases
alias ll = ls -l    # detailed view
alias la = ls -a    # show hidden files
alias lt = ls -t    # sort by modification time
alias c = clear
alias py = python3

# Initialize zoxide
zoxide init nushell | save -f ~/.config/nushell/zoxide.nu
source ~/.config/nushell/zoxide.nu

# Custom keybindings
# Note: Nushell's keybinding syntax is different
$env.config.keybindings = [
    {
        name: history_search_backward
        modifier: control
        keycode: char_p
        mode: [emacs vi_normal vi_insert]
        event: { send: MenuUp }
    }
    {
        name: history_search_forward
        modifier: control
        keycode: char_n
        mode: [emacs vi_normal vi_insert]
        event: { send: MenuDown }
    }
]

# Custom prompt (similar to powerlevel10k but simpler)
def create_right_prompt [] {
    # Get command execution time if it's longer than 3s
    let duration = if (try { $env.CMD_DURATION_MS } | into int) > 3000 {
        $"($env.CMD_DURATION_MS | into duration)"
    } else { "" }
    
    # Get exit code
    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {
        $"(ansi red)✘ ($env.LAST_EXIT_CODE)(ansi reset)"
    } else { "" }
    
    # Combine them
    $"($duration)($last_exit_code)"
}

# Create the main prompt
def create_left_prompt [] {
    # Get current directory, replace home with ~
    let dir = ($env.PWD | str replace $env.HOME "~")
    
    # Get git information
    let git_info = if (do { git status --porcelain } | complete | get stdout | str trim | is-empty) {
        let branch = (do { git branch --show-current } | complete | get stdout | str trim)
        if $branch != "" {
            $"(ansi green)($branch)(ansi reset)"
        } else { "" }
    } else {
        let branch = (do { git branch --show-current } | complete | get stdout | str trim)
        if $branch != "" {
            $"(ansi red)($branch)(ansi reset)"
        } else { "" }
    }
    
    # Create prompt character (changes color based on last exit code)
    let prompt_char = if ($env.LAST_EXIT_CODE == 0) {
        $"(ansi green)>(ansi reset)"
    } else {
        $"(ansi red)>(ansi reset)"
    }
    
    # Create the first line with directory and git info
    let first_line = $"\n(ansi blue_bold)($dir)(ansi reset) ($git_info)"
    
    # Return the two-line prompt
    $"($first_line)\n "
}

# Apply the prompt config
$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
