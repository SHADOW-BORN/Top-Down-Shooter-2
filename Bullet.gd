extends Area2D
@export var SPEED = 500

#This code is for the direction the bullet fires
func _process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * SPEED * delta)


# This code is for when the bullets collide with a wall, in line 12 the code means that the bullet will end if it collides with a wall
func _on_body_entered(body):
	if body.is_in_group("walls"):
		queue_free()
