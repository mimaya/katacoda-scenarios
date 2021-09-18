- Redis is stored as key-value pairs. Value can also be field-value
- No duplicate elements
- Elements stored in Hash data structure


`FLUSHALL`{{execute}}

## HMSET
```
Store a hashmap again a key
Syntax: HMSET key field value ...
```
`HMSET marks Language1 92 Maths 88 Physics 91 Chemistry 78 Biology`{{execute}}

## HGETALL 
```
Get all fields stoed against a key
Syntax: HGETALL key
```
`HGETALL marks`{{execute}}


## HGET 
```
Get value of give field store against a key.
Syntax: HGET key field
```
`HGET marks 80 95`{{execute}}

