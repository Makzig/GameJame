extends Node2D


var buttons:Array 
var portal:PackedScene = preload("res://Scenes/Portal/portal.tscn")

func _ready() -> void:
	for button in $Buttons.get_children():
		button.pressed.connect(_on_pressed)

func add_button() -> void:
	for i in $Buttons.get_children().size():
		if $Buttons.get_child(i).pressed:
			buttons[i] = $Node.get_child(i)


func _on_pressed() -> void:
	add_button()
#	if buttons.any()


func add_portal() -> void:
	var por = portal.instantiate()
	add_child(por)
	por.position = $Marker2D.position
