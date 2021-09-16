- Elements are stored and retrieved in ordered
- No duplicate elements
- Each element should be assigned a score before it is inserted into a sorted set


`FLUSHALL`{{execute}}

## ZADD
```
Add a element to set
Syntax: ZADD key score value ...
```
`ZADD marks 80 Language1 92 Maths 88 Physics 91 Chemistry 78 Biology`{{execute}}

## ZRANGE
```
Get elements from start and end position. 
Syntax: ZRANGE key start end ...
```
`ZRANGE marks 1 3`{{execute}}

Get all elements 
`ZRANGE marks 0 -1`{{execute}}


## ZRANGEBYSCORE
```
Get elements from with score in the given range. 
Syntax: ZRANGEBYSCORE key start end ...
```
`ZRANGEBYSCORE marks 80 95`{{execute}}





## ZCARD 
```
find the count of members present in a set

Syntax: ZCARD key
```
`SCARD marks `{{execute}}


## ZCOUNT 
```
find the count of members with in the given scores

Syntax: ZCOUNT key minScore maxScore
```
`ZCOUNT marks 80 95`{{execute}}

