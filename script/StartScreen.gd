extends Control

func _ready():
	pass

func _on_TextureButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Main.tscn")

func _exit_game():
	get_tree().quit()
