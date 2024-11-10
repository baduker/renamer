#!/bin/bash

# extract_modules.sh
# Script to extract external Perl module names from a Perl script.
# Usage: ./extract_modules.sh path_to_perl_script

# Check if a Perl script file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 path_to_perl_script"
    exit 1
fi

perl_script="$1"

# Ensure the file exists
if [ ! -f "$perl_script" ]; then
    echo "Error: File '$perl_script' not found."
    exit 1
fi

# Extract perl module names
awk '
    /# -> External modules/ { in_section = 1; next }
    /# <- External modules/ { in_section = 0 }
    in_section && /^use / {
        # Remove "use " at the beginning
        sub(/^use\s+/, "", $0)
        # Remove the trailing semicolon
        sub(/;$/, "", $0)
        # Accumulate module names
        modules = modules $2 " "
    }
    END {
        # Remove trailing space and print modules
        sub(/ $/, "", modules)
        print modules
    }
' "$perl_script"
