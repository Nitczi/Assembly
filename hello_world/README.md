# Objective
So, this is a simple 'hello world'(or 'hello friend'). in assembly. Different from other languages, in assembly we can understand more concepts and how a machine works. I'll explain each line and why we use each command and values, somethings i will not explain, like the sections.

# Explanation

The first thing we need to define for printing a message, is define which message we will print out. In assembly we need to:
1. Define a label;
2. Chose a directive to indicate how we will allocate the data;
3. Set the value we want to print out.

In our code, the label is `message`. The directive is `db`: **db** means: "Each character is equivalent to 1 byte", so the character 'H' in "Hello friend" is equivalent to 1 byte. There are other directives like: `dw`, `dq` and `dd` depending of which you use, each character will occuppy a different space in memory.
