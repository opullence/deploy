#!/usr/bin/env bash

args=$@
expect <<- DONE
        set timeout -1
        spawn /srv/gopath/bin/gitrob $args
        expect "*to stop web server and exit.*"
        send BYE
DONE
