#!/usr/bin/env bats

load test_helper

setup() {
  export CURRENT_DATE="10-20-2000"
}

@test "prints all log entries for today" {
  echo "10 10" > "$TS_DATA/log-10-20-2000"
  echo "11 11" >> "$TS_DATA/log-10-20-2000"
  run ts-show
  assert_success
  assert_output <<SH
10 10
11 11
SH
}
