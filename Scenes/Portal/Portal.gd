extends Area2D

@export var scene_path:String
var time:float
var player:Player

func _ready() -> void:
	self.body_entered.connect(_on_player_entered)
	set_physics_process(false)

func _anim_change_scene(target:Player) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	player = target
	set_physics_process(true)
	target.get_node("StateMachine").change_to("Wait")
	tween.tween_property(target, "rotation_degrees", 180, 3)
	tween.parallel().tween_property(target, "scale", Vector2.ZERO, 3)
	if scene_path != "":
		await tween.finished
		get_tree().change_scene_to_file(scene_path)

func _physics_process(delta):
	if time < 1:
		time += delta/5
		player.position = player.position.lerp(self.position, time)

func _on_player_entered(body) -> void:
	if body.is_in_group("Player"):
		_anim_change_scene(body)
