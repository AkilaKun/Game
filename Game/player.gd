extends KinematicBody2D


var up = Vector2(0,-1)
var dichuyen = Vector2()
var tocdo = 10000
var trongluc = 5
var jump = -50000
var base = true

func _physics_process(delta):
	dichuyen.y += 100
	if Input. is_action_pressed("ui_right"):
		dichuyen.x = tocdo * delta
		$animation.play("chay")
		$animation.flip_h = false
	elif Input. is_action_pressed("ui_left"):
		dichuyen.x = -tocdo * delta
		$animation.play("chay")
		$animation.flip_h = true
	else: 
		pass
		dichuyen.x = 0
		$animation.play("dung")
	if is_on_floor():
		if Input. is_action_just_pressed("ui_up"):
			dichuyen.y = jump * delta
			$animation.play("nhay")
		if Input.is_action_just_pressed("ui_down"):
			if is_on_floor():
				dichuyen.x = 0
				$animation.play("attack")
	move_and_slide(dichuyen,up)
