############################################################
blockingTimeMS = 10000

############################################################
blocked = {}

############################################################
export setBlockingTimeMS = (timeMS) -> blockingTimeMS = timeMS

############################################################
export blockOrThrow = (key) ->
    if typeof key != "string" then throw new Error("Key was no string!")
    
    if blocked[key] then throw new Error("Key #{key} is blocked!")

    blocked[key] = true
    
    unblock = ->
        delete blocked[key] 
        return

    setTimeout(unblock, blockingTimeMS)
    return

