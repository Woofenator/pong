extends CanvasLayer

signal start_game

var gameBegun = false

func _process(delta):
	if !gameBegun && Input.is_action_pressed('ui_select'):
		$Message.text = '';
		gameBegun = true
		emit_signal('start_game')

func update_score_left(score: int):
	$ScoreLeft.text = str(score);

func update_score_right(score: int):
	$ScoreRight.text = str(score);
