extends Area2D

export var position_to_go_to_X = 0
export var position_to_go_to_Y = 0

export var change_music = false
export var music = preload("res://Assets/Music/07. The Plot Thickens!.mp3")

onready var anim = $Transitor/AnimationPlayer

var body_var

func _on_Teleporter_body_entered(body):
	body_var = body
	if body_var.is_in_group("player"):
		body_var.standstill()
		anim.play("fade_in")
		Autoload.intro_ready = false
		$Timer.start(1)



func _on_Timer_timeout():
	$Timer.stop()
	body_var.position.x = position_to_go_to_X
	body_var.position.y = position_to_go_to_Y
	if change_music == true:
		Autoload.change_music = true
		Autoload.music = music
	
	
	anim.play("fade_out")
	$Timer2.start(1)


func _on_Timer2_timeout():
	
	$Timer2.stop()
	Autoload.intro_ready = true
