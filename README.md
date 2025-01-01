# Renamer Utility

A simple Perl script to **sanitize and rename files** by removing or replacing 
unwanted characters (spaces, commas, plus signs, apostrophes, etc.) and optionally 
changing dots to underscores except for the file extension.

---

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
  - [Installing via Makefile](#installing-via-makefile)
  - [Manual Installation](#manual-installation)
  - [Automating Module Extraction (`extract_modules.sh`)](#automating-module-extraction-extract_modulessh)
- [Usage](#usage)
- [Examples](#examples)
- [Uninstallation](#uninstallation)
- [License](#license)

---

## Features

- **Batch file renaming** for files under a specified directory (recursively).
- **Single-file renaming** if a direct path to a file is provided.
- **Flexible replacement character**: replace whitespace and other undesirable 
  characters with a custom character (`_` by default).
- **Optional file extension filter**: only rename files matching a given extension 
  (e.g., `pdf`, `txt`, etc.).
- **Safety check**: skips renaming if the file is already sanitized.

---

## Requirements

- **Perl 5.10+** (or equivalent version that supports the modules used).
- **Path::Tiny** Perl module.  
- (Optionally) **App::cpanminus** (cpanm) to install dependencies automatically.

---

## Installation

### Installing via Makefile

1. **Clone** this repository or **download** the files (`renamer`, `Makefile`, and 
   `extract_modules.sh`).
2. **Open a terminal** in the directory where these files reside.
3. **Run**:
   ```bash
   make install
