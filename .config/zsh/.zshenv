# Make sure modern apps put their configs in the dedicated .dotfiles/ dir
export XDG_CONFIG_HOME="$HOME/.dotfiles/.config"
export XDG_DATA_HOME="$HOME/.dotfiles/.local/share"
export XDG_STATE_HOME="$HOME/.dotfiles/.local/state"
export XDG_CACHE_HOME="$HOME/.dotfiles/.cache"

# Everything ZSH-related should be in a dedicated directory
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH="$ZDOTDIR/.oh-my-zsh" # Path to oh-my-zsh installation.
export ZSH_CACHE_DIR="$ZSH/cache"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"

export GOOGLE_CLOUD_PROJECT="ai-dev-6a78"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"
