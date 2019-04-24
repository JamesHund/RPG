extends CanvasLayer

var active_screen

func _ready():
	pass
func _process(delta): #handles input
	if Input.is_action_just_pressed("ui_inventory"):
		if active_screen != $InventoryScreen:
			if active_screen != null:
				active_screen.hide()
			active_screen = $InventoryScreen
			active_screen.show()
		else:
			active_screen.hide()
			active_screen = null
	if Input.is_action_just_pressed("ui_cancel"):
		if active_screen != null:
			active_screen.hide()
			active_screen=null
		else:
			active_screen = $PauseMenu
			active_screen.show()
	if Input.is_action_just_pressed("ui_dev_tools"):
		if $DevTools.is_visible():
			$DevTools.hide()
		else:
			$DevTools.show()
			
func _on_PauseMenu_resume():
	active_screen.hide()
	active_screen = null
	


