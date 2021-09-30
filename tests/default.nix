let
  tests = [
    ./dirty-files-one-staged
    ./dirty-files-one-unstaged
    ./dirty-files-one-untracked-allowed
    ./dirty-files-one-untracked-forbidden
    ./dirty-files-two-staged
    ./dirty-files-two-unstaged
    ./dirty-lines
    ./issue-3
  ];

  # ----- #

  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/7017a662007a2d7becd3b0298b341bcaea2d36d3.tar.gz";
    sha256 = "sha256:0ykahd48ygmg9hxy18bb017906dlv92ln9ajcdl6zglcfy0c6jj1";
  };

  pkgs = import nixpkgs { };

  # ----- #

  clippy-dirty = pkgs.runCommandLocal "clippy-dirty"
    {
      script = ../clippy-dirty;

      nativeBuildInputs = with pkgs; [
        makeWrapper
      ];
    } ''
    mkdir -p $out/bin

    cp $script $out/bin/clippy-dirty

    substituteInPlace $out/bin/clippy-dirty \
      --replace '/usr/bin/env bash' '${pkgs.bash}/bin/bash'

    wrapProgram $out/bin/clippy-dirty \
      --prefix PATH : ${with pkgs; lib.makeBinPath [ cargo git jq rustPackages.clippy ]}
  '';

  # ----- #

  test = { src, cmd, expected }:
    let
      expected' = pkgs.writeText "expected" expected;

    in
    pkgs.runCommandLocal "test" { } ''
      export PATH="$PATH:${clippy-dirty}/bin"

      cp -avr ${src}/fixtures /tmp/test
      cd /tmp/test
      chmod 777 .
      mv git .git
      mkdir target

      ${cmd} \
          | grep 'src' \
          | sed 's/\x1b\[[0-9;]*m//g' \
          | awk '{$1=$1};1' \
          > /tmp/actual.txt

      cp ${expected'} /tmp/expected.txt

      echo
      echo "Test:"
      echo "${src}"
      echo
      echo "Actual:"
      cat /tmp/actual.txt
      echo
      echo "Expected:"
      cat /tmp/expected.txt
      echo
      echo "Diff:"
      diff /tmp/actual.txt /tmp/expected.txt

      touch $out
    '';

in
builtins.map
  (path: (import path) test)
  tests
