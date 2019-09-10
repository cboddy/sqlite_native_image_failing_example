#
# sqlite dependency: https://mvnrepository.com/artifact/org.xerial/sqlite-jdbc/3.27.2
# javac, java and  native-image installed from:  
#   https://github.com/oracle/graal/releases/download/vm-19.2.0/graalvm-ce-linux-amd64-19.2.0.tar.gz
#

javac -cp ".:sqlite-jdbc-3.27.2.jar" SqliteNativeClient.java 

native-image -cp ".:sqlite-jdbc-3.27.2.jar" SqliteNativeClient\
    --allow-incomplete-classpath\
	--initialize-at-build-time=org.sqlite.JDBC\
	--initialize-at-build-time=org.sqlite.core.DB\$ProgressObserver\
	--initialize-at-build-time=org.sqlite.core.DB\
	--initialize-at-build-time=org.sqlite.core.NativeDB\
	--initialize-at-build-time=org.sqlite.ProgressHandler\
	--initialize-at-build-time=org.sqlite.Function\
	--initialize-at-build-time=org.sqlite.Function\$Aggregate\
	--initialize-at-build-time=org.sqlite.Function\$Window\
	-H:+AllowVMInspection\
	-H:+ReportUnsupportedElementsAtRuntime\
	-H:EnableURLProtocols=http\
	-Dfile.encoding=UTF-8
