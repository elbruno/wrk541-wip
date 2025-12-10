# Local Development Prerequisites

This document provides a comprehensive list of all dependencies and tools required to run the Python to C# migration workshop outside of GitHub Codespaces.

## System Requirements

### Operating Systems
- **Windows**: Windows 10/11 (64-bit)
- **macOS**: macOS 10.15 (Catalina) or later
- **Linux**: Ubuntu 20.04 LTS or later, Debian, Fedora, or other major distributions

## Required Software

### 1. Python 3.12

**Purpose**: Run the original Python FastAPI weather application

**Download Links**:
- **Windows/macOS**: [Python.org Downloads](https://www.python.org/downloads/)
- **Linux (Ubuntu/Debian)**:
  ```bash
  sudo apt update
  sudo apt install python3.12 python3.12-venv python3-pip
  ```
- **Linux (Fedora)**:
  ```bash
  sudo dnf install python3.12
  ```

**Verify Installation**:
```bash
python3 --version  # Should show Python 3.12.x
pip3 --version
```

### 2. .NET 9.0 SDK

**Purpose**: Build and run the C# weather application with Minimal APIs

**Download Links**:
- **All Platforms**: [.NET 9.0 SDK Download](https://dotnet.microsoft.com/download/dotnet/9.0)
- **Direct Links**:
  - [Windows x64 Installer](https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-9.0.100-windows-x64-installer)
  - [macOS x64 Installer](https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-9.0.100-macos-x64-installer)
  - [macOS ARM64 Installer](https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-9.0.100-macos-arm64-installer)
  - [Linux Installation Instructions](https://learn.microsoft.com/en-us/dotnet/core/install/linux)

**Linux Installation (Ubuntu)**:
```bash
# Add Microsoft package repository
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Install .NET SDK
sudo apt update
sudo apt install dotnet-sdk-9.0
```

**Verify Installation**:
```bash
dotnet --version  # Should show 9.0.100 or later
```

### 3. Git

**Purpose**: Clone the repository and manage version control

**Download Links**:
- **Windows**: [Git for Windows](https://git-scm.com/download/win)
- **macOS**: 
  - Included with Xcode Command Line Tools: `xcode-select --install`
  - Or via [Git for macOS](https://git-scm.com/download/mac)
- **Linux**:
  ```bash
  sudo apt install git  # Ubuntu/Debian
  sudo dnf install git  # Fedora
  ```

**Verify Installation**:
```bash
git --version
```

## Required Editor

### Visual Studio Code

**Purpose**: Primary IDE for the workshop with GitHub Copilot integration

**Download Links**:
- **Official Download**: [Visual Studio Code](https://code.visualstudio.com/download)
- **Windows**: [Windows x64 User Installer](https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user)
- **macOS**: [macOS Universal](https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal)
- **Linux**: 
  - [.deb (Debian/Ubuntu)](https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64)
  - [.rpm (Fedora/RHEL)](https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64)

**Verify Installation**:
```bash
code --version
```

## Required VS Code Extensions

### 1. GitHub Copilot

**Purpose**: AI pair-programming assistant (core requirement for workshop)

**Installation**:
- **Marketplace**: [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)
- **Extension ID**: `GitHub.copilot`
- **Install via VS Code**:
  1. Open VS Code
  2. Press `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (macOS)
  3. Search for "GitHub Copilot"
  4. Click Install

**Install via Command Line**:
```bash
code --install-extension GitHub.copilot
```

**Requirements**:
- GitHub account with Copilot subscription/trial/free access
- Sign in to GitHub in VS Code

### 2. GitHub Copilot Chat

**Purpose**: Chat interface for asking questions and getting AI assistance

**Installation**:
- **Marketplace**: [GitHub Copilot Chat](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat)
- **Extension ID**: `GitHub.copilot-chat`

**Install via Command Line**:
```bash
code --install-extension GitHub.copilot-chat
```

### 3. Python

**Purpose**: Python language support, debugging, and IntelliSense

**Installation**:
- **Marketplace**: [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- **Extension ID**: `ms-python.python`

**Install via Command Line**:
```bash
code --install-extension ms-python.python
```

### 4. Pylance

**Purpose**: Fast Python language server with type checking

**Installation**:
- **Marketplace**: [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- **Extension ID**: `ms-python.vscode-pylance`

**Install via Command Line**:
```bash
code --install-extension ms-python.vscode-pylance
```

### 5. C# Dev Kit

**Purpose**: Comprehensive C# development experience

**Installation**:
- **Marketplace**: [C# Dev Kit](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit)
- **Extension ID**: `ms-dotnettools.csdevkit`

**Install via Command Line**:
```bash
code --install-extension ms-dotnettools.csdevkit
```

**Note**: This extension includes:
- C# language support
- IntelliSense
- Debugging
- Testing tools

### 6. C# (Base Extension)

**Purpose**: C# language support (included with C# Dev Kit, but can be standalone)

**Installation**:
- **Marketplace**: [C#](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)
- **Extension ID**: `ms-dotnettools.csharp`

**Install via Command Line**:
```bash
code --install-extension ms-dotnettools.csharp
```

## Optional but Recommended

### GitHub Copilot for Azure (Optional)

**Purpose**: For the homework assignment - deploying to Azure

**Installation**:
- **Marketplace**: [GitHub Copilot for Azure](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azure-github-copilot)
- **Extension ID**: `ms-azuretools.vscode-azure-github-copilot`

**Install via Command Line**:
```bash
code --install-extension ms-azuretools.vscode-azure-github-copilot
```

**Requirements**:
- Azure account (for deployment homework)

### REST Client (Optional)

**Purpose**: Test API endpoints directly from VS Code

**Installation**:
- **Marketplace**: [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)
- **Extension ID**: `humao.rest-client`

**Install via Command Line**:
```bash
code --install-extension humao.rest-client
```

## Python Dependencies

### Installing Python Packages

Navigate to the Python application directory and install requirements:

```bash
cd src/python-app
pip3 install -r requirements.txt
```

**Required Python Packages** (from `requirements.txt`):
- `fastapi==0.103.2` - Web framework
- `pydantic` - Data validation
- `uvicorn[standard]` - ASGI server
- `httpx==0.25.0` - HTTP client
- `requests==2.32.4` - HTTP library
- `pytest` - Testing framework

## Additional Tools

### cURL (Usually Pre-installed)

**Purpose**: Test API endpoints from command line

**Installation**:
- **Windows**: Included in Windows 10/11
- **macOS**: Pre-installed
- **Linux**: Usually pre-installed, or:
  ```bash
  sudo apt install curl  # Ubuntu/Debian
  ```

**Verify Installation**:
```bash
curl --version
```

### Bash Shell

**Purpose**: Run shell test scripts

**Installation**:
- **Windows**: 
  - Git Bash (included with Git for Windows)
  - Or WSL (Windows Subsystem for Linux): [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
- **macOS**: Pre-installed (Terminal.app)
- **Linux**: Pre-installed

## Quick Installation Script

### All VS Code Extensions at Once

```bash
# Install all required VS Code extensions
code --install-extension GitHub.copilot
code --install-extension GitHub.copilot-chat
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-dotnettools.csdevkit
code --install-extension ms-dotnettools.csharp

# Optional extensions
code --install-extension ms-azuretools.vscode-azure-github-copilot
code --install-extension humao.rest-client
```

## Verification Checklist

After installing all prerequisites, verify your setup:

```bash
# Check Python
python3 --version          # Should show 3.12.x

# Check .NET
dotnet --version           # Should show 9.0.100 or later

# Check Git
git --version

# Check VS Code
code --version

# List installed VS Code extensions
code --list-extensions
```

## Getting Started

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/elbruno/wrk541-wip.git
   cd wrk541-wip
   ```

2. **Open in VS Code**:
   ```bash
   code .
   ```

3. **Set Up Python Environment**:
   ```bash
   cd src/python-app
   python3 -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   pip install -r requirements.txt
   ```

4. **Run Python Application**:
   ```bash
   cd webapp
   uvicorn main:app --port 8000
   ```

5. **Build C# Application**:
   ```bash
   cd src/csharp-app/WeatherApi
   dotnet build
   dotnet run --urls "http://localhost:8000"
   ```

## Troubleshooting

### Common Issues

**Python: Command not found**
- Ensure Python is added to PATH during installation
- On Windows, check "Add Python to PATH" during installation

**.NET: Command not found**
- Restart terminal after .NET installation
- Check PATH environment variable includes .NET tools

**VS Code: Extension not working**
- Ensure you're signed in to GitHub in VS Code
- Reload VS Code after installing extensions
- Check Output panel for error messages

**GitHub Copilot: Not activated**
- Verify you have a valid Copilot subscription/trial
- Sign in to GitHub: `Ctrl+Shift+P` → "GitHub: Sign In"

## Support Resources

- **GitHub Copilot**: [Documentation](https://docs.github.com/en/copilot)
- **.NET**: [Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/)
- **Python**: [Python Documentation](https://docs.python.org/3/)
- **Workshop Issues**: [GitHub Repository Issues](https://github.com/elbruno/wrk541-wip/issues)

## Minimum Hardware Requirements

- **CPU**: 64-bit processor, 2+ cores recommended
- **RAM**: 8 GB minimum, 16 GB recommended
- **Disk Space**: 10 GB free space
- **Internet**: Required for package downloads and GitHub Copilot

---

**Last Updated**: December 2025  
**Workshop**: WRK541 - Real World Code Migration with GitHub Copilot Agent Mode
