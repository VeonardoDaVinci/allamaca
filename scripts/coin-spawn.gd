extends Node


var coords = [[4,2.5,0],[-5.915,3.228,0],[2.599,2.509,2.766]]

func _ready():
	var scene = load("res://scenes/Coin.tscn")
	for i in coords:
		var coin = scene.instance()
		coin.translation.x = i[0]
		coin.translation.y = i[1]
		coin.translation.z = i[2]
		add_child(coin)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
