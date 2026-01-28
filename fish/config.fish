set SPACEFISH_PROMPT_ADD_NEWLINE false

# Aliases
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
alias l="ls -la"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
alias g="git"
alias lg="lazygit"
alias ld="lazydocker"
alias try="try-rs"
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

# pnpm
set -gx PNPM_HOME "/Users/joaomelo/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# WTF Dashboard (lazy-loaded)
function wtf
    set -gx WTF_GITHUB_TOKEN (op read "op://Personal/wtf GitHub token/credential")
    set -gx WTF_TODOIST_TOKEN (op read "op://Personal/Todoist API key/credential")
    wtfutil $argv
end

# FRP tunnel (ngrok replacement)
function tunnel
    if test (count $argv) -lt 1
        echo "Usage: tunnel <port> [subdomain]"
        echo "Example: tunnel 3000 app1"
        echo "Available subdomains: app1, app2, app3"
        return 1
    end

    set -l port $argv[1]
    set -l subdomain (test (count $argv) -ge 2 && echo $argv[2] || echo "app1")
    set -l token (op read "op://Personal/frp tunnel token/credential" --account my)
    set -l config_file (mktemp)

    echo "serverAddr = \"frp.jopcmelo.dev\"
serverPort = 7000

auth.method = \"token\"
auth.token = \"$token\"

[[proxies]]
name = \"$subdomain\"
type = \"http\"
localPort = $port
customDomains = [\"$subdomain.frp.jopcmelo.dev\"]" > $config_file

    echo "Tunneling localhost:$port → https://$subdomain.frp.jopcmelo.dev"
    frpc -c $config_file
    rm $config_file
end

# Default directory
if status is-interactive && test "$PWD" = "$HOME"
    cd ~/Developer
end
