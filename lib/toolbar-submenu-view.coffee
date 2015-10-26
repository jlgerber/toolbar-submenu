module.exports =
class ToolbarSubmenuView
  constructor: (state) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('toolbar-submenu')
    # state.width, state.name

    button = state.button#document.querySelector('button[data-original-title="#{state.name}"]')
    bbox = button.getBoundingClientRect()
    parent = button.parentElement
    outerwidth = parent.outerWidth or parent.getBoundingClientRect().width
    console.log "outerwidth #{outerwidth}"
    console.log "bbox"
    console.log bbox

    @element.style.position = "absolute"
    @element.style.visibility = "hidden"
    @element.style.top= "#{bbox.top}px"
    @element.style.height = "#{bbox.height}px"
    @element.style.left = "#{outerwidth}px"
    @element.style.backgroundColor= "red"#state.backgroundColor
    @element.style.zIndex=100
    @element.style.width = state.width

    console.log "element"
    console.log @element
    console.log "finished"

  # Returns an object that can be retrieved when package is activated
  serialize: ->
    return
  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  isVisible: ->
    return @element.style.visibility is "visible"

  show: ->
    @element.style.visibility = "visible"

  hide: ->
    @element.style.visibility = "hidden"
