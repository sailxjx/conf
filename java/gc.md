Will openjdk release memory back to OS?

https://bugs.openjdk.java.net/browse/JDK-8078039

#### jstat

jstat -gcutil ${PID} 1 250

https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstat.html

# 堆内存与栈内存

栈： 函数与变量名，不可手动分配
堆： 对象实例，可手动分配
