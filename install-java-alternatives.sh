#!/bin/bash

root_path=$1

# All Java tools from: https://docs.oracle.com/javase/8/docs/technotes/tools/unix/intro.html
JAVA_BINARIES="appletviewer
extcheck
jar
java
javac
javadoc
javah
javap
jdb
jdeps
keytool
jarsigner
policytool
kinit
klist
ktab
native2ascii
rmic
rmiregistry
rmid
serialver
tnameserv
idlj
orbd
servertool
javapackager
pack200
unpack200
javaws
jcmd
jconsole
jmc
jvisualvm
schemagen
wsgen
wsimport
xjc
jps
jstat
jstatd
jinfo
jhat
jmap
jsadebugd
jstack
jrunscript"

for bin in ${JAVA_BINARIES}
do
  bin_path="$root_path/$bin"
  link_path="/usr/bin/$bin"
  if ! [ -f ${bin_path} ]; then
    echo "does not exist: $bin_path"
    exit 1
  fi
  echo "# installing $bin_path as $bin on $link_path"
  update-alternatives --install ${link_path} ${bin} ${bin_path} 1
  echo "# configuring $bin_path to be used as $bin"
  update-alternatives --set ${bin} ${bin_path}
done
