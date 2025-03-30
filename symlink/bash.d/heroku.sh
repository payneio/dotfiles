#!/bin/bash

if hash heroku 2>/dev/null; then
  pathappend "/usr/local/heroku/bin"
  echo "heroku ready."
fi