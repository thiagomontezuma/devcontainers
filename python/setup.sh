#!/bin/bash
set -e

echo "🚀 Starting custom setup..."

# Upgrade pip
echo "📦 Upgrading pip..."
python -m pip install --upgrade pip

# Install Python development tools
echo "📦 Installing Python development tools..."
pip install --break-system-packages \
    black \
    flake8 \
    isort \
    pytest \
    pytest-cov \
    mypy \
    pylint

# Install requirements.txt if it exists
if [ -f "requirements.txt" ]; then
    echo "📦 Installing Python dependencies from requirements.txt..."
    pip install --break-system-packages -r requirements.txt
else
    echo "⚠️  No requirements.txt found, skipping pip install"
fi

# Install Claude Code
echo "📦 Installing Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash

## Install Google Gemini CLI
echo "📦 Installing Gemini CLI..."
npm install -g @google/gemini-cli

echo "✅ Setup complete!"
echo "🐍 Python version: $(python --version)"
echo "📦 Pip version: $(pip --version)"
