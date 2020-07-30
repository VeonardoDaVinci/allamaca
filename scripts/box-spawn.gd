extends Node


var grid = 2
var coords = [[4,2.5,0],[-5.915,3.228,0],[2.599,2.509,2.766]]


# Called when the node enters the scene tree for the first time.
func _ready():
	var scene1 = load("res://scenes/Block.tscn")
	for x in range(-2,3):
		for z in range(-2,3):
			var block = scene1.instance()
			block.translation.x = x*grid
			block.translation.z = z*grid
			add_child(block)
	var scene2 = load("res://scenes/Coin.tscn")
	for i in coords:
		var coin = scene2.instance()
		coin.translation.x = i[0]
		coin.translation.y = i[1]
		coin.translation.z = i[2]
		add_child(coin)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
