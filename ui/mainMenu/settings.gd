extends Control


func _process(_delta):
	if DisplayServer.window_get_mode() == 0:
		$popup/bottomButtonGrid/fullscreen.visible = true
		$popup/bottomButtonGrid/windowed.visible = false
	elif DisplayServer.window_get_mode() == 3:
		$popup/bottomButtonGrid/windowed.visible = true
		$popup/bottomButtonGrid/fullscreen.visible = false

func _on_close_pressed():
	$settingsAnimations.play("close")


func _on_settings_animations_animation_finished(anim_name):
	if anim_name == "close":
		$".".visible = false


func _on_fullscreen_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_windowed_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_vsync_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)


func _on_borderless_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		DisplayServer.window_set_size(DisplayServer.screen_get_size() / 1.1)
		var screenCenter = DisplayServer.screen_get_size() / 25
		DisplayServer.window_set_position(screenCenter)
	else:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		DisplayServer.window_set_size(DisplayServer.screen_get_size() / 1.1)
		var windowPosition = DisplayServer.window_get_position()
		windowPosition.y -= 30
		windowPosition.x -= 6
		DisplayServer.window_set_position(windowPosition)
