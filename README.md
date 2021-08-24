This repository contains my NixOS configuration. If you're looking for
my dotfiles, look [here](https://github.com/poxar/dotfiles). My (neo)vim
configuration lives [somewhere else
entirely](https://github.com/poxar/vimfiles).

I seem not to be the monorepo kind. 🤷

Currently NixOS is still in a bit of a trial stage for me. >10 years of
ArchLinux are hard to overcome, y'know.

# How to read this mess?

Best you start with `host/leonis.nix`, then follow the white rabbit.

# Usage

Don't. It's always somewhat broken.

But if you insist, then follow the [NixOS Installation
Guide](https://nixos.org/manual/nixos/stable/#sec-installation-summary)
and instead of writing your own configuration put something like the
following in your `/etc/nixos/configuration.nix`:

```nix
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      /home/USER/Projects/nixfiles/host/HOST.nix
    ];

  system.stateVersion = "21.05";
}
```

Replace `USER` and `HOST` with appropriate values and clone my
configuration.

```sh
nix-shell -p git --run git clone https://github.com/poxar/nixfiles /mnt/home/USER/Projects/nixfiles
```

Now you can install the NixOS configuration with `nixos-install`.
