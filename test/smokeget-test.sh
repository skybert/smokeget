#! /usr/bin/env bash

## author: torstein, torstein@skybert.net

test_time_to_seconds() {
  local input="0 0.008"
  local expected actual
  expected=.008
  actual=$(sg__time_to_seconds "${input}")
  assert_equals "${expected}" "${actual}"
}

test_time_to_seconds_with_minutes() {
  local input="2 0.008"
  local expected actual
  expected=120.008
  actual=$(sg__time_to_seconds "${input}")
  assert_equals "${expected}" "${actual}"
}

test_calculate_elapsed_time() {
  local start=1683404546
  local stop=1685704546
  local expected actual
  expected=2300000
  actual=$(sg__calculate_elapsed_time "${start}" "${stop}")
  assert_equals "${expected}" "${actual}"
}

test_calculate_elapsed_time_start_padding() {
  local start=01683404546
  local stop=1685704546
  local expected actual
  expected=2300000
  actual=$(sg__calculate_elapsed_time "${start}" "${stop}")
  assert_equals "${expected}" "${actual}"
}

test_calculate_elapsed_time_end_padding() {
  local start=1683404546
  local stop=01685704546
  local expected actual
  expected=2300000
  actual=$(sg__calculate_elapsed_time "${start}" "${stop}")
  assert_equals "${expected}" "${actual}"
}

test_is_output_gnuplot() {
  local expected actual
  expected=0
  sg__is_output_gnuplot "${input}"
  actual=$?
  assert_equals "${expected}" "${actual}"
}

test_is_output_gnuplot_not() {
  local expected actual
  expected=1
  export sg_output=dot
  sg__is_output_gnuplot "${input}"
  actual=$?
  assert_equals "${expected}" "${actual}"
}

main() {
  source "$(dirname "$0")/../lib/$(basename "$0" -test.sh)-lib.sh"
  source "$(dirname "$0")/../test/xunit.sh"
  x__run_tests
}


main "$@"
