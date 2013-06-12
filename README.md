# Time tracking from the command line

Small tool to manage time tracking on the command line.

## Installation

1. Checkout ts on `~/.ts`

    ~~~ sh
    $ git clone git://github.com/juanibiapina/timesheets.git ~/.ts
    ~~~

2. Add `~/.ts/bin` to `$PATH` for easy access to the ts command-line utility.

    ~~~ sh
    $ echo 'export PATH="$HOME/.ts/bin:$PATH"' >> ~/.bash_profile
    ~~~

    **Ubuntu note**: Modify your `~/.profile` instead of `~/.bash_profile`.

    **Zsh note**: Modify your `~/.zshrc` file instead of `~/.bash_profile`.

## Usage

- `ts` starts counting time
- `ts` again stops counting time
- `ts log` same as ts
- `ts now` shows how much work time has been logged
- `ts show` shows current logged times
- `ts edit` opens log file with vi

## Limitations

Does not work across days.
