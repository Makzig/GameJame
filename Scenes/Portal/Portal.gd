extends Area2D

@export var scene_path:String




func _ready() -> void:
	self.body_entered.connect(_on_player_entered)

func _anim_change_scene(target:Player) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(target, "position", self.position, 0.3)
	tween.tween_property(target, "rotation_degrees", 180, 2)
	tween.parallel().tween_property(target, "scale", Vector2.ZERO, 1)
	if scene_path != "":
		await tween.finished
		get_tree().change_scene_to_file(scene_path)

func _on_player_entered(body) -> void:
	if body.is_in_group("Player"):
		_anim_change_scene(body)
