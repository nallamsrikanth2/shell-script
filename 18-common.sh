#!/bin/bash

COURSE="my name is srikanth"
echo "Before calling $COURSE"
echo "process instance id $$"

./19-other-script.sh

echo "After calling $COURSE"
echo "process instance is $$"
