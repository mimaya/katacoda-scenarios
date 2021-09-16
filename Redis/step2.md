
- Redis is keyvalue database
- Holds its database entirely in the memory also using the disk only for persistence.
- Supports complex data types
- All Redis operations are atomic. 
 
## Redis DataTypes
- String
- List
- Set
- Sorted set
- Hash

## Strings
- String are binary safe. No special end of string char. 
- Sequence of bytes with known length. 
- Any data can be stored in String. EG: JPEG image, serialized object, etc
- Redis backed **Bloom Filter** can be created using GETBIT and SETBIT
 

# SET/GET

 ```
 Assign a value to a key. If key already exist then it overwrites it
 Syntax: SET key value [EX sec | PX millisec]
```
`SET mykey "Hello" `{{execute}}


``` 
Get value for a given key
Syntax: GET key
```
`GET mykey`{{execute}}


```
Append a string to existing string
```
`APPEND mykey " World!!"`{{execute}}

```
Get append value again
```
`GET mykey`{{execute}}

```
Delete a key
```
`DEL mykey`{{execute}}



# SETEX

```
set a string with expireTime in seconds
Syntax: SETEX  <key> <expireTime> <value>
same as
Syntax: SET <key> <value>  EX <expireTimeSec>
```
`SETEX  exKey 10 "Hello"`{{execute}}

If you get value with in 10 sec then you will see value else nil

`GET exKey`{{execute}}`{{execute}}


# PSETEX

```
set a string with expireTime in millisec
Syntax: PSETEX  <key> <expireTime> <value>
same as
Syntax: SET <key> <value>  PX expireTimeMilliSec>
```

`PSETEX  pxKey 10000 "Hello"`{{execute}}

If you get value with in 10 sec then you will see value else nil

`GET pxKey`{{execute}}`{{execute}}

# SETNX

```
set if only the key is not already present
Syntax: SETNX <key> <value>
Value will be set by SETNX as the key not exist
```
`SETNX  nxKey "Value1"`{{execute}}

`GET  nxKey`{{execute}}

Value will not be changed by SETNX

`SETNX  nxKey "Value2"`{{execute}}

`GET  nxKey`{{execute}}

