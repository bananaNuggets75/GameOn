extends Control


func _on_play_pressed():
	pass
	get_tree().change_scene_to_file("res://GameOn/object.tscn")

func _on_quit_pressed():
	get_tree().quit()
