# Makefile for installing the renamer script and dependencies

SHELL := /bin/bash
INSTALL_DIR := /usr/local/bin
SCRIPT_NAME := renamer

EXTRACT_SCRIPT = ./extract_modules.sh

# Use the bash script to extract module names
PERL_MODULES = $(shell $(EXTRACT_SCRIPT) $(SCRIPT_NAME))

.PHONY: all install_modules install_script install uninstall

all: install

install: install_modules install_script

install_modules:
	@echo "Installing Perl modules: $(PERL_MODULES)"
	# Configure CPAN to be non-interactive
	@echo yes | cpan App::cpanminus
	@cpan $(PERL_MODULES)

install_script:
	@echo "Installing $(SCRIPT_NAME) to $(INSTALL_DIR)..."
	@sudo rm -rf $(INSTALL_DIR)/$(SCRIPT_NAME)
	@sudo install -m 755 $(SCRIPT_NAME) $(INSTALL_DIR)
	@echo "Installation complete."

uninstall:
	@echo "Uninstalling $(SCRIPT_NAME)..."
	@sudo rm -f $(INSTALL_DIR)/$(SCRIPT_NAME)
	@echo "Uninstallation complete."
