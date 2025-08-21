#!/bin/bash

# Uninstall script for narafetch

# Colors for styling
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

INSTALL_NAME="narafetch"
SYSTEM_INSTALL_DIR="/usr/local/bin"
USER_INSTALL_DIR="$HOME/.local/bin"

echo -e "${RED}🗑️  narafetch uninstaller${NC}"
echo -e "${BLUE}========================${NC}"

# Function to remove file if it exists
remove_if_exists() {
    local file_path="$1"
    local location_name="$2"
    
    if [[ -f "$file_path" ]]; then
        echo -e "${CYAN}🔍 Found narafetch in ${WHITE}$location_name${NC}"
        
        # Check if we need sudo for system-wide removal
        if [[ "$file_path" == "$SYSTEM_INSTALL_DIR/$INSTALL_NAME" ]]; then
            if [[ $EUID -eq 0 ]]; then
                rm "$file_path"
                echo -e "${GREEN}✅ Removed narafetch from ${WHITE}$location_name${NC}"
                return 0
            else
                echo -e "${YELLOW}🔐 Need sudo to remove from ${WHITE}$location_name${NC}"
                if sudo rm "$file_path" 2>/dev/null; then
                    echo -e "${GREEN}✅ Removed narafetch from ${WHITE}$location_name${NC}"
                    return 0
                else
                    echo -e "${RED}❌ Failed to remove from ${WHITE}$location_name${NC}"
                    return 1
                fi
            fi
        else
            # User directory, no sudo needed
            rm "$file_path"
            echo -e "${GREEN}✅ Removed narafetch from ${WHITE}$location_name${NC}"
            return 0
        fi
    else
        echo -e "${BLUE}ℹ️  narafetch not found in ${WHITE}$location_name${NC}"
        return 1
    fi
}

# Check for installations and remove them
found_any=false

# Check system-wide installation
if remove_if_exists "$SYSTEM_INSTALL_DIR/$INSTALL_NAME" "system-wide location ($SYSTEM_INSTALL_DIR)"; then
    found_any=true
fi

# Check user installation
if remove_if_exists "$USER_INSTALL_DIR/$INSTALL_NAME" "user location ($USER_INSTALL_DIR)"; then
    found_any=true
fi

# Check if narafetch is still accessible
echo ""
echo -e "${PURPLE}🔍 Checking if narafetch is still accessible...${NC}"
if command -v narafetch >/dev/null 2>&1; then
    narafetch_location=$(which narafetch 2>/dev/null)
    echo -e "${YELLOW}⚠️  narafetch is still found at: ${WHITE}$narafetch_location${NC}"
    echo -e "   ${YELLOW}You may need to manually remove it or check your PATH${NC}"
else
    echo -e "${GREEN}✅ narafetch is no longer accessible from command line${NC}"
fi

echo ""
if $found_any; then
    echo -e "${GREEN}🎉 Uninstallation completed!${NC}"
    echo -e "${CYAN}📁 The source files in ${WHITE}$(pwd)${CYAN} are still available if you want to reinstall${NC}"
else
    echo -e "${BLUE}ℹ️  No installed narafetch found${NC}"
    echo -e "   ${BLUE}narafetch may not have been installed globally, or it's in a custom location${NC}"
fi

echo ""
echo -e "${PURPLE}💡 To completely remove narafetch:${NC}"
echo -e "   ${WHITE}- Delete this entire directory: ${CYAN}$(pwd)${NC}"
echo -e "   ${WHITE}- Check your shell's PATH for any custom narafetch locations${NC}"
