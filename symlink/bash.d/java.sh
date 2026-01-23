#!/bin/bash

# Find JAVA_HOME - check modern JDKs first, then fall back to older versions
if [ -d "/usr/lib/jvm/java-21-openjdk-amd64" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
elif [ -d "/usr/lib/jvm/java-17-openjdk-amd64" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
elif [ -d "/usr/lib/jvm/java-11-openjdk-amd64" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
elif command -v java &>/dev/null; then
  # Try to detect JAVA_HOME from the java command
  java_path=$(readlink -f "$(which java)" 2>/dev/null)
  if [ -n "$java_path" ]; then
    # Strip /bin/java from the path
    export JAVA_HOME="${java_path%/bin/java}"
  fi
fi

if [ -n "$JAVA_HOME" ]; then
  echo "JAVA_HOME=$JAVA_HOME"
  echo "java ready."
fi
