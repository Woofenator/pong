extends Area2D

signal ball_bounce(direction)

func _on_Paddle_body_entered(body: PhysicsBody2D):
	var bodyPosition = body.global_position;
	var directionVector = global_position.direction_to(bodyPosition);
	
	print(directionVector);

	emit_signal("ball_bounce", directionVector)
