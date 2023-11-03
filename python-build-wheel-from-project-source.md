# Python Cheat Sheet
Commonly used python patterns

## Build Install a Wheel from Project Source
```
# Build
pip3 wheel --wheel-dir=wheel $(realpath src)
# Install
pip3 install --user --no-index --find-links=wheel medusa
```
