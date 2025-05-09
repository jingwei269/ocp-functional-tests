#!/bin/bash

# Color definitions
COLOR_RESET="\e[0m"
COLOR_INFO="\e[34m"     # Blue
COLOR_WARN="\e[33m"     # Yellow
COLOR_ERROR="\e[31m"    # Red
COLOR_PASS="\e[32m"     # Green


log_info() {
    echo -e "${COLOR_INFO}[INFO] $*${COLOR_RESET}"
}

log_warn() {
    echo -e "${COLOR_WARN}[WARN] $*${COLOR_RESET}"
}

log_error() {
    echo -e "${COLOR_ERROR}[ERROR] $*${COLOR_RESET}"
}

log_pass() {
    echo -e "${COLOR_PASS}[PASS] $*${COLOR_RESET}"
}
