extends Node2D

var score = Vector2(0, 0);

func _on_Left_add_score():
	score.x += 1
	$HUD.update_score_right(score.x)

func _on_Right_add_score():
	score.y += 1
	$HUD.update_score_left(score.y)