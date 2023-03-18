extends State


var acceleration:float = 250.0
var velocity:Vector2 = Vector2.ZERO
var friction:float = 150.0
var max_speed:float = 1500.0
var last_input:Vector2


func physics_update(_delta:float) -> void:
	movement()



func movement() -> void:
	var input_vector:Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	var delta_time:float = get_physics_process_delta_time()
	
	if input_vector != Vector2.ZERO:
		owner.velocity += input_vector * delta_time * acceleration
		owner.velocity = owner.velocity.limit_length(input_vector.length() * delta_time * max_speed)
		last_input = input_vector
		#if anim_playback.get_current_node() != "Walk":
			#anim_playback.travel("Walk")
		#set_blend_position("Walk", last_input)
	else:
		#if anim_playback.get_current_node() != "Idle":
			#anim_playback.travel("Idle")
	#	set_blend_position("Idle", last_input)
		owner.velocity = owner.velocity.move_toward(Vector2.ZERO, delta_time * friction)
	owner.move_and_slide()

