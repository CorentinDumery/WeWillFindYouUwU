extends KinematicBody2D

var player = null
var move = Vector2.ZERO
var speed = 2

var time = 0

onready var light = get_node("../Player/Halo")



onready var sprite = $Sprite
onready var animation_player = $HungrySprite


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
	
	# We flip the Sprite depending on which way the enemy is moving.
	if move.x > 1 or move.x < -1: 
		pass
		#$AnimatedSprite.scale.x = -1 if move.x > 0 else 1
	
	self.scale.x *= 1 + sin(time/20)/600
	self.scale.y *= 1 + sin(time/20)/600
	time += 1
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
		#$AnimatedSprite.play()


func _on_Area2D_body_exited(body):
	if body != self:
		player = null
