#!/bin/bash

# https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

# Check if the provided user is already declared on the image
if [ $USER_ID -eq 1000 ];then
  echo "External user id is the same as opencpu user id 1000"
else
	echo "Creating user with UID : $USER_ID"
	useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
	export HOME=/home/user
fi

exec "$@"
