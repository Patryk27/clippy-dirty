test: test {
  src = ./.;
  cmd = "clippy-dirty -b files";
  expected = ''
    --> src/new.rs:1:15
    --> src/old.rs:1:15
  '';
}
