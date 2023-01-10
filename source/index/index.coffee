############################################################
blockingTimeMS = 10000

############################################################
blocked = {}

############################################################
export setBlockingTimeMS = (timeMS) -> 
    if typeof timeMS != "number" then throw new Error("TimeMS was no number!")
    blockingTimeMS = timeMS
    return

############################################################
export blockOrThrow = (key) ->
    if typeof key != "string" then throw new Error("Key was no string!")
    
    if blocked[key] then throw new Error("Key #{key} is blocked!")

    blocked[key] = true
    
    stop = ->
        delete blocked[key] 
        return

    setTimeout(stop, blockingTimeMS)
    return

############################################################
export isBlocked = (key) ->
    if typeof key != "string" then throw new Error("Key was no string!")
    
    if blocked[key] then return true
    return false

############################################################
export passOrThrow = (key) ->
    if typeof key != "string" then throw new Error("Key was no string!")

    if blocked[key] then throw new Error("Key #{key} is blocked!")
    return