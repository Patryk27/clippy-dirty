# clippy-dirty

`cargo clippy`, but only for files / lines you've just modified.

## Abstract

By default, `cargo clippy` shows messages for the entire project - that is: even
if you modified a single file, you'll still see all the messages for all of the
other files in your crate.

This is a great behavior overall, but can be troublesome when you _start_ to
introduce `clippy` to your workflow and can't afford to apply all the
suggestions at once.

And for that comes `clippy-dirty` - it's a script that, simplifying a bit,
invokes `git status` and `cargo clippy`, and shows only those messages that
affect uncommitted files.

It can even narrow down messages to just the _lines_ you've modified - you'll
find the synopsis below.

## Installation

- clone this repository and add it to your `PATH`
- (or) download the `clippy-dirty` script wherever you like and invoke it using full path (e.g. `~/Apps/clippy-dirty`)

## Usage

Use in place of `cargo clippy`, e.g.:

```bash
$ cd ~/Projects/go-brr-meme-maker
$ clippy-dirty
# or
$ clippy-dirty -- -p workspace-crate
# and so on
```

```
USAGE
    clippy-dirty [options] [--] [clippy-options]

OPTIONS
    -b files  Shows messages only for the files you've modified
              (this is the default behavior)

    -b lines  Shows messages only for the lines you've modified
              (it's more restrictive than '-b files')

    -u        Ignore untracked files

    -h        Prints this help

Arguments after '--' get passed into clippy:
    clippy-dirty -- -p workspace-crate
    clippy-dirty -- --all-targets --all-features
    clippy-dirty -- -- -D clippy::new_without_default
    clippy-dirty -b lines -- -- -D clippy::new_without_default

Same for environmental variables:
    RUSTFLAGS="-D warnings" clippy-dirty
```

## Requirements

- bash,
- cargo,
- cargo-clippy,
- git,
- jq.

## Tests

Integration tests are located inside `./tests` - to execute them, you'll have to
install Nix and run `./test`.

## License

Copyright (c) 2020-2021, Patryk Wychowaniec <pwychowaniec@pm.me>.    
Licensed under the MIT license.
