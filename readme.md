Apache Pig with MapR
===========
Pig is a dataflow programming environment for processing very large files. Pig's
language is called Pig Latin. A Pig Latin program consists of a directed
acyclic graph where each node represents an operation that transforms data.
Operations are of two flavors: (1) relational-algebra style operations such as
join, filter, project; (2) functional-programming style operators such as map,
reduce.

Pig compiles these dataflow programs into (sequences of) map-reduce jobs and
executes them using Hadoop. It is also possible to execute Pig Latin programs
in a "local" mode (without Hadoop cluster), in which case all processing takes
place in a single local JVM.

General Info
===============

For the latest information about Pig, please visit our website at:

   http://pig.apache.org/

and our wiki, at:

   http://wiki.apache.org/pig/

Getting Started
===============
1. To learn about Pig, try http://wiki.apache.org/pig/PigTutorial
2. To build and run Pig:

```bash
$ mkdir pig-mapr
$ cd pig-mapr
$ git clone git://github.com/mapr/pig.git .
$ git checkout 0.10.0-mapr
$ ant jar-withouthadoop
```
To build tests you need to copy
 http://www.eli.sdsu.edu/java-SDSU/sdsuLibJKD12.jar.

```bash
$ cd pig-mapr/lib
$ wget http://www.eli.sdsu.edu/java-SDSU/sdsuLibJKD12.jar
# purge old junit classes from sdsuLibJKD12.jar
$ zip -d sdsuLibJKD12.jar  'junit/*'
$ cd ..
$ ant test
```

Also see http://wiki.apache.org/pig/BuildPig and
http://wiki.apache.org/pig/RunPig

3. To check out the function library, try http://wiki.apache.org/pig/PiggyBank

Using Pig artifacts with MapR patches in your Maven Project
=============================================================
Add the following dependency to your project's pom.xml

```xml
<dependency>
  <groupId>com.mapr.pig</groupId>
  <artifactId>pig</artifactId>
  <version>${mapr.pig.version}</version>
</dependency>
```


