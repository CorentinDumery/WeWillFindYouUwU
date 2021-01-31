extends Control

onready var _music = $MenuMusic

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode != KEY_ENTER:
			get_node("../../Level1").play_music()
			get_node("..").remove_child(self)

func _ready():
	visible = true
	_music.play()


func close():
	visible = false


func open():
	visible = true
