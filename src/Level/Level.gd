extends Node2D

const LIMIT_LEFT = -10000
const LIMIT_TOP = -10000
const LIMIT_RIGHT = 10000
const LIMIT_BOTTOM = 10000

func _ready():
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM

func play_music():
	$Music.play()
