#!/bin/bash

echo "Starting Django dev environment setup..."

# 1. Update Homebrew and install core packages
brew update

# 2. Install Python 3 (if not latest)
brew install python

# 3. Create and activate Python virtual environment in your project folder
echo "Creating virtual environment 'venv' in current directory..."
python3 -m venv venv

echo "To activate your virtualenv, run:"
echo "source venv/bin/activate"

# 4. Upgrade pip, setuptools, wheel
source venv/bin/activate
pip install --upgrade pip setuptools wheel

# 5. Install Django and common Python tools
pip install django black pylint isort

# 6. Install PostgreSQL for database (optional, but recommended)
brew install postgresql

# 7. Install GitHub CLI (optional)
brew install gh

# 8. Install Oh My Zsh for better shell experience (optional)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 9. Remind about VS Code extensions
echo "Remember to install these VS Code extensions for Django:"
echo "- Python (Microsoft)"
echo "- Pylance"
echo "- Django"
echo "- Django Template"
echo "- Black Formatter"
echo "- isort"

# 10. Reminder for Docker installation (optional)
echo "If you want Docker for containerization, run:"
echo "brew install --cask docker"

echo "Setup complete! Activate your virtualenv and start coding."
