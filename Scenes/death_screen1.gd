extends Control

@onready var button = $Button



func _on_button_pressed():
	get_tree().change_scene_to_file("res://title_screen.tscn")
