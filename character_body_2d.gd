extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("walk")
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
	
	

	move_and_slide()
