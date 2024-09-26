extends CharacterBody2D


const SPEED = 100
@onready var sprite = $Sprite
@onready var player = get_tree().get_first_node_in_group("Player")
@export var health = 10


#This code makes it so the enemies always move towards the player.
#In line 13 it makes it so the dragon is always moving in the direction of the player
func _physics_process(delta):
	var direction_to_player=global_position.direction_to(player.position)
	velocity = direction_to_player * SPEED
	look_at(player.position)
	
	
	move_and_slide()





#This code is about the enemy dying and adding score to the player
#In line 28 when the bullet collides with the enemies hurtbox it adds one score to the game manager
func _on_hurt_box_area_entered(area):
	if area.is_in_group("Bullet"):
		Gamemanager.score += 1
		queue_free()



#This code is about making the player die
#In line 37 when the dragon eneters the players hitbox it sends the player to the death screen scene.
func _on_hurt_box_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
