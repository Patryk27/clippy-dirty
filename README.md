# clippy-dirty

Runs `cargo clippy` and shows only messages affecting uncommited (dirty) files.

## Installation

You can either clone the entire repository and add it to your `PATH` or just copy-paste the `clippy-dirty` script wherever you like.

## Usage

Use in place of `cargo clippy`, e.g.:

```bash
$ cd ~/Projects/go-brr-meme-maker
$ clippy-dirty
```

## Synopsis

```
USAGE:
    clippy-dirty [ARGS]

Every argument gets passed directly into `clippy`, so you can do:
    clippy-dirty -D clippy::new_without_default
```

## Requirements

- cargo,
- clippy,
- git,
- jq.

## License

MIT License    
Copyright (c) 2020 Patryk Wychowaniec

Please see the `LICENSE` file for the entire text.
