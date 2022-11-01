#!/bin/sh

#Use instance metadata for getting instance details

json_string=$(curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq)
echo $json_string | jq

#Get the PublicIP by entering publicIpAddress
read -p "Enter any data key to retrieve value: " keyvalue
echo $json_string | grep -oP '(?<="'$keyvalue'": ")[^"]*'