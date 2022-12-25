if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/santeri/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

source ~/.iterm2_shell_integration.fish

nvm use 19 > /dev/null
