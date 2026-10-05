# 🤝 Contributing to Linux Bash Scripts

Thank you for your interest in contributing to this collection of Linux administration and automation scripts!

## 📋 Contribution Guidelines

1. **Code Standards**:
   - Ensure all scripts use bash shebang `#!/usr/bin/env bash` or `#!/bin/bash`.
   - Set safety options when appropriate: `set -euo pipefail`.
   - Validate your shell scripts using [ShellCheck](https://www.shellcheck.net/) before submitting.
   - Use clear variable names and quote your variables to prevent unexpected word-splitting.

2. **Documentation**:
   - Include a brief header comment explaining what the script does and any required dependencies.
   - If adding a new script or utility directory, update the repository structure in [README.md](README.md).

3. **Submitting Changes**:
   - Fork the repository and create a feature branch (`git checkout -b feature/your-script`).
   - Commit your changes with clear, descriptive commit messages.
   - Open a Pull Request explaining the utility and testing steps.
