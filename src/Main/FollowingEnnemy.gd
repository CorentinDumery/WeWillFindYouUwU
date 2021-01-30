extends KinematicBody2D

var player = null
var move = Vector2.ZERO
var speed = 2

onready var light = get_node("../Player/Halo")

func _physics_process(delta):
	move = Vector2.ZERO

	var dist = sqrt(pow(self.get_local_mouse_position()[0], 2) 
				  + pow(self.get_local_mouse_position()[1], 2))
	if dist < 50:
		speed = 0
	else:
		speed = 2
	
	if player != null:
		move = position.direction_to(player.position)
	else:
		move = Vector2.ZERO
		
	move = move.normalized()
	move = move * speed
	move = move_and_collide(move)
	var collision_info  = move_and_collide(move)
	if collision_info:
		print(collision_info)
		#get_tree().paused = true
		get_tree().reload_current_scene()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body != self:
		player = body


func _on_Area2D_body_exited(body):
	if body != self:
		player = null
