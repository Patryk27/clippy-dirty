test: test {
  src = ./.;
  cmd = "clippy-dirty -b files";
  expected = ''
    --> src/lib.rs:1:15
  '';
}
