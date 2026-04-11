#!/bin/bash

COURSE="my name is srikanth"
echo "Before calling $COURSE"
echo "process instance id $$"

./other-script.sh

echo "After calling $COURSE"
echo "process instance is $$"
