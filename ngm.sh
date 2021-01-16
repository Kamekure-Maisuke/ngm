#!/bin/sh

set -eo pipefail
export LC_ALL=C

[ "$1" = "-v" ] && {
	cat >&2 <<- EOF
	sr version 0.0.1
	EOF
	exit 0
}

NOGIZAKADATA='./data/member.html'

[ "$1" = "-a" ] && {
  cat "$NOGIZAKADATA" |
  grep '^<option value="http://blog.nogizaka' |
  sed 's;^<option .\{1,\}>\(.\{1,\}\)</option>;\1;g' |
  grep -E '.+? .+?' && exit 0
}

usage() {
  cat <<EOF
Usage: ngm [-a] [-v]

Script description here.

Available options:

-h      show all nogizaka member
-v      show version
EOF
  exit
}

usage