extends Area2D
class_name FloorButton

signal pressed 
signal realeased

func _ready() -> void:
	body_entered.connect(_on_entered)
	body_exited.connect(_on_exited)



func _on_entered(body) -> void:
	if body.is_in_gorup("Player") or body.is_in_gorup("Object"):
		$Sprite2D.play("Pressed")
		pressed.emit()

func _on_exited(body) -> void:
	if body.is_in_gorup("Player") or body.is_in_gorup("Object"):
		$Sprite2D.play("Idle")
		realeased.emit()
		

