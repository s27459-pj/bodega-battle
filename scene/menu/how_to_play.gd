extends Control

var current_index = 0

var pages = [
	{
		"image": preload("res://assets/UI/other/turret_placement.png"),
		"title": "Turret Placement",
		"description": "In the bottom-left corner of your screen, there's panel with turrets. You can select them by left-clicking or pressing keys 1 and 2. Place turret by clicking on desired location on the map."
	},
	{
		"image": preload("res://assets/UI/other/enemy.png"),
		"title": "Enemies Incoming",
		"description": "Enemies come in waves. Prepare your defenses accordingly. You can place new turrets during waves. Don't let them break into your store!!!"
	},
	{
		"image": preload("res://assets/UI/other/health.png"),
		"title": "Health bar",
		"description": "If enemies break through your defenses, you start losing HP. Reaching 0 HP means GAME OVER..."
	},
	{
		"image": preload("res://assets/UI/other/money.png"),
		"title": "Money Management",
		"description": "You earn 1 coin per second, plus 10 coins for each enemy defeated."
	}
]

func _ready():
	update_page()
	$MarginContainer/Left/ArrowLeft.pressed.connect(on_arrow_left)
	$MarginContainer/Right/ArrowRight.pressed.connect(on_arrow_right)

func on_arrow_left():
	current_index -= 1
	if current_index < 0:
		current_index = pages.size() - 1
	update_page()

func on_arrow_right():
	current_index += 1
	if current_index >= pages.size():
		current_index = 0
	update_page()

func update_page():
	var current = pages[current_index]
	$MarginContainer/Center/HowToTitle.text = current["title"]
	$MarginContainer/Center/Description.text = current["description"]
	$MarginContainer/Center/Panel2/HowToPhoto.texture = current["image"]
