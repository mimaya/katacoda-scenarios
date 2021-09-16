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

Get all elements

`LRANGE fruits 0 -1`{{execute}}

## RPUSH - Right Push
```
Add value to the rightside (TAIL) of the list 
Syntax: RPUSH key value 
```
`RPUSH fruits bannana`{{execute}}

Get all elements

`LRANGE fruits 0 -1`{{execute}}

## LPOP - Left POP
```
Remove value from leftside (HEAD) of the list and return
Syntax: LPOP key 
```
`LPOP fruits`{{execute}}

Get all elements

`LRANGE fruits 0 -1`{{execute}}

## RPOP - Right POP
```
remove value from rightside (TAIL) of the list and return
Syntax: RPOP key 
```
`RPOP fruits`{{execute}}

Get all elements

`LRANGE fruits 0 -1`{{execute}}

## LRANGE 
```
Get list of elements from a given list from given start and end position
Syntax: LRANGE key start end 
```
`LRANGE fruits 1 3`{{execute}}

Get all elements

`LRANGE fruits 0 -1`{{execute}}


## LLEN 
```
Get length of the list
Syntax: LLEN
```
`LLEN fruits`{{execute}}


## LINDEX 
```
Get element at given index
Syntax: LINDEX key index
```
`LINDEX fruits 2`{{execute}}


## LSET 
```
Update the value at given index
Syntax: LSET key index value
```
`LSET fruits 2 "mango"`{{execute}}

`LGET fruits 2"`{{execute}}


## LPUSHX 
```
Add element to the head of the list only if the list already exist 
```
`LPUSHX vegitables "carrot"`{{execute}}

`LRANGE vegitables 0 -1"`{{execute}}


## LINSERT  
```
Insert a element before or after a particular value
```
`LPUSH numbers 1 2 3 4 7 4`{{execute}}

`LINSERT numbers after 4 5 "`{{execute}}

`LRANGE vegitables 0 -1"`{{execute}}