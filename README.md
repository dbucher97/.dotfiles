# .dotfiles

My extensible `.dotfiles` repo built on GNU stow.

## Usage

Clone repo `git clone git@github.com/dbucher97/.dotfiles`.

And install default configs

```
./install
```

This basically calls

```
./pre_install

stow default

./post_install
```

If MacOS is detected also stow macos.

To save all settings in `.profile` the script `pre_install` moves it to
`.local_profile` which gets sourced by the new `.profile` from default.

zsh antigen and vimplug are installed with `pos_install`.

## Submodules

The repos is organized into a couple of subgroups, which can be installed by
`stow [subgroup]`.

| subgroup | description                                               |
| -------- | --------------------------------------------------------- |
| default  | includes configs for vim, zsh and tmux                    |
| macos    | includes profiles for macos (use GNU command line tools!) |
| flutter  | add flutter to path and special flutter alias             |
