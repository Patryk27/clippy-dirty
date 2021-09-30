test: test {
  src = ./.;
  cmd = "clippy-dirty -b lines";
  expected = ''
    --> src/lib.rs:5:15
    --> src/lib.rs:13:16
  '';
}
