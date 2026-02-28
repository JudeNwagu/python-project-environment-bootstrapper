# Python Project Environment Bootstrapper

## Overview

This project automates the setup of a Python development environment using a Bash script.

It eliminates the need for manual setup steps when starting a new data engineering project.

## Features

- Creates or activates a Python virtual environment (.venv)
- Upgrades pip inside the virtual environment
- Generates a .gitignore file if missing
- Installs required Python packages (pandas, requests)
- Provides color-coded terminal feedback
- Logs all setup actions to setup.log
- Stops immediately if an error occurs
- Safe to run multiple times (idempotent)

## Requirements

- Linux environment (WSL recommended)
- Python 3.x
- Git

## How to Execute

1. Clone the repository:

   git clone <your-repo-url>

2. Navigate into the project directory:

   cd python-project-environment-bootstrapper

3. Make the script executable:

   chmod +x setup.sh

4. Run the script:

   ./setup.sh

## Example Output

[INFO] Starting project setup...
[INFO] Virtual environment already exists.
[SUCCESS] Virtual environment activated.
[INFO] Upgrading pip...
[SUCCESS] pip upgraded successfully.
[INFO] Installing required Python packages...
[SUCCESS] pandas installed successfully.
[SUCCESS] requests installed successfully.
[SUCCESS] Project setup completed successfully.

## Log File

All setup actions are recorded in:

setup.log

## Challenges Faced

- Ensuring idempotency (safe repeated execution)
- Managing virtual environment activation inside script
- Proper error handling using set -e
- Debugging function naming typo
- Ensuring pip runs from the correct interpreter

## Lessons Learned

- Use python -m pip instead of pip directly
- Always structure Bash scripts into modular functions
- Enable strict error handling early
- Design automation scripts to be reusable
- Log everything for traceability
