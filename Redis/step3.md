## Keys
```
List keys
Syntax: keys * 
```
`KEYS *`{{execute}}


## INCR
```
Increment value of a key by 1
Syntax: INCR <key> 
```
`SET counter 1`{{execute}}

`INCR counter`{{execute}}

`GET counter`{{execute}}


## INCRBY
```
Increment value of a key by given value
Syntax: INCR <key> <count>
```
`SET counter 1`{{execute}}

`INCRBY counter 100`{{execute}}

`GET counter`{{execute}}


## INCRBYFLOAT
```
Increment value of a key by given float value
Syntax: INCRBYFLOAT <key> <count>
```
`SET counter 1`{{execute}}

`INCRBY counter 0.25`{{execute}}

`GET counter`{{execute}}


## DECR / DECRBY / DECRBYFLOAT
```
Decrement value of a key by given by 1/n/float  value
Syntax: DECRBY <key> <count>
```
`SET counter 5`{{execute}}

`DECRBY counter 2`{{execute}}

`GET counter`{{execute}}


## DEL
```
Delete a key
Syntax: DEL <key>
```
`SET counter 5`{{execute}}

`DEL counter`{{execute}}

`GET counter`{{execute}}


## FLUSHALL
```
Delete all keys
Syntax: FLUSHALL
```
`MSET a 1 b 2 c 3`{{execute}}

`FLUSHALL`{{execute}}

`KEYS *`{{execute}}