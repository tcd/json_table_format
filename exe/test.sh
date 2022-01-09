#!/usr/bin/env bash

test_file="/Users/clay/TCD/json_table_format/test/support/fixtures/files/case-1/input.json"

# ./exe/json-table-format -h
cat $test_file | ./exe/json-table-format
./exe/json-table-format -f $test_file

# ./exe/json-table-format
