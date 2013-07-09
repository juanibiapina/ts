#!/usr/bin/env bats

load test_helper

setup() {
  export CURRENT_HOUR="10"
  export CURRENT_MINUTE="30"
  export CURRENT_DATE="10-20-2000"
}

@test "prints current time and adds it to file for today" {
  mock_date

  run ts-log
  assert_success
  assert_output "10 30"
  assert [ "$(cat $TS_DATA/log-10-20-2000)" = "10 30" ]
}
