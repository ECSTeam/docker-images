#!/bin/bash

source ip_functions.sh
cidr=10.3.16.0/20
return_var='test'
get_ip_range_from_cidr return_var $cidr 10 20
get_ip_range_from_cidr return_var $cidr 0 20
echo $return_var

get_ip_from_cidr return_var1 "10.0.0.0/16" "1"
echo "return_var1 = $return_var1"
