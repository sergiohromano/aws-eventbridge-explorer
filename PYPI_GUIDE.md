# Publishing AWS EventBridge Explorer to PyPI

This guide explains how to publish AWS EventBridge Explorer to PyPI.

## Repository Information

- GitHub Repository: https://github.com/glyphtek/aws-eventbridge-explorer
- Last Updated: 2025

## Prerequisites

Before publishing, make sure you have the following:

1. A PyPI account (create one at https://pypi.org/account/register/)
2. An API token from PyPI (create one at https://pypi.org/manage/account/token/)
3. Required Python packages:
   ```bash
   pip install build twine
   ```

## Configuration

1. Create a `.pypirc` file in your home directory (copy from `.pypirc.template`):
   ```bash
   cp .pypirc.template ~/.pypirc
   ```

2. Edit the `.pypirc` file and add your token:
   ```bash
   nano ~/.pypirc
   ```

## Building and Publishing

You can use the provided `publish.sh` script:

```bash
./publish.sh
```

Or manually:

1. Clean previous builds:
   ```bash
   rm -rf build/ dist/ *.egg-info/
   ```

2. Build the package:
   ```bash
   python -m build
   ```

3. Upload to TestPyPI (recommended for testing):
   ```bash
   python -m twine upload --repository testpypi dist/*
   ```

4. Test installation from TestPyPI:
   ```bash
   pip install --index-url https://test.pypi.org/simple/ aws-eventbridge-explorer
   ```

5. Upload to PyPI:
   ```bash
   python -m twine upload dist/*
   ```

## Updating the Package

1. Update the version number in:
   - `pyproject.toml`
   - `eventbridge/__init__.py`

2. Update the package information if needed.

3. Follow the same building and publishing steps.

## Testing Before Publishing

It's a good practice to test the package locally before publishing:

```bash
pip install -e .
```

Then run:

```bash
eventbridge-explorer --port 5050
``` 