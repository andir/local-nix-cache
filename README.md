# Local Nix Cache

This project tries to solve a common issue amongst people on low bandwidth
internet connections: Sharing binaries between different NixOS systems without
requiring an extended amount of trust to the local peers.

The primary idea is to re-serve the contents of the local Nix store in a format
that is compatible with the signatures of cache.nixos.org.

# Requirements

At the present time it requires a patched Nix daemon to be running on the
machine that serves it's nix store contents. The changes to vanilla Nix are
very simple and expose another Operation via the store interface. The patch is
available at https://github.com/andir/nix/tree/queryPathFromFileHash.

You can override the local Nix store in `configuration.nix` via:

```nix
{ pkgs, config, ...}: {
  nix.package = pkgs.nixUnstable.overrideAttrs (_: {
    src = pkgs.fetchFromGitHub {
      owner = "andir";
      repo = "nix";
      rev = "3aefaac46e4833b029555242f90d37f0df80f02f";
      sha256 = "0aq0k4kyjcml5dgbhgzf0iv2wl2psy650w80g1d33pnzzv6gcdsr";
    };
  });
}
```

# Future work

Discovering local peers via some kind of local mesh/p2p/multicast discovery is
pretty important to me. Iterating through all the local "caches" before hitting
cache.nixos.org.

# Related work

To make this work I needed rust bindings to Nix which in turn required some
stable-ish C bindings.

 - [libnixstore-c](https://github.com/andir/libnixstore-c) - the C library to
   Nix. Exposing a very limited set of features.
 - [libnixstore-sys](https://github.com/andir/libnixstore-sys) - Rust bindings
   to the above C library.
