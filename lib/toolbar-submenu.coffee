ToolbarSubmenuView = require './toolbar-submenu-view'
{CompositeDisposable} = require 'atom'

module.exports = ToolbarSubmenu =
  config:
    button:
      type: 'string'
      default: "Split Window"
    width:
      type: 'string'
      default: "120px"
    backgroundColor:
      type: 'color'
      default: "red"

  toolbarSubmenuView: null
  modalPanel: null
  subscriptions: null
  # will need to make this an array
  button: null

  activate: (state) ->
    button_name = atom.config.get("toolbar-submenu.button")
    sel = 'button[data-original-title="'+button_name+'"]'
    console.log(sel)
    @button = document.querySelector(sel)
    console.log "button:#{@button}"
    smconfig =
      button:@button
      width:atom.config.get("toolbar-submenu.width")
      backgroundColor: atom.config.get("toolbar-submenu.backgroundColor")
    @toolbarSubmenuView = new ToolbarSubmenuView(smconfig)
    #@modalPanel = atom.workspace.addBottomPanel(item:@toolbarSubmenuView.getElement(), visible:false)
    document.querySelector('body').appendChild(@toolbarSubmenuView.getElement())

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'toolbar-submenu:toggle':  => @toggle()

  deactivate: ->
    console.log("deactivate")
    @subscriptions.dispose()
    @toolbarSubmenuView.destroy()

  serialize: ->
    console.log "serialize"
    toolbarSubmenuViewState: @toolbarSubmenuView.serialize()

  toggle: () ->
    ###
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      console.log "show"
      console.log @toolbarSubmenuView
      @modalPanel.show()
    ###
    if @toolbarSubmenuView.isVisible()
      console.log "hiding"
      @toolbarSubmenuView.hide()
    else
      console.log "showing"
      @toolbarSubmenuView.show()
