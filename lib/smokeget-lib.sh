# -*- mode: sh; sh-shell: bash; -*-

## author: torstein, torstein@skybert.net

sg_output=gnuplot

sg__time_to_seconds() {
  local _time=$1

  IFS=' ' read -r _minutes _seconds <<< "${_time}"
  local _minutes_in_seconds=
  _minutes_in_seconds=$(( _minutes * 60 ))
  printf "%s + %s\\n" "${_minutes_in_seconds}" "${_seconds}" | bc
}

sg__calculate_elapsed_time() {
  local _start=$1
  local _stop=$2

  if [[ "${_start:0:1}" == 0 ]]; then
    _start=${_start:1}
  fi
  if [[ "${_stop:0:1}" == 0 ]]; then
    _stop=${_stop:1}
  fi

  printf "%s\\n" $(( _stop - _start ))
}

sg__is_output_gnuplot() {
  [[ "${sg_output-""}" == "gnuplot" ]]
}
