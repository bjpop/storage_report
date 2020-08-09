#!/bin/bash

set -e
errors=0

# Run unit tests
python storage_report/storage_report_test.py || {
    echo "'python python/storage_report/storage_report_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E storage_report/*.py || {
    echo 'pylint -E storage_report/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
