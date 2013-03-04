Apache Pig
===========
Pig is a dataflow programming environment for processing very large files. Pig's
language is called Pig Latin. A Pig Latin program consists of a directed
acyclic graph where each node represents an operation that transforms data.
There are two kinds of operations:  

* Relational-algebra style operations such as joins, filtering, or project  
* Functional-programming style operators such as map or reduce.  

Pig compiles these dataflow programs into sequences of MapReduce jobs and
executes them using Hadoop. You can also execute Pig Latin programs
in a local mode, without a Hadoop cluster, in which case all processing takes
place in a single local JVM. 

General Info
------------

For the latest information about Pig, please visit our [website](http://pig.apache.org/) or [wiki](http://wiki.apache.org/pig/).

Getting Started
---------------
1. To learn about Pig, try the [tutorial](http://wiki.apache.org/pig/PigTutorial).
2. To build and run Pig, try [Build Pig](http://wiki.apache.org/pig/BuildPig) and
[Run Pig](http://wiki.apache.org/pig/RunPig).
3. To check out the function library, try [PiggyBank](http://wiki.apache.org/pig/PiggyBank)


Contributing to the Project
---------------------------

We welcome all contributions. For the details, please, visit [How to Contribute](http://wiki.apache.org/pig/HowToContribute).
