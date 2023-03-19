extends State


var acceleration:float = 750.0
var velocity:Vector2 = Vector2.ZERO
var friction:float = 600.0
var max_speed:float = 3500.0
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
		owner.last_input = last_input
	else:
		owner.velocity = owner.velocity.move_toward(Vector2.ZERO, delta_time * friction)
	owner.move_and_slide()

