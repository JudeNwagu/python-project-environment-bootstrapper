![Python Version](https://img.shields.io/badge/python-3.10%2B-blue)
![Shell Script](https://img.shields.io/badge/shell-bash-lightgrey)


# Python Project Environment Bootstrapper

## Overview

A professional Bash automation script that initializes a Python project environment in a single command.

This project simulates a real-world onboarding scenario at a data engineering team where new engineers repeatedly spend hours setting up virtual environments, upgrading pip, configuring .gitignore, and installing core packages.

The goal: eliminate repetitive setup work through structured, idempotent Bash automation.

## Problem Statement

In many engineering teams, project setup is manual and inconsistent:

Virtual environments are created differently across machines, Pip versions are outdated .gitignore files are missing or inconsistent 

Required dependencies are installed manually No structured logging of setup steps

This leads to:

Wasted onboarding time

Configuration drift

Environment inconsistencies

Reproducibility issues

This script standardizes and automates the entire process.


## What This Script Does

When executed, setup.sh:

1. Checks for an existing .venv virtual environment

* Creates one if missing

* Activates it safely

2. Upgrades pip to the latest version

3. Creates a standard Python .gitignore file (if missing)

4. Installs required Python packages (e.g., pandas, requests)

5. Logs all actions to setup.log

6. Displays structured, color-coded terminal feedback

7. Stops immediately if any command fails

The script is idempotent running it multiple times does not duplicate or corrupt configuration.

## Technologies Used

- Bash (shell scripting)
- Python 3.12+
- Git
- Linux / WSL Ubuntu

## Requirements

- Python 3.12+ is installed

- python3-venv is installed

- Git is installed

- Bash environment (Linux, macOS, or WSL)

To install missing components on Ubuntu:

sudo apt update
sudo apt install python3 python3-venv python3-pip git


## How to Execute

1. Clone the repository:

   git clone <your-repo-url>

2. Navigate into the project directory:

   cd python-project-environment-bootstrapper

3. Make the script executable:

   chmod +x setup.sh

4. Run the script:

   ./setup.sh

## Example Terminal Output

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

This provides:

Auditability

Debug trace

Setup reproducibility record

## Project Structure


```text
python-project-environment-bootstrapper/
├── setup.sh
├── setup.log
├── .gitignore
└── README.md
```


## Engineering Design Principles Applied

- Idempotency, safe to run multiple times

- Defensive scripting, immediate exit on failure (set -e)

- Structured logging

- Clear separation of concerns using functions

- Conditional checks before file creation

- User-friendly CLI feedback

## Challenges Faced

- Ensuring idempotency (safe repeated execution)
- Managing virtual environment activation inside script
- Proper error handling using set -e
- Debugging function naming typo
- Ensuring pip runs from the correct interpreter
- Implementing readable and consistent logging
- Setting up secure GitHub SSH authentication

## Lessons Learned

- Bash scripting can significantly reduce onboarding friction
- Always structure Bash scripts into modular functions
- Enable strict error handling early
- Idempotency is essential in automation
- Clear logging improves maintainability and traceability
- Infrastructure hygiene (SSH, Git config, environment isolation) matters  in professional engineering workflows


## Author

Jude Nwagu

Data Professional | Automation & Analytics Engineering
