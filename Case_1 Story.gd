extends Node2D


func _ready():
	var new_dialog = Dialogic.start("intro_case1")
	add_child(new_dialog)
	$"Herman Cole".is_in_dialog = true
