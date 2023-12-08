extends Node

# Definitions

var rng = RandomNumberGenerator.new()


func _process(_delta):
	# Click SFX Play
	if Input.is_action_just_pressed("click"):
		$sfx/clickSFX.pitch_scale += rng.randf_range(-0.3, 0.6)
		$sfx/clickSFX.play()


func _on_click_sfx_finished():
	$sfx/clickSFX.pitch_scale = 1


func _on_main_menu_finished():
	$music/mainMenu.play()
