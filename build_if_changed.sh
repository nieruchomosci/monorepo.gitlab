#!/bin/bash
folder=${1}
command=${@:2}
DIRNAME="$( cd "$(dirname "$0")" ; pwd -P )"
${DIRNAME}/changes.sh ${folder}
if [[ $? -ne 0 ]]; then
  echo "Skipping build for '${folder}'."
  exit 0
fi

echo
echo "Building '${folder}'..."
echo "Executing '${command}'..."
echo
exec ${command}
exitCode=$?

exit ${exitCode}
