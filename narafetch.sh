#!/bin/bash

# narafetch - A custom system information script with ASCII art
# Similar to fastfetch but with a personal touch

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

get_os() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        echo "$PRETTY_NAME"
    else
        echo "$(uname -s) $(uname -r)"
    fi
}

get_kernel() {
    echo "$(uname -r)"
}

get_uptime() {
    if command -v uptime >/dev/null 2>&1; then
        uptime -p 2>/dev/null || uptime | awk '{print $3,$4}' | sed 's/,//'
    else
        echo "Unknown"
    fi
}

get_shell() {
    echo "$SHELL"
}

get_memory() {
    if [[ -f /proc/meminfo ]]; then
        local total=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
        local available=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
        local used=$((total - available))
        
        total=$((total / 1024))
        used=$((used / 1024))
        
        echo "${used}MB / ${total}MB"
    else
        echo "Unknown"
    fi
}

get_cpu() {
    if [[ -f /proc/cpuinfo ]]; then
        grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | sed 's/^ *//'
    else
        echo "Unknown"
    fi
}

get_hostname() {
    echo "$USER@$(hostname)"
}

get_terminal() {
    echo "${TERM}"
}

# ASCII Art - A cute cat (default)
print_ascii() {
    echo -e "${PURPLE}"
    cat << "EOF"
     /\_/\  
    ( o.o ) 
     > ^ <

EOF
    echo -e "${NC}"
}

# Alternative ASCII art options
print_ascii_penguin() {
    echo -e "${CYAN}"
    cat << "EOF"
       .--.
      |o_o |
      |:_/ |
     //   \ \
    (|     | )
   /'\_   _/`\
   \___)=(___/

EOF
    echo -e "${NC}"
}


print_ascii_computer() {
    echo -e "${GREEN}"
    cat << "EOF"
   .-----------. 
  /  .-.   .-.  \
 /   | |   | |   \
 \   `-'   `-'   /
  `-----[_]-----'

EOF
    echo -e "${NC}"
}

print_ascii_rocket() {
    echo -e "${RED}"
    cat << "EOF"
       /\
      /  \
     |    |
     |    |
     |    |
    /|    |\
   (_|    |_)
     |    |
     |____|
    /      \
   /_______\

EOF
    echo -e "${NC}"
}

print_ascii_coffee() {
    echo -e "${YELLOW}"
    cat << "EOF"
     ( (
      ) )
  ________
 |        |
 |   ☕   |
 |________|

EOF
    echo -e "${NC}"
}

print_ascii_toro() {
    echo -e "${GREEN}"
    cat << "EOF"
            ,.  ,.
            ||  ||
           ,''--''.
          : (.)(.) :
         ,'        `.
         :          :
         :          :
         `._m____m_,' 
    
EOF
    echo -e "${NC}"
}

print_ascii_kuroneko() {
    echo -e "${GREEN}"
    cat << "EOF"
           :\     /;               _
          ;  \___/  ;             ; ;
         ,:-"'   `"-:.            / ;
    _   /,---.   ,---.\   _     _; /
    _:>((  |  ) (  |  ))<:_ ,-""_,"
        \`````   `````/""""",-""
         '-.._ v _..-'      )
           / ___   ____,..  \
          / /   | |   | ( \. \
         / /    | |    | |  \ \
         `"     `"     `"    `" 
    
EOF
    echo -e "${NC}"
}



main() {
    clear
    
    print_ascii
    
    # System information
    echo -e "${WHITE}$(get_hostname)${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${RED}OS:${NC}       $(get_os)"
    echo -e "${GREEN}Kernel:${NC}   $(get_kernel)"
    echo -e "${YELLOW}Uptime:${NC}   $(get_uptime)"
    echo -e "${PURPLE}Shell:${NC}    $(get_shell)"
    echo -e "${CYAN}Terminal:${NC} $(get_terminal)"
    echo -e "${WHITE}CPU:${NC}      $(get_cpu)"
    echo -e "${GREEN}Memory:${NC}   $(get_memory)"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
}

# Handle command line arguments
case "${1:-}" in
    --help|-h)
        echo "narafetch - A custom system information display script"
        echo "Usage: $0 [option]"
        echo "Options:"
        echo "  --help, -h     Show this help message"
        echo "  --cat          Use cat ASCII art (default)"
        echo "  --penguin      Use penguin ASCII art"
        echo "  --computer     Use computer ASCII art"
        echo "  --rocket       Use rocket ASCII art"
        echo "  --coffee       Use coffee ASCII art"
        echo "  --toro         Use toro ASCII art"
        echo "  --kuroneko, -k Use kuroneko ASCII art"
        exit 0
        ;;
    --cat)
        # Default, do nothing
        ;;
    --penguin)
        print_ascii() { print_ascii_penguin; }
        ;;
    --computer)
        print_ascii() { print_ascii_computer; }
        ;;
    --rocket)
        print_ascii() { print_ascii_rocket; }
        ;;
    --coffee)
        print_ascii() { print_ascii_coffee; }
        ;;
    --toro)
        print_ascii() { print_ascii_toro; }
        ;;
    --kuroneko|-k)
        print_ascii() { print_ascii_kuroneko;}
        ;;
esac

# Run the main function
main
