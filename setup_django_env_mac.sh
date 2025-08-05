#!/bin/bash

echo "🚀 Starting Django dev environment setup for macOS..."

install_if_missing() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "📦 Installing $1..."
        brew install "$1"
    else
        echo "✅ $1 is already installed"
    fi
}

if ! command -v brew >/dev/null 2>&1; then
    echo "🔧 Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

install_if_missing git
install_if_missing python
install_if_missing postgresql

if [ ! -d "$HOME/.nvm" ]; then
    echo "🔧 Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
else
    echo "✅ NVM already installed"
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
fi

echo "📦 Installing latest LTS Node..."
nvm install --lts
nvm use --lts

if ! command -v code >/dev/null 2>&1; then
    echo "📎 VS Code CLI not found. Run this in VS Code:"
    echo "     Command Palette → 'Shell Command: Install code in PATH'"
else
    echo "✅ VS Code CLI is ready"
fi

if [ ! -d "venv" ]; then
    echo "🐍 Creating virtualenv at ./venv..."
    python3 -m venv venv
fi

source venv/bin/activate
echo "✅ Virtualenv activated"

echo "⬆️ Upgrading pip and installing Django + tools..."
pip install --upgrade pip
pip install django black isort pylint

echo "📦 Recommended VS Code extensions:"
echo "    - Python"
echo "    - Pylance"
echo "    - Django"
echo "    - Django Template"
echo "    - Black Formatter"
echo "    - isort"

echo "🎉 Setup complete!"
