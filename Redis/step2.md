
Redis is keyvalue database
Holds its database entirely in the memory also using the disk only for persistence.
Supports complex data types
All Redis operations are atomic. 
 
## Redis DataTypes
String
List
Set
Sorted set
Hash

## Strings
String are binary safe. No special end of string char. 
Sequence of bytes with known length. 
Any data can be stored in String. EG: JPEG image, serialized object, etc
Redis backed **Bloom Filter** can be created using GETBIT and SETBIT
 

