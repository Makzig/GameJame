extends Node2D


func change_to_level() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/1_level.tscn")


func _ready() -> void:
	EventBus.change_finished.connect(_on_finished)


func _on_finished() -> void:
	change_to_level()
