extends AudioStreamPlayer

var is_stopped = 0

func _physics_process(delta):
	
	if int(Dialogic.get_variable("Music_stopped")) == 1:
		stop()
		is_stopped = 1
	
	if int(Dialogic.get_variable("Music_stopped")) == 1 and is_stopped == 1:
		play()
		is_stopped = 0
	
	if Autoload.change_music == true:
		stream = Autoload.music
		play()
		Autoload.change_music = false
