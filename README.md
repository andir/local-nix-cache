# Local Nix Cache

This project tries to solve a common issue amongst people on low bandwidth
internet connections: Sharing binaries between different NixOS systems without
requiring an extended amount of trust to the local peers.

The primary idea is to re-serve the contents of the local Nix store in a format
that is compatible with the signatures of cache.nixos.org. There is no
additional trust setup required. As long you trust the signing key of hydra you
can just use anyones NAR files.

Ideally we could just use IPFS but we aren't quiet there yet.


# How do I use this?

0. Choose a machine to serve the cache from (called `server` from now on). It
   is useful to use a machine with a larger set of paths in the store or a
   machine that usually updates first.
1. Install the `local-nix-cache` daemon via the module from the `module.nix`
   (or your own) on the server.
2. On all the machines that should make a use of the paths that might already
   be present on the `server` add that machine to `nix.binaryCaches`.
   e.g. `nix.binaryCaches = [ "http://titan:8083" "https://cache.nixos.org" ];`
3. Run a build on a machine that isn't the server and you should see it
   downloading all the paths that are alreayd downloaded to the server from
   there. All the others will be retrieved from hydra as usual.

# Use cases

**Note**: Not all of them a properly covered. Local discovery is pretty
important to be really useful.

In general all situations where internet bandwidth or volume is a concern. E.g.
slow links, high latencies, metered connections, ….

Some situations where this might come in handy are:

- a bunch of machines with an overlapping set of packages
  downloading the same files.

- a group of Nix(OS) users sharing an internet connection that falls in one of
  the previous categories. Conferences, Workshops, Co-worker in a shared office
  space.

  (Offline scenarios are not (yet) supported. Hopefully some day.)

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
