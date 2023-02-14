extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# signal for ending the game
signal game_ended
#
func _on_player_collision():
	emit_signal("game_ended")
