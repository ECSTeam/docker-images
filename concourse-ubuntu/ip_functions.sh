#!/bin/bash

# get ip range from cidr
# $1 - return variable, output will be "10.3.0.1-10.3.0.10"
# $2 - cidr, e.g: 10.3.0.0/24
# $3 - begin, e.g: 1
# $4 - end, e.g: 10
function get_ip_range_from_cidr() {
    eval "$1=`echo $2`"
    cidr=$2
    begin=$3
    end=$4
    #echo $cidr
    #last=`echo $cidr |awk -F'/' '{print $1}' | awk -F'.' '{print $4}'`
    last_octect=`echo $cidr |awk -F'/' '{print $1}' | awk -F'.' '{print $4}'`
    #echo "last_octect  $last_octect"
    prefix=`echo $cidr |awk -F'/' '{print $1}' | awk -F'.' '{print $1"."$2"."$3}'`
    let start=$last_octect+$begin
    let end=$last_octect+$end

    # return value
    eval "$1=`echo $prefix.$start-$prefix.$end`"
}

# get ip range from cidr
# $1 - return variable, output will be "10.3.0.1"
# $2 - cidr, e.g: 10.3.0.0/24
# $3 - ip, e.g: 1
function get_ip_from_cidr() {
    eval "$1=`echo $2`"
    cidr=$2
    begin=$3
    end=$4
    #echo $cidr
    #last=`echo $cidr |awk -F'/' '{print $1}' | awk -F'.' '{print $4}'`
    last_octect=`echo $cidr |awk -F'/' '{print $1}' | awk -F'.' '{print $4}'`
    #echo "last_octect  $last_octect"
    prefix=`echo $cidr |awk -F'/' '{print $1}' | awk -F'.' '{print $1"."$2"."$3}'`
    let start=$last_octect+$begin

    # return value
    eval "$1=`echo $prefix.$start`"
}
