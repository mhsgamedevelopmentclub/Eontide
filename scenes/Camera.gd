class_name OverworldCamera
extends Camera2D

@export var tilemap: TileMap

func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.tile_set.tile_size
	var worldSizeInPixels = mapRect.end * tileSize
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y
