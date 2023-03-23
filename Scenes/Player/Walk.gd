extends State


var acceleration:float = 750.0
var velocity:Vector2 = Vector2.ZERO
var friction:float = 600.0
var max_speed:float = 3500.0
var last_input:Vector2
var is_picked:bool = false

var player:Player
var target


func enter_state(_need:Dictionary = {}) -> void:
	player = owner as Player
	player.get_node("HurtBox2D").hurt.connect(_on_hurt)
	player.get_node("DetectRay").body_entered.connect(_on_entered)
	player.get_node("DetectRay").body_exited.connect(_on_exited)

func exit_state() -> void:
	player.get_node("HurtBox2D").hurt.disconnect(_on_hurt)
	player.get_node("DetectRay").body_entered.disconnect(_on_entered)
	player.get_node("DetectRay").body_exited.disconnect(_on_exited)



func physics_update(_delta:float) -> void:
	movement()

func handless_input(_event:InputEvent) -> void:
	if Input.is_action_just_pressed("picked") and target:
		
		state_machine.change_to("PickAndThrow", {_target = target, picked = is_picked})
		is_picked = true

func movement() -> void:
	var input_vector:Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	var delta_time:float = get_physics_process_delta_time()
	
	if input_vector != Vector2.ZERO:
		owner.velocity += input_vector * delta_time * acceleration
		owner.velocity = owner.velocity.limit_length(input_vector.length() * delta_time * max_speed)
		last_input = input_vector
		owner.last_input = last_input
		player.get_node("DetectRay/CollisionShape2D").rotation = input_vector.angle() - PI/2
		if !is_picked:
			if player.anim_playback.get_current_node() != "Walk":
				player.anim_playback.travel("Walk")
			player.set_blend_position("Walk", input_vector)
	else:
		owner.velocity = owner.velocity.move_toward(Vector2.ZERO, delta_time * friction)
		if !is_picked:
			if player.anim_playback.get_current_node() != "Idle":
				player.anim_playback.travel("Idle")
			player.set_blend_position("Idle", last_input)
	owner.move_and_slide()


func _on_entered(body) -> void:
	if body.is_in_group("PlayableObject"):
		target = body

func _on_hurt(_hitbox:HitBox2D) -> void:
	state_machine.change_to("Dead")

func _on_exited(body) -> void:
	if body.is_in_group("PlayableObject"):
		target = null
