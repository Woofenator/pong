extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var intialSpeed = 500
export var speedIncrease = 0.1;


# Set initial speed to 0 to have the game be startable by space
var speed = 0;

# Pick random starting direction
func _ready():
	randomize()
	var initalDir = randi() % 2;
	initialDirection = Vector2.RIGHT if initalDir == 1 else Vector2.LEFT;

# Initialize variables
var initialDirection = Vector2.ZERO
var velocity = Vector2.ZERO;

func resetBall(direction: Vector2):
	speed = intialSpeed
	global_position = direction * 5
	velocity = Vector2.ZERO
	$Timer.start()
	yield($Timer, "timeout")
	velocity = speed * direction;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity=velocity.bounce(collision.normal)
		$WallHit.play()

func _on_Paddle_ball_bounce(angle: Vector2):
	velocity = angle*speed;
	speed += speed * speedIncrease;

func _on_HUD_start_game():
	speed = intialSpeed
	global_position = Vector2.ZERO
	velocity = speed * initialDirection
