extends Area2D
@export var SPEED = 500

func _ready():
	pass

func _process(delta):
	translate(Vector2.RIGHT.rotated(rotation) * SPEED * delta)



func _on_body_entered(body):
	if body.is_in_group("walls"):
		queue_free()
	if body.is_in_group("Dragon"):
		queue_free()
