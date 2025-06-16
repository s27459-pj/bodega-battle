extends Control
@onready var score_label: Label = $ScoreLabel

func _ready() -> void:
	GlobalVars.score_changed.connect(update_score)
	update_score(GlobalVars.score)

func update_score(score : int) -> void:
	score_label.text = "Score: " + str(score)
