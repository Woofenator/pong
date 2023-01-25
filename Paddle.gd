extends Area2D

var ball = preload('res://Ball.gd')

signal ball_bounce(direction)

export var paddleSide = '';
export var upEvent = '%s_paddle_up'
export var downEvent = '%s_paddle_down'

export var maxSpeed = 100;
export var maxY = 260;
export var minY = -260;

func _on_Paddle_body_entered(body: PhysicsBody2D):
	if body.get_script() == ball:
		var bodyPosition = body.global_position;
		var directionVector = global_position.direction_to(bodyPosition);

		directionVector.y /= 2;

		emit_signal("ball_bounce", directionVector.normalized())

func _physics_process(delta):
	var speed = 0;
	if Input.is_action_pressed(upEvent % paddleSide):
		speed = delta * -maxSpeed;
	elif Input.is_action_pressed(downEvent % paddleSide):
		speed = delta * maxSpeed;
	
	global_position.y = clamp(global_position.y + speed, minY, maxY)
