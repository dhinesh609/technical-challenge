Challenge #3 Question: 

We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.
Example Inputs
object = {“a”:{“b”:{“c”:”d”}}}
key = a/b/c
object = {“x”:{“y”:{“z”:”a”}}}
key = x/y/z
value = a
Hints:
We would like to see some tests. A quick read to help you along the way
We would expect it in any other language apart from elixir.
A quick read to help you along the way 


Solution:

The challenge3.py file has a function which accepts two arguments (Object & key) as parameters.
The key would split with delimiter '/' and get the value from the Object provided as input. The output test results are also shared provided in the script file.

Output: 
Script execution provided the results as 

python3 challenge3.py
a
d
4


