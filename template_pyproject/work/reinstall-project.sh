#!/usr/bin/bash
cwdf=$(realpath $0)
cwdd=$(dirname ${cwdf})
cd ${cwdd}
flake8 --max-line-length 100 --indent-size 4 --ignore E712,W504,E902 src/lib/*.py
if [ $? -ne 0 ]; then exit 1; fi
pip3 uninstall <pyproject>
# copy wheel dependencies here
cp ../../rlab_common/work/wheel/* wheel
pip3 wheel --wheel-dir=wheel --no-index --find-links=wheel $(realpath src)
pip3 install --user --no-index --find-links=wheel <pyproject>

