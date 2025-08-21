#!/bin/bash

# Installation script for narafetch

# Colors for styling
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

SCRIPT_NAME="narafetch.sh"
INSTALL_NAME="narafetch"
INSTALL_DIR="/usr/local/bin"

echo -e "${CYAN}🐧 narafetch installer${NC}"
echo -e "${BLUE}=====================${NC}"

# Check if script exists
if [[ ! -f "$SCRIPT_NAME" ]]; then
    echo -e "${RED}❌ Error: $SCRIPT_NAME not found in current directory${NC}"
    exit 1
fi

# Check if running as root or with sudo
if [[ $EUID -eq 0 ]]; then
    echo -e "${YELLOW}📦 Installing narafetch to ${WHITE}$INSTALL_DIR${YELLOW}...${NC}"
    
    # Copy script to install directory
    cp "$SCRIPT_NAME" "$INSTALL_DIR/$INSTALL_NAME"
    
    # Make sure it's executable
    chmod +x "$INSTALL_DIR/$INSTALL_NAME"

    echo -e "${GREEN}✅ narafetch installed successfully!${NC}"
    echo -e "${GREEN}🚀 You can now run ${WHITE}'narafetch'${GREEN} from anywhere${NC}"
    
else
    echo -e "${RED}🔐 This script needs to be run with sudo to install to ${WHITE}$INSTALL_DIR${NC}"
    echo -e "${YELLOW}📝 Run: ${WHITE}sudo ./install.sh${NC}"
    echo ""
    echo -e "${BLUE}🏠 Alternative: Install to your home directory (no sudo required)${NC}"
    echo -e "   ${CYAN}mkdir -p ~/.local/bin${NC}"
    echo -e "   ${CYAN}cp $SCRIPT_NAME ~/.local/bin/$INSTALL_NAME${NC}"
    echo -e "   ${CYAN}chmod +x ~/.local/bin/$INSTALL_NAME${NC}"
    echo -e "   ${PURPLE}# Make sure ~/.local/bin is in your PATH${NC}"
    exit 1
fi
