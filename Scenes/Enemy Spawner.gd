extends Node
@onready var spawn_timer = $"Spawn Timer"
@onready var spawn_locations = $"Spawn Locations".get_children()
@onready var world = get_node("/root/World")
const ENEMY_DRAGON = preload("res://Scenes/enemy_dragon.tscn")
func spawn_enemy():
	var enemy = ENEMY_DRAGON.instantiate()
	var spawn_locations = spawn_locations.pick_random()
	enemy.global_position = spawn_locations.global_position
	world.add_child(enemy)

func _on_spawn_timer_timeout():
	spawn_enemy()
