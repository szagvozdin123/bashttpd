#! /usr/bin/env bash
#set -x

a="./bashttpd.conf"
testIssueFileisServed() {
   assertEquals "Issue URI" "/etc/issue" `cat $a | egrep -i serve_file | egrep -i "\/etc\/issue" | awk -F '\"' '{print$2}'`    
}


testShellHistoruisServed() {
   assertEquals "History URI" "/tmp/bash_history" `cat $a | egrep -i serve_file | egrep -i "\/history" | awk -F '\"' '{print$2}'`    
}

#load shUnit2
. $SHUNIT2_HOME/shunit2
