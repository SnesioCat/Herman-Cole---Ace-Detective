extends KinematicBody2D

# animation
var move_horizontal = "Running horizontal"
var move_north = "Running North"
var move_south = "Running South"
var stand_horizontal = "Standing horizontal"
var stand_north = "Standing North"
var stand_south = "Standing South"

#movement
var velocity = Vector2.ZERO
var speed = 250

#interaction
var dialog_scene
var can_interact = false
var is_in_dialog = false

func movement(delta):
	
	$AnimatedSprite.speed_scale = 1.5 
	speed = 250
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("shift"):
		speed = 325
		$AnimatedSprite.speed_scale = 2
	
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite.animation = move_north
		velocity.y -= speed
		
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.animation = move_south
		velocity.y += speed
		
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = move_horizontal
		velocity.x -= speed
		
		
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = move_horizontal
		velocity.x += speed
		
	if Input.is_action_just_released("ui_up"):
		$AnimatedSprite.animation = stand_north
			
	if Input.is_action_just_released("ui_down"):
		$AnimatedSprite.animation = stand_south
		
	if Input.is_action_just_released("ui_left"):
		$AnimatedSprite.animation = stand_horizontal
		$AnimatedSprite.flip_h = true
		
	if Input.is_action_just_released("ui_right"):
		$AnimatedSprite.animation = stand_horizontal
		$AnimatedSprite.flip_h = false
	
	velocity = move_and_slide_with_snap(velocity, Vector2.UP)
	

func interact():
	if Input.is_action_just_pressed("space") and can_interact == true:
		is_in_dialog = true
		var new_dialog = Dialogic.start(dialog_scene)
		add_child(new_dialog)
		standstill()
		


func standstill():
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite.animation = stand_north
		
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.animation = stand_south
		
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = stand_horizontal
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = stand_horizontal



func _physics_process(delta):
	
	
	if is_in_dialog == false and Autoload.intro_ready == true:
		movement(delta)
		interact()
	
	#Turning Movement off during dialog and on when the dialog is finished
	var is_finished = int(Dialogic.get_variable("is_finished"))
	if is_finished == 1:
		is_in_dialog = false
		Dialogic.set_variable("is_finished", 0)



func _on_Interaction_body_entered(body):
	if body.is_in_group("interactable"):
		dialog_scene = body.Dialog
		can_interact = true

func _on_Interaction_body_exited(body):
	if body.is_in_group("interactable"):
		can_interact = false
