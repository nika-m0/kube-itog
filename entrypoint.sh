#!/bin/sh

if [ -n "$ROOT_APP_NAME" ]; then
    echo "Starting root-service on port $ROOT_BIND_PORT"
    exec ./root-app
elif [ -n "$API_APP_NAME" ]; then
    echo "Starting api-service on port $API_BIND_PORT"
    exec ./api-app
elif [ -n "$INFO_APP_NAME" ]; then
    echo "Starting info-service on port $INFO_BIND_PORT"
    exec ./info-app
elif [ -n "$LOGIN_APP_NAME" ]; then
    echo "Starting login-service on port $LOGIN_BIND_PORT"
    exec ./login-app
else
    echo "No service specified. Please set one of:"
    echo "ROOT_APP_NAME, API_APP_NAME, INFO_APP_NAME, or LOGIN_APP_NAME"
    exit 1
fi
