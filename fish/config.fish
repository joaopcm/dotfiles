set SPACEFISH_PROMPT_ADD_NEWLINE false

# Aliases
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
alias l="ls -la"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
alias g="git"
alias gp="g p"
alias gaic="g diff | pbcopy; open raycast://ai-commands/write-commit-message"
alias gitconfig="cursor ./git/config"
alias fishconfig="cursor ./fish/config.fish"
alias aerospaceconfig="cursor ./aerospace/aerospace.toml"
alias claudeconfig="cursor ./claude"
alias deploy-production="g co main && g up && g co production && g up && g pull --rebase origin main"
alias assume="source (brew --prefix)/bin/assume.fish"

# Starship
starship init fish | source

# Zoxide
zoxide init fish | source

# Thefuck (lazy-loaded)
function fuck
    thefuck --alias | source
    fuck $argv
end

# Fzf
fzf --fish | source

export FZF_CTRL_T_OPTS="
  --style full
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fish_add_path $HOME/.local/bin

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
