call mvn -f pom.xml compile
call mvn -f pom.xml package
xcopy "D:\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\webapps\alphatech\target\ROOT.war" "D:\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\webapps\"
xcopy /y "D:\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\webapps\alphatech\target\ROOT" "D:\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\webapps\ROOT"
call D:\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\bin\shutdown.bat
call D:\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\bin\startup.bat
ECHO "Deploy done"