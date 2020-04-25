# clippy-dirty

`cargo clippy`, but only for the files / lines you've just modified.

## Abstract

By default, `cargo clippy` shows messages for the entire project - i.e. even if you modify a single file, you'll still
see all the messages for all the other files in your crate.

This is a great behavior overall, but can be troublesome when you start to introduce `clippy` to your workflow and can't
afford to apply all the suggestions at once.

And for that comes `clippy-dirty` - it's a script that, simplifying a bit, invokes `git status` and `cargo clippy`, and
shows only those messages that affect uncommitted files.

It can also narrow down messages to just the _lines_ you've modified (so not necessarily entire files) - you can find
synopsis below.

## Installation

- clone this repository and add it to your `PATH`
or
- download the `clippy-dirty` script wherever you like and invoke it using full path (e.g. `~/Apps/clippy-dirty`)

## Usage

Use in place of `cargo clippy`, e.g.:

```bash
$ cd ~/Projects/go-brr-meme-maker
$ clippy-dirty
```

```
USAGE
    clippy-dirty [options] [--] [clippy-options]

OPTIONS
    -b files  Shows messages only for the _files_ you've modified
              (this is the default behavior)

    -b lines  Shows messages only for the _lines_ you've modified
              (it's more restrictive than '-b files')

    -h        Prints this help

Arguments after '--' get passed directly into clippy:
    clippy-dirty -- -D clippy::new_without_default
    clippy-dirty -b lines -- -D clippy::new_without_default
```

## Requirements

- bash,
- cargo,
- cargo-clippy,
- git,
- jq.

## License

MIT License    
Copyright (c) 2020 Patryk Wychowaniec

Please see the `LICENSE` file for the entire text.
