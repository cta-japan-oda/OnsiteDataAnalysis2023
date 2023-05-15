#!/bin/bash

LOGSTDOUT=./stdout.log
LOGSTDERR=./stderr.log

exec 1>>$LOGSTDOUT
exec 2>>$LOGSTDERR

. ./submittee.sh

