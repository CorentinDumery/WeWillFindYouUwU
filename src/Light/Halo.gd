class_name Halo
extends Light2D

var boolean = true
var MAX_PULSAR = 0.1
var FREQ_PULSAR = 0.2

"""
var screen_centre
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_centre = get_viewport().get_visible_rect().size / 2

# move the halo to keep track of the mouse cursor.
# doesn't work tho.
func _input(event):
	if event is InputEventMouseMotion:
		offset = (event.position - screen_centre) * 0.4
"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# light
	if energy > 1.3 + MAX_PULSAR:
		boolean = false
	elif energy < 1.3 - MAX_PULSAR:
		boolean = true
	
	var e = FREQ_PULSAR*delta*(max(0.25 ,0.5 - abs(energy - 1.0))+ 0.01 )

	if boolean:
		energy += e
	else:
		energy -= e
	
	
