# -*- mode: sh; sh-shell: bash; -*-

# Simple xunit implementation
#
# by torstein, torstein@skybert.net

x__total_count=0
x__errors=()
x__error_count=0

assert_equals() {
  local _expected=$1
  local _actual=$2
  x__total_count=$(( x__total_count + 1 ))

  if [[ "${_expected}" == "${_actual}" ]]; then
    return 0
  else
    x__error_count=$(( x__error_count + 1))
    printf "Expected: [%s] Actual: [%s]\\n" "${_expected}" "${_actual}"
    return 1
  fi
}

x__run_tests() {
  for fn in $(declare -f | grep ^test_ | cut -d' ' -f1); do
    printf "%s " "${fn}"
    "${fn}"
    echo
  done

  printf "\\nTests: %s Success: %s Error: %s\\n" \
         "${x__total_count}" \
         $(( x__total_count - x__error_count )) \
         "${x__error_count}"
  printf "%s\\n" "${x__errors}"

  if [ "${x__error_count}" -gt 0 ]; then
    exit 1
  fi
}
