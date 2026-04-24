# Simple setup

A sane middle ground between littering my OS with `apt` packages and repositories,
and the rabbit hole of atomic desktops and distroboxes.

The rules of thumb are:

1. Use Snaps for desktop applications.
2. Use Homebrew for CLI applications, whenever possible.
3. Use Mise for project dependencies.
4. Use containers for "services", such as PostgreSQL.
5. As a last resort, use `apt`.

## Usage
The repository includes four scripts:

- `apt.sh` takes care of all things `apt`.
  Among other things, it installs Fish, but _it does not set the user's shell_.
- `snap.sh` installs a list of Snaps.
- `homebrew.sh` takes care of all things Homebrew.
  It sets up Homebrew and its dependencies, and installs a list of formulae.
- `setup.sh` is a convenience script, which calls `apt.sh`, `snap.sh` and `homebrew.sh`.
