extends CharacterBody2D
#Variables
@onready var world = get_node('/root/World')
@export var SPEED = 100
@export var ACCELERATION = 20
@export var FRICTION = 10
var direction_facing = Vector2.ZERO
const BULLET = preload("res://Bullet.tscn")

#Functions
func _physics_process(delta):
	look_at(get_global_mouse_position())
	#Movement
	var direction = Input.get_vector("left","right", "up", "down").normalized()
	if direction :
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		
	move_and_slide()
	
#Bullet Code
	if Input.is_action_just_pressed("shoot"):
		var bullet = BULLET.instantiate()
		var Direction = global_position.direction_to(get_global_mouse_position())
		bullet.rotate(Direction.angle())
		bullet.global_position = global_position
		world.add_child(bullet)
		
#func _on_area_entered(area):
	#print("Dragon collison")
	#if area.is_in_group("Dragon"):
		#get_tree().change_scene_to_file("res://title_screen.tscn")


func _on_collision_shape_2d_tree_entered(area):
	print("Dragon collison")
