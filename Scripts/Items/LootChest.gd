extends Node2D

signal dropitem(items,pos)

onready var open = false
onready var items = []
const interact_message = "Open Container"
const interact_gui_offset = Vector2(-30, 50)

#called on entering SceneTree and calls _generate_items()
func _ready():
	_generate_items()

#opens the loot chest and emits signal "dropitem" with items and position as parameters
func _interact():
	if !open:
		open = true
		remove_from_group("interactable")
		$Sprite.set_frame(1)
		emit_signal("dropitem",items,position)

#generates an array of items randomly using the chance values in ItemData.loot_table which are appended to 'items'
func _generate_items():
	for entry in ItemData.loot_table:
		randomize()
		if rand_range(0,100) < entry.get("chance"):
			var stacksize = 1
			var stack_range = entry.get("range")
			if  stack_range != null:
				stacksize = round(rand_range(stack_range[0],stack_range[1]))
			items.append(ItemUtils._create_item(entry.get("id"),stacksize))

	
