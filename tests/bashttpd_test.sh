#! /usr/bin/env bash
#set -x

a="../bashttpd.conf"
testIssueFileisServed() {
   assertEquals "issue URI" "/etc/issue" `cat $a | egrep -i serve_file | egrep -i "\/etc\/issue" | awk -F '\"' '{print$2}'`    
}


testShellHistoruisServed() {
   assertEquals "History URI" "/root/.bash_history" `cat $a | egrep -i serve_file | egrep -i "\/history" | awk -F '\"' '{print$2}'`    
}

#load shUnit2
. ../../shunit2/shunit2
