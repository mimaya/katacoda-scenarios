- The Redis  internally stores List as a linked list
- It has both HEAD and TAIL
- New element can be added either at HEAD or TAIL

## LPUSH - Left Push
```
Add value to the leftside (HEAD) of the list 
Syntax: LPUSH key value 
```
`LPUSH fruits apple orange`{{execute}}

`LPUSH fruits grapes`{{execute}}


## RPUSH - Right Push
```
Add value to the rightside (TAIL) of the list 
Syntax: RPUSH key value 
```
`RPUSH fruits bannana`{{execute}}

## LPOP - Left POP
```
Remove value from leftside (HEAD) of the list and return
Syntax: LPOP key 
```
`RPOP fruits`{{execute}}


## RPOP - Right POP
```
remove value from rightside (TAIL) of the list and return
Syntax: RPOP key 
```
`RPOP fruits`{{execute}}


## LRANGE 
```
Get list of elements from a given list from given start and end position
Syntax: LRANGE key start end 
```
`LRANGE fruits 1, 3`{{execute}}

Get all elements

`LRANGE fruits 0, -1`{{execute}}