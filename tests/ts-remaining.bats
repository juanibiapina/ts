#!/usr/bin/env bats

load test_helper

setup() {
  export CURRENT_DATE="10-20-2000"
}

@test "remaining minutes" {
  echo "12 00" > "$TS_DATA/log-10-20-2000"
  echo "12 01" >> "$TS_DATA/log-10-20-2000"

  run ts-remaining
  assert_success
  assert_output "07 59"
}

@test "remaining hours" {
  echo "12 00" > "$TS_DATA/log-10-20-2000"
  echo "13 00" >> "$TS_DATA/log-10-20-2000"

  run ts-remaining
  assert_success
  assert_output "07 00"
}

@test "remaining hours and minutes" {
  echo "10 10" > "$TS_DATA/log-10-20-2000"
  echo "13 50" >> "$TS_DATA/log-10-20-2000"

  run ts-remaining
  assert_success
  assert_output "04 20"
}

@test "remaining running hours and minutes" {
  export CURRENT_HOUR="11"
  export CURRENT_MINUTE="11"
  echo "10 10" > "$TS_DATA/log-10-20-2000"

  run ts-remaining
  assert_success
  assert_output "06 59"
}

@test "remaining running hours and minutes after pause" {
  export CURRENT_HOUR="13"
  export CURRENT_MINUTE="30"
  echo "10 00" > "$TS_DATA/log-10-20-2000"
  echo "11 10" >> "$TS_DATA/log-10-20-2000"
  echo "12 20" >> "$TS_DATA/log-10-20-2000"

  run ts-remaining
  assert_success
  assert_output "05 40"
}
