- Redis is stored as key-value pairs. Value can also be field-value
- No duplicate elements
- Elements stored in Hash data structure


`FLUSHALL`{{execute}}

## HMSET
```
Store a hashmap again a key
Syntax: HMSET key field value ...
```
`HMSET marks Language1 92 Maths 88 Physics 91 Chemistry 78 Biology 81`{{execute}}

## HGETALL 
```
Get all fields from hash
Syntax: HGETALL key
```
`HGETALL marks`{{execute}}


## HGET 
```
Get value of given field from hash.
Syntax: HGET key field
```
`HGET marks Physics`{{execute}}


## HEXISTS 
```
Check if a field exist.
Syntax: HEXISTS key field
```
`HEXISTS marks Physics`{{execute}}

## HDEL  
```
Delete a field from hash

Syntax: HDEL key field
```
`HDEL marks Physics`{{execute}}

 
## HSETNX  
```
Insert a field if the key already not present else do nothing

Syntax: HSETNX key field value
```
`HSETNX marks Physics 99`{{execute}}

`HGET marks Physics`{{execute}}

`HSETNX marks Physics 95`{{execute}}

`HGET marks Physics`{{execute}}
