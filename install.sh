#!/bin/sh

# Function to extract the quote and author from the API response
extract_and_echo() {
  response=$(curl -s -X GET "https://zenquotes.io/api/random")
  quote=$(echo $response | sed -n 's/.*"q":"\([^"]*\)".*/\1/p')
  author=$(echo $response | sed -n 's/.*"a":"\([^"]*\)".*/\1/p')
  echo "$quote -- $author"
}

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl could not be found. Please install curl."
    exit 1
fi

# Get the default shell
DEFAULT_SHELL=$(echo $SHELL)

# Get paths for bash, zsh, and fish
BASH_PATH=$(which bash)
ZSH_PATH=$(which zsh)
FISH_PATH=$(which fish)

# Determine the default configuration file
if [ "$DEFAULT_SHELL" = "$BASH_PATH" ]; then
    CONFIG_FILE="$HOME/.bashrc"
elif [ "$DEFAULT_SHELL" = "$ZSH_PATH" ]; then
    CONFIG_FILE="$HOME/.zshrc"
elif [ "$DEFAULT_SHELL" = "$FISH_PATH" ]; then
    CONFIG_FILE="$HOME/.config/fish/config.fish"
else
    echo $DEFAULT_SHELL
    echo "Unsupported shell. This script supports bash, zsh, and fish."
    exit 1
fi

# Append the function to the configuration file
echo "\n# Shell Welcome Quote" >> $CONFIG_FILE
if [ "$DEFAULT_SHELL" = "$FISH_PATH" ]; then
    # Fish shell syntax
    echo "function extract_and_echo" >> $CONFIG_FILE
    echo "    set response (curl -s -X GET \"https://zenquotes.io/api/random\")" >> $CONFIG_FILE
    echo "    set quote (echo \$response | sed -n 's/.*\"q\":\"\\([^\\\"]*\\)\".*/\\1/p')" >> $CONFIG_FILE
    echo "    set author (echo \$response | sed -n 's/.*\"a\":\"\\([^\\\"]*\\)\".*/\\1/p')" >> $CONFIG_FILE
    echo "    echo \"\$quote -- \$author\"" >> $CONFIG_FILE
    echo "end" >> $CONFIG_FILE
    echo "" >> $CONFIG_FILE
    echo "if status is-interactive" >> $CONFIG_FILE
    echo "    extract_and_echo" >> $CONFIG_FILE
    echo "end" >> $CONFIG_FILE
else
    # Bash and Zsh syntax
    echo "extract_and_echo" >> $CONFIG_FILE
fi

echo "Installation complete! Please restart your terminal or source your configuration file."
