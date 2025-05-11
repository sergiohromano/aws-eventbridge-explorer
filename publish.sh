#!/bin/bash
# Script to build and publish AWS EventBridge Explorer to PyPI

echo "Cleaning previous builds..."
rm -rf build/ dist/ *.egg-info/

echo "Building package..."
python -m build

echo "Publishing to PyPI..."
echo "Do you want to publish to test.pypi.org first? (y/n)"
read test_first

if [ "$test_first" = "y" ]; then
    echo "Publishing to Test PyPI..."
    python -m twine upload --repository testpypi dist/*
    
    echo "Testing installation from Test PyPI..."
    echo "pip install --index-url https://test.pypi.org/simple/ aws-eventbridge-explorer"
    
    echo "Proceed with publishing to production PyPI? (y/n)"
    read proceed
    
    if [ "$proceed" != "y" ]; then
        echo "Aborted production publishing."
        exit 0
    fi
fi

echo "Publishing to production PyPI..."
python -m twine upload dist/*

echo "Done!" 