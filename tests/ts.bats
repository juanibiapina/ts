#!/usr/bin/env bats

load test_helper

@test "without argument, status is zero" {
  run ./bin/ts
  assert_equal "$status" "0"
}

@test "without arguments, prints current time" {
  run ./bin/ts
  assert_equal "${lines[0]}" "+%H %M"
}

@test "without arguments, adds current time to file for today" {
  run ./bin/ts
  result=`cat $TS_HOME/log-+%m-%d-%Y`
  assert_equal "$result" "+%H %M"
}
