export PATH="tests/fixtures/path:$PATH"

export TS_HOME="tests/fixtures/ts_home"

assert_equal() {
  if [[ "$1" == "$2" ]]; then
    true
  else
    echo "  --- "
    echo "  severity: fail "
    echo "  data: "
    echo "    expected: $2"
    echo "    got: $1"
    false
  fi
}

teardown() {
  rm -rf "$TS_HOME"
}
