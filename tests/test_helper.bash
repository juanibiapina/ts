TS_TEST_DIR="${BATS_TMPDIR}/ts"

export PATH="${BATS_TEST_DIRNAME}/libexec:$PATH"
export PATH="${BATS_TEST_DIRNAME}/../libexec:$PATH"

export TS_DATA="${TS_TEST_DIR}/data"

mkdir -p "$TS_DATA"

teardown() {
  rm -rf "$TS_TEST_DIR"
}

mock_date() {
  export PATH="${BATS_TEST_DIRNAME}/path/date:$PATH"
}

mock_vi() {
  export PATH="${BATS_TEST_DIRNAME}/path/vi:$PATH"
}

load assertions
