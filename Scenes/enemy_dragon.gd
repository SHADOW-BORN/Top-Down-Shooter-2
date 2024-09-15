extends CharacterBody2D


const SPEED = 80
const JUMP_VELOCITY = -400.0
@onready var sprite = $Sprite
@onready var player = get_tree().get_first_node_in_group("Player")
@export var health = 10



func _physics_process(delta):
	var direction_to_player=global_position.direction_to(player.position)
	velocity = direction_to_player * SPEED
	look_at(player.position)
	
	
	move_and_slide()






func _on_hurt_box_area_entered(area):
	if area.is_in_group("Bullet"):
		queue_free()




func _on_hurt_box_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
