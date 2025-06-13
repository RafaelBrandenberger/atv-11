#!/bin/bash

rm -rf *.class *.java~ jcup.jar SQLParser.java sym.java jflex.jar SQLScanner.java

wget -q https://repo1.maven.org/maven2/de/jflex/jflex/1.8.2/jflex-1.8.2.jar -O jflex.jar
wget -q https://repo1.maven.org/maven2/com/github/vbmacher/java-cup/11b-20160615/java-cup-11b-20160615.jar -O jcup.jar

java -cp jflex.jar:jcup.jar jflex.Main exemplo.flex

java -cp jcup.jar java_cup.Main -parser SQLParser exemplo.cup

javac -cp jcup.jar *.java

java -cp .:jcup.jar SQLParser ./entrada.txt