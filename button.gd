extends Control

var volume_level : float = 1.0  # Початковий рівень гучності

func _ready():
	# Перевірка на існування вузлів
	if has_node("SmallPanel2"):
		$SmallPanel2.visible = false  # Гарантуємо, що панель прихована з початку
	else:
		print("Не знайдено вузол: SmallPanel2")

	if has_node("Button"):
		$Button.pressed.connect(_on_main_button_pressed)
	else:
		print("Не знайдено вузол: Button")

	if has_node("SmallPanel2/CloseButton2"):
		$SmallPanel2/CloseButton2.pressed.connect(_on_close_button_pressed)  # Підключаємо CloseButton2
	else:
		print("Не знайдено вузол: SmallPanel2/CloseButton2")
		
	if has_node("VolumeButton"):
		$VolumeButton.pressed.connect(_on_volume_button_pressed)  # Обробник для кнопки Volume
	else:
		print("Не знайдено вузол: VolumeButton")

# Покажемо або сховаємо панель
func _on_main_button_pressed():
	print("Main button pressed")
	$SmallPanel2.visible = true  # Показати панель
	print("SmallPanel2.visible: ", $SmallPanel2.visible)

func _on_close_button_pressed():
	print("Close button pressed")
	$SmallPanel2.visible = false  # Сховати панель
	print("SmallPanel2.visible: ", $SmallPanel2.visible)

# При натисканні на VolumeButton змінюємо гучність
func _on_volume_button_pressed():
	print("Volume button pressed")
	volume_level = 0.5 if volume_level == 1.0 else 1.0  # Перемикаємо між максимальним та середнім рівнем
	AudioServer.set_bus_volume_db(0, volume_level_to_db(volume_level))  # Застосовуємо нову гучність
	print("Volume level: ", volume_level)

# Конвертуємо рівень гучності в децибели
func volume_level_to_db(level : float) -> float:
	return 20 * log(level) / log(10)  # Використовуємо логарифмічну шкалу для гучності
