# 🐧 Linux Bash Scripts

A curated collection of professional-grade Bash scripts for Linux system administration, diagnostic reporting, and workflow automation. Each script is optimized for performance and features a high-fidelity CLI experience.

---

## 📂 Repository Structure

```text
scripts/
├── push.sh                      # Advanced Git automation utility
├── README.md                    # Documentation
├── d-bus/                       # D-Bus IPC inspection & message monitoring
├── dig/                         # DNS query & network diagnostic scripts
├── inotify/                     # Filesystem event monitoring tools
├── log_analyzer/                # Log file parsing and pattern matching
├── NameSpace/                   # Linux namespace isolation & sandboxing
├── python/                      # Python automation companion scripts
├── system-info/                 # Diagnostic & Monitoring Suite
│   ├── CPU_info_colorfull.sh    # Premium CPU diagnostic dashboard
│   ├── CPU_info.sh              # Performance-optimized CPU report
│   ├── system_info_colorfull.sh # High-fidelity system overview
│   └── system_info.sh           # Clean, structured system summary
└── udev/                        # Udev device rule helpers & hardware hooks
```

---

## 📋 Features & Tools

### 1. 🚀 Advanced Git Automation (`push.sh`)
A robust wrapper for `git` that handles the heavy lifting of staging, committing, and pushing.

- **Dynamic Branch Detection**: Automatically identifies the current branch.
- **Smart Commits**: Generates a timestamped default message if none is provided.
- **Safety Checks**: Validates Git state and presence of changes before execution.
- **Professional UI**: Clear, color-coded feedback for each stage of the process.

**Usage:**
```bash
./push.sh
```

---

### 2. 📊 System Information Suite (`/system-info`)
Highly optimized scripts that gather comprehensive system metrics with minimal external tool overhead.

| Script Name | Visual Style | Key Features |
|:--- |:--- |:--- |
| **`system_info_colorfull.sh`** | 💎 **Dashboard** | Full system overview: Identity, Load, Memory, Disk, and Networking in a modern dashboard layout. |
| **`system_info.sh`** | 📄 **Clean** | Perfectly aligned, `printf`-formatted report for terminal output or logging. |
| **`CPU_info_colorfull.sh`** | 🔥 **Premium** | Detailed CPU analysis: Architecture, Topology, Frequencies, and Cache hierarchies with rich visuals. |
| **`CPU_info.sh`** | ⚙️ **Standard** | Optimized diagnostic report calling `lscpu` only once for maximum speed. |

**Usage:**
```bash
# Get a high-fidelity system overview
./system-info/system_info_colorfull.sh

# Get detailed CPU specs
./system-info/CPU_info_colorfull.sh
```

---

## 🚀 Getting Started

### Prerequisites
These scripts are designed for modern Linux environments and utilize standard tools:
*   `bash` (v4.0+)
*   `util-linux` (`lscpu`)
*   `git` (for `push.sh`)
*   Standard GNU utilities (`grep`, `sed`, `awk`, `printf`)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/amitpadhan525/scripts.git
    cd scripts
    ```

2.  **Make scripts executable:**
    ```bash
    chmod +x push.sh
    find . -type f -name "*.sh" -exec chmod +x {} +
    ```

---

## 💻 Screenshots & Previews

The scripts feature advanced ANSI styling to provide a premium feel in your terminal:

```text
╭──────────────────────────────────────────────────────────╮
│  󰇄  SYSTEM DASHBOARD                                   │
╰──────────────────────────────────────────────────────────╯
  󰭹 IDENTITY
  Hostname     : ARCH-LINUX
  User         : amit
  OS           : Arch Linux
  ...
```

---

## 🤝 Contributing
Contributions are welcome! If you have a professional-grade script to add, please open a Pull Request.

---

## 📝 License
This project is open-source and available for personal and educational use.