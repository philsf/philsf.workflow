#!/bin/bash

X11_IGNORE="X11 forwarding request failed on channel"
PULL_IGNORE="up-to-date|up to date|FETCH_HEAD|^From|$X11_IGNORE"
PUSH_IGNORE="up-to-date|up to date"

if git rev-parse ; then
    REMOTES=`git remote`
    BRANCH=`git branch | grep '^*' | sed 's/^\* //'`

    git remote update --prune 2>&1| egrep -v "Fetching|$X11_IGNORE"

    for REMOTE in $REMOTES
    do
	echo -n "$REMOTE "
	git pull $REMOTE $BRANCH 2>&1 | egrep -v "$PULL_IGNORE|$X11_IGNORE"
	git push $REMOTE : 2>&1 | egrep -v "$PUSH_IGNORE|$X11_IGNORE"
	git push --tags $REMOTE 2>&1 | egrep -v "$PUSH_IGNORE|$X11_IGNORE"
    done
fi
