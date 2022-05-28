#!/usr/bin/env bash
# This file is released under the CC0 1.0 Universal (CC0 1.0) Public Domain Dedication.
# See the LICENSE.txt file or https://creativecommons.org/publicdomain/zero/1.0/ for details.

tag_name=`git tag -l --points-at HEAD`
if [[ -z "$tag_name" ]]; then
  exit 1
fi
for file in *.sh
do
    last_update_date=`git log --max-count 1 --pretty=format:"%cs" ${file}`
    cat $file \
    | sed "s/##tag_name/${tag_name}/g" \
    | sed "s/##last_update_date/${last_update_date}/g" \
    > ./dist/$file
done;
