#!/usr/bin/env bash

localBranch="feat/F12/sstest-branch"
regProduct='([a-zA-Z0-9\-]+)?(\/)?'
regType='(sup|docs|feat|fix|perf|refactor|revert|style|test)\/'
regNumber='(F|N|support)([0-9\_\-]*)?'
regName='([a-zA-Z0-9\-\/]+)'
pattern="$regProduct$regType$regNumber$regName"

if echo "$localBranch" | grep -qE "${pattern}" ; then
  exit 0
fi

echo "
There is something wrong with your branch name.
Branch names in this project must adhere to this contract:
https://vfunin.notion.site/Git-4f60062dc10649d98882e147221b5ef5
Your commit will be rejected.
You should rename your branch to a valid name and try again.
"

exit 1
