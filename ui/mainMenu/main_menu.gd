extends Control

# Definitions

@export var scrollingSpeed = 0.3


func _process(_delta):
	# Background Moving Script
	$background.scroll_offset.x += scrollingSpeed
	$background.scroll_offset.y += scrollingSpeed

# Buttons Behaviour

func _on_exit_button_pressed():
	get_tree().quit()


func _on_twitter_pressed():
	OS.shell_open("https://twitter.com/cookiielove_")


func _on_newgrounds_pressed():
	OS.shell_open("https://cookiielove.newgrounds.com")


func _on_itchio_pressed():
	OS.shell_open("https://cookiie-love.itch.io")


func _on_kofi_pressed():
	OS.shell_open("https://ko-fi.com/cookiielove_")


func _on_settings_pressed():
	$settings.visible = true
	$settings/settingsAnimations.play("open")


func _on_settings_animations_animation_finished(anim_name):
	if anim_name == "open":
		$settings/settingsAnimations.play("idle")


func _on_youtube_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCKT6DNMSxurEH_pCQn2WIew")
