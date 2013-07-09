#!/usr/bin/env bats

load test_helper

@test "default TS_DATA" {
  TS_DATA="" HOME=/home/user run ts echo TS_DATA
  assert_success
  assert_output "/home/user/.ts-data"
}

@test "inherited TS_DATA" {
  TS_DATA="/var/path" HOME=/home/user run ts echo TS_DATA
  assert_success
  assert_output "/var/path"
}
