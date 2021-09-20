
<b>Setup</b>

* setup Redis server
---

## Setup redis server using docker image

Run redis docker image
`docker run -p 6379:6379 --name redis-server -d redis`{{execute}}

```
Note : Can run redisbloom that support bloom plugin
docker run -p 6379:6379 --name redis-server -d redislabs/rebloom:latest
```

Run redis cli
`docker exec -it redis-server bash`{{execute}}

`redis-cli`{{execute}}

Test
`ping`{{execute}}

---
## Setup redis server 

`sudo apt-get update`{{execute}}`

Install redis server
`sudo apt-get --assume-yes install redis-server`{{execute}}

Start Redis server
`redis-server`{{execute}}

Run redis cli
`redis-cli`{{execute}}`

Test
`ping`{{execute}}