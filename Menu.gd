extends Node2D

var utensil_notes = preload("res://Notes Case 1/Utensil Info.tscn")
var body_case_1_notes = preload("res://Notes Case 1/Body Notes.tscn")

var body_1_noted = false
var utensil_noted = false

func _ready():
	$"CanvasLayer/tabs+button/TabContainer".rect_size = get_viewport_rect().size

func _on_Button_pressed():
	Autoload.intro_ready = false
	$"CanvasLayer/tabs+button".visible = true
	$CanvasLayer/Button.visible = false
	
	
	
	if int(Dialogic.get_variable("Body_notes")) == 1 and body_1_noted == false:
		var body_notess = body_case_1_notes.instance()
		get_node("CanvasLayer/tabs+button/TabContainer").add_child(body_notess)
		body_1_noted = true
	if int(Dialogic.get_variable("Utensil_info")) == 1 and utensil_noted == false:
		var utensil_notess = utensil_notes.instance()
		get_node("CanvasLayer/tabs+button/TabContainer").add_child(utensil_notess)
		utensil_noted = true
		
		

func _on_Button2_pressed():
	$"CanvasLayer/tabs+button".visible = false
	$CanvasLayer/Button.visible = true
	Autoload.intro_ready = true
