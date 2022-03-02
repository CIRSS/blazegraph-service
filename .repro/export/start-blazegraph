#!/bin/bash

# get the directory containing this script
PACKAGE=`dirname $0`

# Blazegraph working directory is under the REPRO mount point
DOT_BLAZEGRAPH=${REPRO_MNT}/.blazegraph

# create working directory if needed
if [[ ! -d ${DOT_BLAZEGRAPH} ]]
then
    mkdir -p ${DOT_BLAZEGRAPH}
    echo "*" > ${DOT_BLAZEGRAPH}/.gitignore
fi

cd ${DOT_BLAZEGRAPH}

# get the path to the Blazegraph jar file
jar=${PACKAGE}/blazegraph.jar


options="-server -Xmx4g -Dbigdata.propertyFile=${PACKAGE}/blazegraph.properties"
log=blazegraph_`date +%s`.log

java ${options} -jar ${jar} 2>&1 > ${log} &

