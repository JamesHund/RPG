extends KinematicBody2D

export(int) var id
onready var merchant = false
var npc_name
var inventory
var processintervals
var velocity

func _ready():
	if id > NPCdata.npc_list.size():
		printerr("NPC ID out of range")
		return
	npc_name = NPCdata.npc_list[id].get("name")
	if NPCdata.npc_list[id].get("merchant") != null:
		merchant = true
		inventory  = NPCdata.npc_list[id].get("merchant")
	$Sprites.animation = str(id)
	

func _process(delta):
	pass
	
func _exit_tree():
	print("NPC " + npc_name + " has been deleted")
	
	