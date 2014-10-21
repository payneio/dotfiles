#!/bin/bash

if hash psql 2>/dev/null; then
  pathprepend "/Applications/Postgres.app/Contents/MacOS/bin"
  echo "psql ready."
fi