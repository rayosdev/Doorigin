extends Control


export(NodePath) var score_label_node
var score_label

func _ready():
	print("Loading UI!")
	score_label = get_node(score_label_node)
	#var end_score = get_tree().get_root().get_meta("score")
	print("end score meta : " + " store score : " + str(Store.score))
	score_label.text = "Your Score :" + str(Store.score)

func _on_PlayAgain_pressed():
	Store.reset_state_for_next_game()
	get_tree().change_scene("res://Main.tscn")

func _on_ExitGame_pressed():
	get_tree().quit()
