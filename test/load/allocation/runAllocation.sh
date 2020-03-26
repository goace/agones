# Copyright 2020 Google LLC All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash
# Provide the number of times you want allocation test to be run
testRunsCount=3
if [ -z "$1" ]
    then
        echo "No test run count provided, using default which is 3"
    else
        testRunsCount=$1
        if ! [[ $testRunsCount =~ ^[0-9]+$ ]] ; then
            echo "error: Not a positive number provided" >&2; exit 1
        fi
fi

counter=1
while [ $counter -le $testRunsCount ]
do
    echo "Run number: " $counter
    go run allocationload.go 2>>./allocation_test_results.txt
    sleep 500
    ((counter++))
done