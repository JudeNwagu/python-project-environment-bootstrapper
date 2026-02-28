#!/usr/bin/env bash

# ==========================================================
# Project: Python Project Environment Bootstrapper
# Company: Beejan Technology
# Description:
#   Automates Python project environment setup including:
#   - Virtual environment creation/activation
#   - pip upgrade
#   - .gitignore generation
#   - Package installation
#   - Logging
# ==========================================================

# Exit immediately if a command exits with a non-zero status
set -e

# Log file
LOG_FILE="setup.log"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ----------------------------------------------------------
# Logging Function
# ----------------------------------------------------------
log() {
    echo -e "$1" | tee -a "$LOG_FILE"
}

# ----------------------------------------------------------
# Info Message
# ----------------------------------------------------------
info() {
    log "${BLUE}[INFO]${NC} $1"
}

# ----------------------------------------------------------
# Success Message
# ----------------------------------------------------------
success() {
    log "${GREEN}[SUCCESS]${NC} $1"
}

# ----------------------------------------------------------
# Warning Message
# ----------------------------------------------------------
warning() {
    log "${YELLOW}[WARNING]${NC} $1"
}

# ----------------------------------------------------------
# Error Message
# ----------------------------------------------------------
error() {
    log "${RED}[ERROR]${NC} $1"
    exit 1
}

# ----------------------------------------------------------
# Virtual Environment Setup
# ----------------------------------------------------------
setup_virtualenv() {

    if [ -d ".venv" ]; then
        info "Virtual environment already exists."
    else
        info "Creating virtual environment..."
        python3 -m venv .venv
        success "Virtual environment created successfully."
    fi

    # Activate the virtual environment
    # shellcheck disable=SC1091
    source .venv/bin/activate
    success "Virtual environment activated."
}

# ----------------------------------------------------------
# Upgrade pip
# ----------------------------------------------------------
upgrade_pip() {

    info "Upgrading pip..."

    python -m pip install --upgrade pip

    success "pip upgraded successfully."
}

# ----------------------------------------------------------
# Generate .gitignore
# ----------------------------------------------------------
generate_gitignore() {

    if [ -f ".gitignore" ]; then
        warning ".gitignore already exists. Skipping creation."
    else
        info "Creating .gitignore file..."

        cat <<EOF > .gitignore
# Virtual Environment
.venv/

# Python cache files
__pycache__/
*.pyc
*.pyo
*.pyd

# Distribution / packaging
build/
dist/
*.egg-info/

# Logs
*.log

# Environment variables
.env

# IDE files
.vscode/
.idea/
EOF

        success ".gitignore created successfully."
    fi
}

# ----------------------------------------------------------
# Install Required Python Packages
# ----------------------------------------------------------
install_packages() {

    info "Installing required Python packages..."

    REQUIRED_PACKAGES=("pandas" "requests")

    for package in "${REQUIRED_PACKAGES[@]}"; do
        info "Installing $package..."
        python -m pip install "$package"
        success "$package installed successfully."
    done
}


# ----------------------------------------------------------
# Main Function Placeholder
# ----------------------------------------------------------
main() {
    info "Starting project setup..."

    setup_virtualenv
    upgrade_pip
    generate_gitignore
    install_packages

    success "project setup completed successfully."

}


main
