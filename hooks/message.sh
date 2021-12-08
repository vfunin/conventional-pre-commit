#!/usr/bin/env bash

defaultTypes=("sup" "docs" "feat" "fix" "perf" "refactor" "revert" "style" "test")
types=("${defaultTypes[@]}")

if [ $# -eq 1 ]; then
  types=("${defaultTypes[@]}")
else
  # assume all args but the last are types
  while [ $# -gt 1 ]; do
    types+=("$1")
    shift
  done
fi

msgFile="$1"

regTypes="($(
  IFS='|'
  echo "${types[*]}"
))"
regScope="(\([[:alnum:] \/-]+\))?"
regDelimiter='!?:'
regSubject=" [[:alnum:]].+"
pattern="^$regTypes$regScope$regDelimiter$regSubject$"

if grep -Eq "$pattern" "$msgFile"; then
  exit 0
fi

echo "[Commit message] $(cat "$msgFile")"
echo "
Your commit message does not follow convention formatting
https://vfunin.notion.site/Git-4f60062dc10649d98882e147221b5ef5
Commits should start with one of the below types, followed by a colon,
followed by the commit message:
    $(
  IFS=' '
  echo "${types[*]}"
)
Example commit message adding a feature:
    feat: implement new API
Example commit message fixing an issue:
    fix: remove infinite loop
Optionally, include a scope in parentheses after the type for more context:
    fix(account): remove infinite loop
"
exit 1
