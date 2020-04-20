# clippy-dirty

Runs `cargo clippy` and shows only messages affecting uncommited (dirty) files.

## Installation

You can either clone the entire repository and add it to your `PATH` or just copy-paste the `clippy-dirty` script wherever you like.

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

The MIT License (MIT)

Copyright (c) 2020 Patryk Wychowaniec

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
