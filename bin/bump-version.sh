#!/bin/bash
yml=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
yml="$yml/../app/config/common/version.yml"
read -p "Enter a version number: " VERSION_NUMBER

version=`grep -A3 'version:' $yml | tail -n1 | awk '{ print $2}' | sed -e "s/'//g" `
version="$VERSION_NUMBER $(date '+%Y%m%d%H%M')"

sed -i "s/\(.*version:.*\)/  version: '$version'/g" $yml