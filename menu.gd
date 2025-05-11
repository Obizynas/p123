extends Node2D

# Змінні для завантаження сцен
var scene_1 : PackedScene
var scene_2 : PackedScene
var scene_3 : PackedScene

func _ready() -> void:
	# Завантажуємо сцени
	scene_1 = load("res://scene_1_root.tscn") as PackedScene
	scene_2 = load("res://scene_2_root.tscn") as PackedScene
	scene_3 = load("res://game.tscn") as PackedScene

	# Підключаємо кнопки до їхніх функцій
	$CanvasLayer/TestButton1.pressed.connect(_on_TestButton1_pressed)
	$CanvasLayer/TestButton2.pressed.connect(_on_TestButton2_pressed)
	$CanvasLayer/TestButton3.pressed.connect(_on_TestButton3_pressed)

# Функція для зміни сцени на scene_1
func _on_TestButton1_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

# Функція для зміни сцени на scene_2
func _on_TestButton2_pressed() -> void:
	get_tree().change_scene_to_file("res://scene_2_root.tscn")

# Функція для зміни сцени на scene_3
func _on_TestButton3_pressed() -> void:
	get_tree().change_scene_to_file("res://scene_3_root.tscn")
