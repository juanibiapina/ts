#!/usr/bin/env bats

load test_helper

setup() {
  mock_vi
  export CURRENT_DATE="10-20-2000"
}

@test "opens the file for today with vi" {
  run ts-edit
  assert_success
  assert_output "$TS_DATA/log-10-20-2000"
}
