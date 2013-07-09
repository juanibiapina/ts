#!/usr/bin/env bats

load test_helper

setup() {
  mock_mail
  export CURRENT_DATE="10-20-2000"
}

@test "without configuration, fails with message" {
  run ts-mail
  assert_failure
  assert_output 'ts: no mail configuration found'
}

@test "without configuration, without log, fails with message" {
  create_mail_config "target@mail"

  run ts-mail
  assert_failure
  assert_output 'ts: no log for today'
}

@test "with configuration and log, send a mail" {
  echo "10 10" > "$TS_DATA/log-10-20-2000"
  echo "11 11" >> "$TS_DATA/log-10-20-2000"
  create_mail_config "target@mail"

  run ts-mail
  assert_success
  assert_output "mail -s 'Timesheet for 10-20-2000' target@mail"
}
