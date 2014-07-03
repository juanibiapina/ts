#!/usr/bin/env bats

load test_helper

setup() {
  export CURRENT_DATE="10-20-2000"
}

@test "final minutes" {
  export CURRENT_HOUR="13"
  export CURRENT_MINUTE="30"
  echo "12 00" > "$TS_DATA/log-10-20-2000"
  echo "12 01" >> "$TS_DATA/log-10-20-2000"

  run ts-final
  assert_success
  assert_output "21 29"
}

@test "final hours" {
  export CURRENT_HOUR="13"
  export CURRENT_MINUTE="30"
  echo "12 00" > "$TS_DATA/log-10-20-2000"
  echo "13 00" >> "$TS_DATA/log-10-20-2000"

  run ts-final
  assert_success
  assert_output "20 30"
}

@test "final hours and minutes" {
  echo "10 10" > "$TS_DATA/log-10-20-2000"
  echo "13 50" >> "$TS_DATA/log-10-20-2000"

  run ts-final
  assert_success
  assert_output "04 20"
}

@test "final running hours and minutes" {
  export CURRENT_HOUR="11"
  export CURRENT_MINUTE="11"
  echo "10 10" > "$TS_DATA/log-10-20-2000"

  run ts-final
  assert_success
  assert_output "18 10"
}

@test "final running hours and minutes after pause" {
  export CURRENT_HOUR="13"
  export CURRENT_MINUTE="30"
  echo "10 00" > "$TS_DATA/log-10-20-2000"
  echo "11 10" >> "$TS_DATA/log-10-20-2000"
  echo "12 20" >> "$TS_DATA/log-10-20-2000"

  run ts-final
  assert_success
  assert_output "19 10"
}
