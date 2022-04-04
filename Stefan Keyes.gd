extends KinematicBody2D

export var Dialog = "lorumipsum"

func _ready():
	$Talk.Dialog = Dialog
	print($Talk.Dialog)
