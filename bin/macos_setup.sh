#!/bin/zsh

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

echo "Starting system bootstrap..."

# Install Homebrew
if ! command_exists brew; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Source Homebrew environment script
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/${USER}/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew is already installed."
fi

# Install rustup and the stable Rust toolchain
if ! command_exists rustup; then
  echo "Installing rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  # Source the rustup environment script
  source $HOME/.cargo/env
  echo "Installing the stable Rust toolchain..."
  rustup default stable
else
  echo "Rustup is already installed."
  # Ensure the stable toolchain is installed
  if ! rustup toolchain list | grep -q 'stable'; then
    echo "Installing the stable Rust toolchain..."
    rustup install stable
  else
    echo "The stable Rust toolchain is already installed."
  fi
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "oh-my-zsh is already installed."
fi

# Install applications with Homebrew
apps=(neovim vlc spotify firefox ffmpeg yt-dlp universal-ctags)
for app in "${apps[@]}"; do
  if ! brew list --formula | grep -q "^${app}\$"; then
    echo "Installing ${app}..."
    brew install ${app}
  else
    echo "${app} is already installed."
  fi
done

# Install Rust packages with Cargo
cargo_packages=(fd-find ripgrep)
for package in "${cargo_packages[@]}"; do
  if ! cargo install --list | grep -q "^${package} "; then
    echo "Installing ${package} with Cargo..."
    cargo install ${package}
  else
    echo "${package} is already installed."
  fi
done

# Install Noto Nerd Font
brew tap homebrew/cask-fonts
brew install font-noto-nerd-font

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.6/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Node
nvm install node

echo "System bootstrap complete."

