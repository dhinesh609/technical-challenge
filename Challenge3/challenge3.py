def challenge3(object, key):
    value = object
    default=None
    raising=False
    
    try:
        for key in key.split('/'):
            if isinstance(value, dict):
                value = value[key]
                continue
            else:
                if raising:
                    raise KeyError
                return default
    except KeyError:
        if raising:
            raise
        return default
    else:
        return value

#Test Results  
print(challenge3({"x":{"y":{"z":"a"}}}, 'x/y/z' )) #Answer=a
print(challenge3({"a":{"b":{"c":"d"}}}, 'a/b/c' )) #Answer=d
print(challenge3({"1":{"2":{"3":"4"}}}, '1/2/3' )) #Answer=4