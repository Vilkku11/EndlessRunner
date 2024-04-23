extends Node3D

@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	#var player = preload("res://Player/player.tscn").instantiate()
	#var emitter = get_parent().get_node("player")
	player.collision.connect(_on_player_collision())
	call_deferred("add_player", player)
	#player.collision.connect("_on_player_collision")


func add_player(player):
	get_tree().root.add_child(player)
	#player.position = Vector3(1,1,1)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# signal for ending the game
signal game_ended
#
func _on_player_collision():
	emit_signal("game_ended")
