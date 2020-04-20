# Oracle JDK Installation

1. Check if Oracle JDK is installed

        java -version

2. Copy JDK to /opt and Unzip it

        cd /opt
        tar xzf ./jdk*.tar.gz

3. Change directory into it and select option 2

        cd /opt/jdk1.*
        alternatives –install /usr/bin/java java /opt/jdk1.*/bin/java 2
        alternatives –config java

4. Update alternatives for JAR & JAVAC

        alternatives –install /usr/bin/jar jar /opt/jdk1.*/bin/jar 2
        alternatives –install /usr/bin/javac javac /opt/jdk1.*/bin/javac 2

5. Set alternatives for the same

        alternatives –set jar /opt/jdk1.*/bin/jar
        alternatives –set javac /opt/jdk1.*/bin/javac

6. Check if properly installed

        java -version
        javac -version