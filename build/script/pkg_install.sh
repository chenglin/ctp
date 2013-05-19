#!/bin/sh
# Basic Install Shell Script for Linux


# create val
PathBase="$1"
OSName="$2"
SrcBinPath="${PathBase}/run"
PkgName="basic-$3"
TempDir="${PathBase}/tmp"

# define shell commond
CP="cp"
MKDIR="mkdir"
RM="rm -rf"
CD="cd"
TAR="tar -cvf"
GZIP="gzip"
MV="mv"

	${MKDIR} ${PathBase}/Basic_pkg
# make tmp dir
	${RM} ${TempDir}
	${RM} ${PathBase}/Basic_pkg/${PkgName}.tar
	${RM} ${PathBase}/Basic_pkg/${PkgName}.tar.gz

	${MKDIR} ${TempDir}
	${MKDIR} ${TempDir}/basic
	${MKDIR} ${TempDir}/basic/conf
	${MKDIR} ${TempDir}/basic/man
	${MKDIR} ${TempDir}/basic/log
	${MKDIR} ${TempDir}/basic/lib
	${MKDIR} ${TempDir}/basic/lib64
	${MKDIR} ${TempDir}/basic/bin
	${MKDIR} ${TempDir}/basic/bin64
	${MKDIR} ${TempDir}/basic/include
	${MKDIR} ${TempDir}/basic/include/core
	${MKDIR} ${TempDir}/basic/include/app
	${MKDIR} ${TempDir}/basic/include/bus
	${MKDIR} ${TempDir}/basic/include/config
	${MKDIR} ${TempDir}/basic/include/db
	${MKDIR} ${TempDir}/basic/include/log
	${MKDIR} ${TempDir}/basic/include/net
	${MKDIR} ${TempDir}/basic/include/regex
	${MKDIR} ${TempDir}/basic/include/ssl
	${MKDIR} ${TempDir}/basic/include/xml
	${MKDIR} ${TempDir}/basic/include/zip
	${MKDIR} ${TempDir}/basic/include/mod

# cpoy file
        ${CP} ${PathBase}/doc/html/*.*                    ${TempDir}/basic/man
	${CP} ${PathBase}/run/conf.bak/*.*                    ${TempDir}/basic/conf
	
	${CP} ${PathBase}/src/core/include/core/*.h               ${TempDir}/basic/include/core
	${CP} ${PathBase}/src/app/include/app/*.h                 ${TempDir}/basic/include/app
	${CP} ${PathBase}/src/bus/include/bus/*.h                 ${TempDir}/basic/include/buS
	${CP} ${PathBase}/src/config/include/config/*.h           ${TempDir}/basic/include/config
	${CP} ${PathBase}/src/db/include/db/*.h                   ${TempDir}/basic/include/db
	${CP} ${PathBase}/src/log/include/log/*.h                 ${TempDir}/basic/include/log
	${CP} ${PathBase}/src/net/include/net/*.h                 ${TempDir}/basic/include/net
	${CP} ${PathBase}/src/regex/include/regex/*.h             ${TempDir}/basic/include/regex
	${CP} ${PathBase}/src/ssl/include/ssl/*.h                 ${TempDir}/basic/include/ssl
	${CP} ${PathBase}/src/xml/include/xml/*.h                 ${TempDir}/basic/include/xml
	${CP} ${PathBase}/src/zip/include/zip/*.h                 ${TempDir}/basic/include/zip
	${CP} ${PathBase}/src/mod/include/mod/*.h                 ${TempDir}/basic/include/mod
	
	${CP} ${SrcBinPath}/lib/*.*                         ${TempDir}/basic/lib
	${CP} ${SrcBinPath}/lib64/*.*                       ${TempDir}/basic/lib64
	
	${CP} ${SrcBinPath}/bin/*_test                           ${TempDir}/basic/bin
	${CP} ${SrcBinPath}/bin/app                              ${TempDir}/basic/bin
	${CP} ${SrcBinPath}/bin/basicctl                         ${TempDir}/basic/bin
	${CP} ${SrcBinPath}/bin/appctl                           ${TempDir}/basic/bin
	
	${CP} ${SrcBinPath}/bin64/*_test                           ${TempDir}/basic/bin64
	${CP} ${SrcBinPath}/bin64/app                              ${TempDir}/basic/bin64
	${CP} ${SrcBinPath}/bin64/basicctl                         ${TempDir}/basic/bin64
	${CP} ${SrcBinPath}/bin64/appctl                           ${TempDir}/basic/bin64
	
	

# cp sl to so

	if [ "${OSName}" = "SunOS" ] ; then
		${CP} /usr/local/lib/libstdc++.so.5                ${TempDir}/basic/lib
		${CP} /usr/local/lib/sparcv9/libstdc++.so.5        ${TempDir}/basic/lib64
	elif [ "${OSName}" = "Linux" ] ; then
		${CP} /usr/lib/libstdc++.so.6                      ${TempDir}/basic/lib
		${CP} /usr/lib64/libstdc++.so.6                    ${TempDir}/basic/lib64
	fi

#creat tar package
	echo create tar package...
	${CD}    ${TempDir}
	${TAR}   ${TempDir}/basic.pkg ./basic
	${RM}    ./basic/*
	${MKDIR} ./${PkgName}
	${MV}    ./basic.pkg ./${PkgName}/

	${CP} ${PathBase}/build/script/install.sh        ${TempDir}/${PkgName}/install
	${CP} ${PathBase}/build/script/readme.sh         ${TempDir}/${PkgName}/readme
	
	${TAR}   ${PathBase}/Basic_pkg/${PkgName}.tar ./${PkgName}
	${GZIP}  ${PathBase}/Basic_pkg/${PkgName}.tar
	${RM}    ${PathBase}/Basic_pkg/${PkgName}.tar
	
	${RM}    ${TempDir}
	

echo create finish............................
