#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#*****************************************************************************
#
#   Gradle start up script for UN*X
#
#*****************************************************************************

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass any JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN*
    cygwin=true
    ;;
  Darwin*
    darwin=true
    ;;
  MINGW*
    msys=true
    ;;
  NONSTOP*
    nonstop=true
    ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if ${cygwin} ; then
    [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# Attempt to find JAVA_HOME if not already set.
if [ -z "$JAVA_HOME" ] ; then
    if ${darwin} ; then
        [ -z "$JAVA_HOME" ] && JAVA_HOME_CANDIDATES=$(/usr/libexec/java_home)
    fi

    if [ -z "$JAVA_HOME" ] ; then
        JAVA_HOME_CANDIDATES=$(which java)
        until [ -z "$JAVA_HOME_CANDIDATES" ] ; do
            if [ -z "$JAVA_HOME" ] ; then
                JAVA_HOME_CANDIDATE=$(readlink -f "$JAVA_HOME_CANDIDATES")
                if [ "x$JAVA_HOME_CANDIDATE" != "x" ] ; then
                    JAVA_HOME=$(dirname "$(dirname "$JAVA_HOME_CANDIDATE")")
                fi
            fi
            JAVA_HOME_CANDIDATES=$(which -a java | grep -v "$JAVA_HOME_CANDIDATES")
        done
    fi
fi

# If JAVA_HOME is not defined, die.
if [ -z "$JAVA_HOME" ] ; then
    die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Set on Windows only, suppress warnings about missing output device.
if ${cygwin} || ${msys} ; then
    GRADLE_BATCH_STDERR_REDIRECT=1
    export GRADLE_BATCH_STDERR_REDIRECT
fi

# Set on AIX in order to allow disclaimers to be displayed.
if [ `uname` = "AIX" ] ; then
    export IBM_NOSIGHUP=1
fi

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum number of open files, if necessary.
if ! ${cygwin} && ! ${darwin} && ! ${nonstop} ; then
    if [ "$MAX_FD" = "maximum" ] || [ "$MAX_FD" = "max" ] ; then
        # Use the system max unless the user has overridden it.
        MAX_FD=`ulimit -H -n`
    fi
    if [ -n "$MAX_FD" ] && [ "$MAX_FD" != "unlimited" ] ; then
        ulimit -n $MAX_FD
    fi
fi

# Add the jar to the classpath.
if [ -n "$GRADLE_WRAPPER_JAR" ] ; then
    # Allow for specifying the jar file, overriding the computed one.
    LOCAL_JAR="$GRADLE_WRAPPER_JAR"
else
    LOCAL_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
fi
if [ ! -f "$LOCAL_JAR" ] ; then
    die "ERROR: The gradle wrapper jar is missing: $LOCAL_JAR"
fi

# For Cygwin, switch paths to Windows format before running java
if ${cygwin} ; then
    APP_HOME=`cygpath --path --windows "$APP_HOME"`
    LOCAL_JAR=`cygpath --path --windows "$LOCAL_JAR"`
fi

# Split up the JVM options only if the variable is not quoted.
if [ -z "${JVM_OPTS_QUOTED}" ] ; then
    JVM_OPTS=($DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS)
fi

# Add the jar to the classpath.
CLASSPATH=$LOCAL_JAR

# Execute Gradle.
exec "$JAVACMD" "${JVM_OPTS[@]}" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
