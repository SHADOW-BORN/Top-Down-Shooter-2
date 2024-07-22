extends CharacterBody2D


@export var SPEED = 100
@export var ACCELERATION = 20
@export var FRICTION = 10

func _physics_process(delta):
	look_at(get_global_mouse_position())
	#rotate(get_angle_to(get_global_mouse_position()))
	var direction = Input.get_vector("left","right", "up", "down").normalized()
	if direction :
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		
	move_and_slide()
	
