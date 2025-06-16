#!/bin/bash

rm -rf *.class *.java~ MeuParser.java sym.java MeuScanner.java jcup.jar jflex.jar

wget https://repo1.maven.org/maven2/de/jflex/jflex/1.8.2/jflex-1.8.2.jar -O jflex.jar
wget https://repo1.maven.org/maven2/com/github/vbmacher/java-cup/11b-20160615/java-cup-11b-20160615.jar -O jcup.jar

java -cp jflex.jar:jcup.jar jflex.Main exemplo.flex
java -cp jcup.jar java_cup.Main -parser MeuParser exemplo.cup
javac -cp jcup.jar *.java
java -cp .:jcup.jar MeuParser entrada.txt