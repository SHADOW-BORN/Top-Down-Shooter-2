extends CharacterBody2D


const SPEED = 50
const JUMP_VELOCITY = -400.0
@onready var sprite = $Sprite
@onready var player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	var direction_to_player=global_position.direction_to(player.position)
	velocity = direction_to_player * SPEED
	look_at(player.position)
	
	
	
	
	move_and_slide()
