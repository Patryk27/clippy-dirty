test: test {
  src = ./.;
  cmd = "clippy-dirty -b files -u";
  expected = ''
    --> src/a.rs:1:13
  '';
}
