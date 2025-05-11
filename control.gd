extends Control

func _ready():
	$SmallPanel.visible = false  # гарантуємо, що панель прихована з початку
	$Button.pressed.connect(_on_main_button_pressed)
	$SmallPanel/CloseButton.pressed.connect(_on_close_button_pressed)

func _on_main_button_pressed():
	$SmallPanel.visible = true  # показати панель при натисканні кнопки

func _on_close_button_pressed():
	$SmallPanel.visible = false  # ховати панель при натисканні кнопки "Закрити"
