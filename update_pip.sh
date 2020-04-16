#!/usr/bin/env bash
set -e
# This is a script which updates the pip and conda builds so that pip install and conda install work with new master

rm -rf dist
rm -rf build
rm -rf src/*.egg-info
python setup.py clean --all sdist bdist_wheel
python3 setup.py sdist bdist_wheel
twine check dist/*
twine upload --skip-existing dist/*.whl dist/*.gz

#if [ "$CONDA" != false ] ; then
#    echo "conda skeleton pypi ${PNAME}"
#    conda skeleton pypi ${PNAME}
##    wget https://conda.io/docs/_downloads/build1.sh -P ${PNAME}/
##    wget https://conda.io/docs/_downloads/bld.bat -P ${PNAME}/
#
##    if [ "$ALL" = true ] ; then
##        echo "Building python 2.7 and 3.4 versions"
##        conda-build --python 2.7 ${PNAME}/
##        conda-build --python 3.4 ${PNAME}/
##    fi
##    Find path of tar.bz2 build file if completed correctly
#    regex="TEST END: (\/.+conda-bld.+tar\.bz2).+Uploading"
#    OUTPUT="$(conda-build --python 3.6 py3helpers 2>&1)"
#    if [[ ${OUTPUT} =~ $regex ]]
#        then
#            echo ${BASH_REMATCH[1]}
#            anaconda login
#            echo `conda convert --platform all ${BASH_REMATCH[1]} -o outputdir`
#            echo `anaconda upload outputdir/*/*`
#
#        else
#            echo "${regex} doesn't match" >&2 # this could get noisy if there are a lot of non-matching files
#    fi
#    rm -r outputdir
#fi
