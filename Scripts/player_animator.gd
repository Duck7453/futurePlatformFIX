extends Node2D

@export var player : PlayerController
@export var animation : AnimationPlayer
@export var idle : Sprite2D
@export var walk : Sprite2D
@export var jump : Sprite2D
@export var fall : Sprite2D

func _process(_delta):
	if player.direction == 1:
		idle.flip_h = false
		jump.flip_h = false
		fall.flip_h = false
		walk.flip_h = false
	elif player.direction == -1:
		idle.flip_h = true
		jump.flip_h = true
		fall.flip_h = true
		walk.flip_h = true
		
	if abs(player.velocity.x) > 0.0:
		idle.hide()
		jump.hide()
		fall.hide()
		walk.show()
		animation.play("walk")
	else:
		idle.show()
		jump.hide()
		fall.hide()
		walk.hide()
		animation.play("idle")
		
	if player.velocity.y < 0.0:
		idle.hide()
		jump.show()
		fall.hide()
		walk.hide()
		animation.play("jump")
	elif player.velocity.y > 0.0:
		idle.hide()
		jump.hide()
		fall.show()
		walk.hide()
		animation.play("fall")
		
