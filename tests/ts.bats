#!/usr/bin/env bats

load test_helper

@test "default TS_ROOT" {
  TS_ROOT="" HOME=/home/user run ts echo TS_ROOT
  assert_success
  assert_output "/home/user/.ts"
}

@test "inherited TS_ROOT" {
  TS_ROOT="/var/path" HOME=/home/user run ts echo TS_ROOT
  assert_success
  assert_output "/var/path"
}

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
