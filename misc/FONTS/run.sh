#!/bin/sh
# Comment out this when graphics problems occur
#XACCEL="-Dsun.java2d.opengl=True -Dsun.java2d.translaccel=true"

# OPTS="-debug -extview -lowmem=10000"

java -Xms256m -Xmx256m -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:SoftRefLRUPolicyMSPerMB=100000 -Xincgc $XACCEL -jar ./ttfedit.jar $OPTS
