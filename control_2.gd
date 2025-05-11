extends Control

@onready var volume_panel = $VolumePanel
@onready var volume_slider = $VolumePanel/HSlider
@onready var close_button = $VolumePanel/CloseButton2

func _ready():
	volume_panel.visible = false

	# Значення слайдера від 0 до 1
	volume_slider.min_value = 0
	volume_slider.max_value = 1
	volume_slider.step = 0.01
	volume_slider.value = 1.0  # або завантажити з налаштувань

	volume_slider.value_changed.connect(_on_volume_changed)
	close_button.pressed.connect(_on_close_pressed)

func _on_volume_changed(value: float) -> void:
	# Преобразувати значення в дБ (від -40 до 0)
	var db_volume = lerp(-40.0, 0.0, value)
	AudioServer.set_bus_volume_db(0, db_volume)

func _on_close_pressed() -> void:
	volume_panel.visible = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # ESC або інше
		volume_panel.visible = not volume_panel.visible
