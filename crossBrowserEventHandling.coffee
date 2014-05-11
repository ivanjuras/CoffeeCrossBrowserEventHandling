#-------------------------------------------------------------
# BEGIN HELPER FUNCTIONS
#-------------------------------------------------------------

eventUtility = 
    
    # add event function
    addEvent: (el, type, fn) ->
        unless addEventListener is 'undefined'
            el.addEventListener(type, fn, false)
        else if typeof attachEvent is not 'undefined'
            el.attachEvent("on" + type, fn)
        else
            el["on" + type] = fn
    ,
    # remove event function
    removeEvent: (el, type, fn) ->
        unless typeof removeEventListener is 'undefined'
            el.removeEventListener(type, fn, false)
        else if typeof detachEvent not 'undefined'
            el.detachEvent("on" + type, fn)
        else
            el["on" + type] = null
    ,
    # get targets
    getTarget: (event) ->
        unless event.target is 'undefined'
            event.target
        else
            event.srcElement
    ,
    # prevent defaults
    preventDefault: (event) ->
        unless event.preventDefault is 'undefined'
            event.preventDefault()
        else
            event.returnValue = false

#--------------------------------------------------------------
# END HELPER FUNCTIONS
#--------------------------------------------------------------