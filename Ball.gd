extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var intialSpeed = 500
export var speedIncrease = 0.1;

var speed = intialSpeed;
var initialDirection = Vector2.RIGHT;
var velocity = initialDirection * speed;

func resetBall(direction: Vector2):
	speed = intialSpeed
	global_position = Vector2.ZERO
	velocity = speed * direction;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
			print(collision.collider.name)
			velocity=velocity.bounce(collision.normal)

func _on_Paddle_ball_bounce(angle: Vector2):
	velocity = angle*speed;
	speed += speed * speedIncrease;

