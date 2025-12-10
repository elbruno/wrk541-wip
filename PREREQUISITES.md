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

### 2. .NET 10 SDK

**Purpose**: Build and run the C# weather application with Minimal APIs

**Download Links**:

- **All Platforms**: [.NET 10 SDK Download](https://dotnet.microsoft.com/download/dotnet/10.0)

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

**Verify Installation**:

```bash
code --version
```

## Required VS Code Extensions

### 1. Python

**Purpose**: Python language support, debugging, and IntelliSense

**Installation**:

- **Marketplace**: [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- **Extension ID**: `ms-python.python`

**Install via Command Line**:

```bash
code --install-extension ms-python.python
```

### 1. Pylance

**Purpose**: Fast Python language server with type checking

**Installation**:

- **Marketplace**: [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- **Extension ID**: `ms-python.vscode-pylance`

**Install via Command Line**:

```bash
code --install-extension ms-python.vscode-pylance
```

### 1. C# Dev Kit

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

### 1. C# (Base Extension)

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
dotnet --version           # Should show 10.0.100 or later

# Check Git
git --version

# Check VS Code
code --version

# List installed VS Code extensions
code --list-extensions
```
