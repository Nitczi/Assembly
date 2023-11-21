# Objective
So, this is a simple 'hello world'(or 'hello friend'). in assembly. Different from other languages, in assembly we can understand more concepts and how a machine works. I'll explain each line and why we use each command and values, somethings i will not explain, like the sections.

# Explanation

The first thing we need to define for printing a message, is define which message we will print out. In assembly we need to:
1. Define a label;
2. Chose a directive to indicate how we will allocate the data;
3. Set the value we want to print out.

In our code, the label is `message`. The directive is `db`: **db** means: "Each character is equivalent to 1 byte", so the character 'H' in "Hello friend" is equivalent to 1 byte. There are other directives like: `dw`, `dq` and `dd` depending of which you use, each character will occuppy a different space in memory. Keep in mind that when you'll define a label like that, normally it's used the **.data** section, I'll not get into this righ now.

OK! We already defined what we will print out, now we need just print out... and how can we do this?

Let's take python3 as an example, for *writing* something in screen we can do `print('Hello Friend!')` . The function `print()` utilizes a system function(syscall) called **write**, it receives some arguments to print what is inside the brackets. We can use this syscall to print our value. As it is a function, it will receive some arguments... but which. The [manual(man)](https://man7.org/linux/man-pages/man2/write.2.html) of write syscall says that it receives 3 arguments:
[Immage]

### First argument (`int fd`)
The first argument is a file descriptor(fd), basically this will indicate where we will write to, in our case it will be on screen(the standard output or just stdout). As it receives only integer values, the code for stdout is **0**.

### Second argument (`const void buf[.count]`)
This one, will indicate what we will print out. So it will be the `message` label, pretty simple.

### Third Argument (`size_t count`)
Very simple too, it will tell us how much bytes we will print out, counting how much characteres 'Hello friend!' has --> 13 but were passed other character: `0xA` indicating a break line, so we want to print 14 bytes.

Awesome! With this prepared, let's head back to assembly code. The line 4,5 and 6 are standards to any assembly code so I will not explain them. In order to use a function in assembly, it's necessary: 
1. Indicate what function we will use;
2. Tell the arguments;
3. Use the `syscall` directive to "activate" the syscall.

Let's dive into.

### 1. 'Indicate what function we will use'
In assembly, normally we indicate which syscall we will utilize passing the value inside the `rax` register. It's a convention, and need to be followed. The value of a syscall is a number, and **write** syscall has the number 1, so you just need to `mov rax, 1` reading this: move 1 to rax. Easy!

### 2. 'Tell the arguments'
Now the arguments, we already talk about them before. As convention too, the arguments of functions/syscall can be passed in some register: rdi, rsi, rdx, r10, r8 and r9. I used rdi, rsi and rdx to handle the arguments. There's no much secrete here, we passed in *rdi* the value of **1**(stdout) representing `int fd`; in *rsi* **message** representing `const void buf[.count]` and in *rdx* the value of **14** representing `size_t count`.

### 3. 'Use the `syscall` directive to "activate" the syscall'

That's it! We defined the code of function and its arguments, we just need to invoke `syscall` and the message *'Hello friend!'* will be printed!

### Extra
The 13, 14 and 15 is the `exit` syscall, so we can finish the execution without errors.

