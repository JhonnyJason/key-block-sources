# key-block 

# Background
Originally this was built to anihilate replay attacks, by blocking the signatures of packages until the timestamp made it invalid.
Then it seemed to make sense to make a generalized package out of it.

Even though the benefit is just 10 lines of code to be condensed to 2. Probably worth it ;-)

# Usage

Requirements
------------
- ESM importability

Installation
------------
Current git version:
```
npm install git+https://github.com/JhonnyJason/key-block-output.git
```

Npm Registry
```
npm install key-block
```

Use
-----------
The main idea is to have a string key to be blocked for a certain amount of time.
Thus we have the `blockOrThrow` function. 

- The first time `blockOrThrow` will set the key as `blocked`
- For any further time when being called within the `blockingTime` `blockOrThrow` would throw an Error 
- After the `blockingTime` has passed the key is automatically unblocked - ready to be blocked again :-)

```coffee
import { setBlockingTimeMS, blockOrThrow, passOrThrow, isBlocked } from "key-block"

# setting the default  default is 10000ms
setBlockingTimeMS(300000)

isBlocked("hell") # false
passOrThrow("hell") # passes
blockOrThrow("hell") # all fine

isBlocked("hell") # true
passOrThrow("hell") # -> Error Exception "Key hell is blocked!"
blockOrThrow("hell") # -> Error Exception "Key hell is blocked!"

## after ~300000ms
isBlocked("hell") # false
passOrThrow("hell") # passes again
blockOrThrow("hell") # all fine again

```

---

# Further steps

- Waiting for ideas on improvement


All sorts of inputs are welcome, thanks!

---

# License
[Unlicense JhonnyJason style](https://hackmd.io/nCpLO3gxRlSmKVG3Zxy2hA?view)
