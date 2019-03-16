# Dotfiles
> Dotfiles. Bash. No fancy plugin-managers. KISS. XO.

![screenshot](https://github.com/terkelg/dotfiles/blob/master/screenshot.jpg?raw=true)

**Components:**
- *[Bash](https://www.gnu.org/software/bash/)*
- *[Git](https://git-scm.com/)*
- *[Tmux](https://tmux.github.io/)*
- *[Vim](https://vim.org)*
- *[Alacritty](https://github.com/jwilm/alacritty)*

> **Vim:** My vim configuration live in its [own repo](https://github.com/terkelg/vimrc)!

## Get Started

Run the following command inside of your favourite terminal:

### Get Started

Clone the repo into your preferred directory

```sh
$ git clone https://github.com/terkelg/dotfiles.git
```

> **Note:** Make sure you have the [Homebrew](http://brew.sh) package manager installed before you continue.

`cd` into directory and call make to bootstrap everything:

```sh
make
```

Symlink files only

```sh
make link
```

Download and install tools
```sh
make dependencies
```

Configure system and set defaults
```sh
make config
```

### Alacritty

Make sure to change font in `.alacritty.yml` or install the font `Operator Mono SS` otherwise Alacritty will crash immediately.

> **Note:** If alacritty doesn't load the correct config file, make sure to [remove defaults](https://github.com/jwilm/alacritty#configuration).

## Smart Cards

When using multiple smart cards with GPG, switching them is annoying because GPG will keep asking for the previous card you plugged in.

Run `switch-card` and it will help you remove secret key files.
If you get `gpg failed to sign the data` when you're trying to sign a commit try [these steps](https://github.com/ruimarinho/yubikey-handbook/blob/master/openpgp/troubleshooting/gpg-failed-to-sign-the-data.md).

## See also

There are other great dotfiles around:

- [yoshuawuyts/dotfiles](https://github.com/yoshuawuyts/dotfiles)
- [marcusandre/dotfiles](https://github.com/marcusandre/dotfiles)
- [lifepillar](https://github.com/lifepillar/dotfiles)

## License

MIT © [Terkel Gjervig](https://terkel.com)
