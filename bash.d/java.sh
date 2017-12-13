#!/bin/bash

if [ -d "/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home" ]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home
  echo "JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home"

elif [ -d "/usr/lib/jvm/java-8-oracle/" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
  echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle/"

elif [ -d "/usr/lib/jvm/java-1.8.0-openjdk-amd64/" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/
  echo "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/"

elif [ -d "/usr/lib/jvm/java-7-openjdk-amd64/" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
    echo "JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/"
fi

groovy_dir="/usr/local/opt/groovy/libexec"
if [ -d $groovy_dir ]; then
  export GROOVY_HOME=$groovy_dir
  echo "GROOVY_HOME=$groovy_dir"
fi

echo "java ready."

