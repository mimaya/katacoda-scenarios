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


## SUNION  
```
Union two or more sets and return the merged values. Doesn't store it in set

Syntax: SUNION set1 set2 ..
```

`SUNION fruits fruits1`{{execute}}

`SMEMBERS fruits`{{execute}}

`SMEMBERS fruits1`{{execute}}


## SUNIONSTORE   
```
Union two or more sets and store the merged values to given set

Syntax: SUNIONSTORE destset set1 set2 ..
```

`SUNIONSTORE allfruits fruits fruits1`{{execute}}

`SMEMBERS allfruits`{{execute}}


## SREM  
```
Remove one or more elements from a set

Syntax: SREM key value1 value2 ..
```

`SREM fruits apple`{{execute}}

`SMEMBERS fruits`{{execute}}


## SPOP  
```
Remove a random element from a set

Syntax: SPOP key
```

`SPOP fruits`{{execute}}

`SMEMBERS fruits`{{execute}}


## SMOVE  
```
Move a element from one set to another

Syntax: SMOVE sourceSet destSet value 
```
`SADD vegitables tomatto beans`{{execute}}

`SMOVE vegitables fruits tomatto`{{execute}}

`SMEMBERS fruits`{{execute}}


## SSCAN  
```
Scan list of elements matching a pattern

Syntax: SSCAN key MATCH pattern count
```
`SADD fruits strawberries raspberries blueberries `{{execute}}

`SSCAN fruits MATCH ".*berries" 2`{{execute}}

