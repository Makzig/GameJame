extends CharacterBody2D


var _direction:float = 0.5


func _on_area_2d_body_entered(body):
	
	if body.name != "Player":
		return
	velocity = body.velocity * _direction


func _physics_process(delta:float):
	move_and_slide()


func _on_area_2d_body_exited(body):
	if !body.is_in_group("Player"):
		return
	velocity = Vector2.ZERO
