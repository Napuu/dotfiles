if status is-interactive
    # Commands to run in interactive sessions can go here
end

set LC_CTYPE "en_US.UTF-8"

# eval "$(/opt/homebrew/bin/brew shellenv)"

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#eval /Users/santeri/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

source ~/.iterm2_shell_integration.fish

nvm use 19 > /dev/null

set -ga fish_user_paths /Users/santeri/.nimble/bin
fish_add_path /Users/santeri/.nimble/bin
fish_add_path /Users/santeri/.local/share/nvim/mason/bin/
