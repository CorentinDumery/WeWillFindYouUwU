class_name Halo
extends Light2D

var boolean = true
var screen_centre

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_centre = get_viewport().get_visible_rect().size / 2

# move the halo to keep track of the mouse cursor.
# doesn't work tho.
func _input(event):
	if event is InputEventMouseMotion:
		offset = (event.position - screen_centre) * 0.4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# light
	if energy > 1.5:
		boolean = false
	elif energy < 0.5:
		boolean = true
	
	var e = 4*delta*(max(0.25 ,0.5 - abs(energy - 1.0))+ 0.01 )

	if boolean:
		energy += e
	else:
		energy -= e
	
	
