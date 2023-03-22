extends ColorRect


@export var to_ready:bool = true

func color_transition(forward:bool = false) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	if forward:
		self.color.a = 1
		tween.tween_property(self, "color:a", 0, 2)
	else:
		self.color.a = 0
		tween.tween_property(self, "color:a", 1, 2)
		await tween.finished
		EventBus.change_finished.emit()

func _ready() -> void:
	EventBus.change_scene.connect(_on_change_scene)
	if to_ready:
		await get_tree().create_timer(0.5).timeout
		color_transition(true)

func _on_change_scene() -> void:
	color_transition()
