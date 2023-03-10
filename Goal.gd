extends Area2D

var Ball = preload("Ball.gd")

signal reset_ball(direction)
signal add_score()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Left_body_entered(body:Node):
	if body is Ball:
		$Score.play()
		emit_signal("add_score")
		emit_signal('reset_ball', Vector2.RIGHT)

func _on_Right_body_entered(body:Node):
	if body is Ball:
		$Score.play()
		emit_signal("add_score")
		emit_signal('reset_ball', Vector2.LEFT)
