#!/bin/bash

java_dir="/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home"
if [ -d $java_dir ]; then
  export JAVA_HOME=$java_dir
  echo "JAVA_HOME=$java_dir"
fi

java_dir="/usr/lib/jvm/java-7-openjdk-amd64/"
if [ -d $java_dir ]; then
  export JAVA_HOME=$java_dir
  echo "JAVA_HOME=$java_dir"
fi

groovy_dir="/usr/local/opt/groovy/libexec"
if [ -d $groovy_dir ]; then
  export GROOVY_HOME=$groovy_dir
  echo "GROOVY_HOME=$groovy_dir"
fi

