def challenge3(object, key):
    x = object
    
    for key in key.split('/'):
      if isinstance(x, dict):
        x = x[key]
        continue
    return x

#Test Results  
print(challenge3({"x":{"y":{"z":"a"}}}, 'x/y/z' )) #Answer=a
print(challenge3({"a":{"b":{"c":"d"}}}, 'a/b/c' )) #Answer=d
print(challenge3({"1":{"2":{"3":"4"}}}, '1/2/3' )) #Answer=4