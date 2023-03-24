extends Node2D


var buttons:Array  = [null, null]
var portal:PackedScene = preload("res://Scenes/Portal/portal.tscn")

func _ready() -> void:
	for button in $Buttons.get_children():
		button.pressed.connect(_on_pressed)

func add_button() -> void:
	for i in $Buttons.get_children().size():
		if $Buttons.get_child(i)._is_pressed == true:
			buttons[i] = $Buttons.get_child(i)



func _on_pressed() -> void:
	add_button()
	add_portal()


func add_portal() -> void:
	if buttons.has(null):
		return
	var por = portal.instantiate()
	add_child(por)
	por.position = $Marker2D.position


