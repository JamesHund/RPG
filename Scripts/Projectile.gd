extends Area2D

var direction
var source
var group
var damage
export (int) var SPEED
var speedtest

func _ready():
	pass
	
func _initialize(dir, src, dmg):
	position = src.position
	source = src
	damage = dmg
	if src.is_in_group("players"):
		group = "players"
	else:
		group = "enemies"
	direction = dir
	rotation = cartesian2polar(dir.x,dir.y).y
	$DecayTimer.start()
	speedtest = 0

func _process(delta):
	position += direction.normalized()*SPEED*delta

func _on_DecayTimer_timeout():
	hide()
	queue_free()

func _on_Projectile_body_entered( body ):
	if body.is_in_group("characters"):
		if !body.is_in_group(group):
			body.damage(damage)
			if body.is_in_group("enemies"):
				body._apply_impulse(direction.normalized()*SPEED)
			hide()
			queue_free()
	else:
		hide()
		queue_free()
