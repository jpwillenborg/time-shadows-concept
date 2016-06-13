@ECHO OFF

:: Comment out this if graphics errors occur
SET XACCEL=-Dsun.java2d.d3d=True -Dsun.java2d.d3dtexbpp=16 -Dsun.java2d.translaccel=true -Dsun.java2d.ddscale=true

::SET OPTS=-debug -extview -lowmem=10000

java -Xms256m -Xmx256m -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:SoftRefLRUPolicyMSPerMB=100000 -Xincgc %XACCEL% -jar ttfedit.jar %OPTS%
pause