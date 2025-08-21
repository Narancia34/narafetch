# narafetch 🐧

A custom system information display script inspired by fastfetch, with cute ASCII art and colorful system information.

## Features

- 🎨 Multiple ASCII art options (penguin, cat, computer)
- 🌈 Colorful output with system information
- 📊 Displays OS, kernel, uptime, shell, CPU, and memory info
- 🚀 Fast and lightweight
- 🔧 Cross-platform compatible (Linux/Unix systems)

## Usage

```bash
# Default ASCII art
./narafetch.sh

# Penguin ASCII art
./narafetch.sh --penguin

# Computer ASCII art
./narafetch.sh --computer

# Show help
./narafetch.sh --help
```

## Installation

1. Clone or download the script
2. Make it executable:
   ```bash
   chmod +x narafetch.sh
   ```
3. Run it:
   ```bash
   ./narafetch.sh
   ```

### Global Installation (Optional)

To use `narafetch` from anywhere:

```bash
# Using the install script (recommended)
sudo ./install.sh

# Or manually copy to a directory in your PATH
sudo cp narafetch.sh /usr/local/bin/narafetch

# Or create a symlink
sudo ln -s $(pwd)/narafetch.sh /usr/local/bin/narafetch
```

Then you can run it from anywhere with just:
```bash
narafetch
```

### Uninstallation

To remove narafetch:

```bash
# Run the uninstall script
./uninstall.sh

# Or manually remove (if installed globally)
sudo rm /usr/local/bin/narafetch

# Remove from user directory (if installed locally)
rm ~/.local/bin/narafetch
```

## System Information Displayed

- **OS**: Operating system name and version
- **Kernel**: Linux kernel version
- **Uptime**: How long the system has been running
- **Shell**: Current shell
- **Terminal**: Terminal emulator
- **CPU**: Processor model
- **Memory**: RAM usage

## ASCII Art Options


### Cat (Default)
```
     /\_/\  
    ( o.o ) 
     > ^ <
```
### Penguin
```
       .--.
      |o_o |
      |:_/ |
     //   \ \
    (|     | )
   /'\_   _/`\
   \___)=(___/
```

## kuroneko
```
Kuroneko!

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
```
## Customization

You can easily customize the script by:

- Adding new ASCII art in the `print_ascii_*` functions
- Modifying colors by changing the color variables
- Adding new system information functions
- Changing the layout in the `main()` function

## Requirements

- Bash shell
- Basic Unix commands (uname, hostname, etc.)
- Works on most Linux distributions and Unix-like systems

## License

Feel free to use, modify, and distribute this script as you like!
