extends Area2D
class_name FloorButton

signal pressed 
signal realeased

var _is_pressed:bool = false

func _ready() -> void:
	body_entered.connect(_on_entered)
	body_exited.connect(_on_exited)



func _on_entered(body) -> void:
	if body.is_in_group("Player") or body.is_in_group("Object"):
		if !_is_pressed:
			_is_pressed = true
			$AnimationPlayer.play("Pressed")
			pressed.emit()
			

func _on_exited(body) -> void:
	if body.is_in_group("Player") or body.is_in_group("Object"):
		if _is_pressed:
			_is_pressed = false
			$AnimationPlayer.play("Idle")
			realeased.emit()
			
		

