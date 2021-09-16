- Elements are un-ordered
- No duplicate elements
- Redis internally uses a hash table to store the elements as a Set.


`FLUSHALL`{{execute}}

## SADD
```
Add a element to set
Syntax: SADD key value-1 .. valuen
```
`SADD fruits apple orange grapes bannana`{{execute}}

Get all members
`SMEMBERS fruits`{{execute}}


## SISMEMBER
```
Check if a element present in a set (return 1 or 0)
Syntax: SISMEMBER key value
```
`SISMEMBER fruits apple`{{execute}}


## SCARD 
```
find the count of members present in a set

Syntax: SCARD key
```
`SCARD fruits `{{execute}}

## SDIFF 
```
find elements present in Set1 that are not there in Set2 (S1 - S2)

Syntax: SDIFF set1 set2
```

`SADD fruits1 mango papaya apple`{{execute}}

`SDIFF fruits fruits1`{{execute}}

`SDIFF fruits1 fruits`{{execute}}