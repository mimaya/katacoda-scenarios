
## Intro
- Redis is key-value database
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
 
# String Commands

Assign a value to a key. If key already exist then it overwrites it
Syntax: SET key value [EX sec | PX millisec]
`SET mykey "Hello" `{{execute}}

Get value for a given key
Syntax: GET key
`GET mykey`{{execute}}

Append a string to existing string
`APPEND mykey " World!!"`{{execute}}

Get append value again
`GET mykey`{{execute}}

Delete a key
`DEL mykey`{{execute}}


Assign a value to a key that will expire in 10 seconds.
`SET mykey "Expires in 10 sec"  EX 10`{{execute}}

same as 
SETEX <key> <expireTime> <value>
SETPX <key> <expireTime> <value>


If you get value with in 10 sec then you will see value else nil
`GET mykey`{{execute}}


