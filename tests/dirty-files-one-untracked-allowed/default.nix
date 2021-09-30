test: test {
  src = ./.;
  cmd = "clippy-dirty -b files";
  expected = ''
    --> src/a.rs:1:13
    --> src/b.rs:1:13
  '';
}
