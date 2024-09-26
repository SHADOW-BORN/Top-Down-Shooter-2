extends Control

@onready var button = $Button
@onready var label = $Label



func _ready():
	label.text = label.text + str(Gamemanager.score)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://title_screen.tscn")
