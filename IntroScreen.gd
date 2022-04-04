extends CanvasLayer

func _ready():
	$Downloads.visible = true
	$IntroScreenCaseTest.visible = true

func _process(delta):
	if Input.is_action_pressed("space"):
		Autoload.intro_ready = true
		queue_free()
