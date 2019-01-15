# Generic binaries
set -gx fish_user_paths /Users/$USER/bin/ $fish_user_paths
# Default go binary path
set -gx fish_user_paths /Users/$USER/go/bin/ $fish_user_paths
# Rustup
set -gx fish_user_paths /Users/$USER/.cargo/bin/ $fish_user_paths
set -gx fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths

# Open vscode editor in a new window and wait for the file to be saved
set -U EDITOR code -nw
set -Ux VAGRANT_DEFAULT_PROVIDER vmware_fusion

set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8

if test -f "$HOME/google-cloud-sdk/path.fish.inc"
    source "$HOME/google-cloud-sdk/path.fish.inc"
end

# Run on exit
function on_exit --on-process %self
    echo fish is now exiting
end

# Run for login shells
if status --is-login
end

# Automatically install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Greeting, runs on every shell
function fish_greeting
    if test -e "/usr/local/bin/task"
        task next
    end
end

# iTerm 2 integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# get ip via opendns resolver
function myip -d "Get public IP"
    dig +short myip.opendns.com @resolver1.opendns.com; end

# Homeshick integration and completions
. "$HOME/.homesick/repos/homeshick/homeshick.fish"
source "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"