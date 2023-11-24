# Quote Welcome Message
Have a random quote as your default shell welcome message.
Currently supports: `bash`, `zsh` and `fish`.

Inspirational quotes provided by <a href="https://zenquotes.io/" target="_blank">ZenQuotes API</a>.

![Example](https://raw.githubusercontent.com/c2r0b/shell-welcome-quote/main/examples/fish.png)

## Installation
You can install this script by running the following command:
```bash
curl -sSL https://raw.githubusercontent.com/c2r0b/shell-welcome-quote/main/install.sh | sh && rm -f install.sh
```
Alternatively, you can clone this repository and run the `install.sh` script.

## Limits
At the time of writing, the limit is 5 requests every 30 seconds.
For most users, this should be more than enough as it translates in the number of times you open a new shell in a 30 second window.

The script gets the same usage limits as the [ZenQuotes API](https://zenquotes.io/) that it uses to generate the quotes.
See updated limits [here](https://docs.zenquotes.io/zenquotes-documentation/#use-limits).