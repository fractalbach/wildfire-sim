extends Node2D

enum VEG {NONE, LOW, MED, HIGH}
enum DIRECTION {NORTH, SOUTH, EAST, WEST}
enum TILE_TYPE {WATER, GRASS, TALL_GRASS}

var SIZE_OF_GRID = 30
var LENGTH_OF_TILE_ARRAY = SIZE_OF_GRID * SIZE_OF_GRID
var tile_array = []

class Tile:
	var type : int = Tile.getRandomTileType()
	var vegetation : int = VEG.NONE
	var hasFire : bool = false
	var windDirect : int = DIRECTION.NORTH
	var windSpeed : int = 5
	
	static func getRandomTileType() -> int:
		var r = randi() % TILE_TYPE.size()
		return TILE_TYPE.values()[r]
	
	func get_wind_direction_letter() -> String:
		match windDirect:
			DIRECTION.NORTH: return "N"
			DIRECTION.SOUTH: return "S"
			DIRECTION.EAST: return "E"
			DIRECTION.WEST: return "W"
		return "_"
	
	func _to_string() -> String:
		var formatString = "{type:%s, veg:%s, fire:%s, wind:%s%s}"
		var direction = get_wind_direction_letter()
		return formatString % [type, vegetation, hasFire, windSpeed, direction]




func _ready() -> void:
	
	# Initialize Tile Data Array
	tile_array.resize(LENGTH_OF_TILE_ARRAY)
	for i in range(LENGTH_OF_TILE_ARRAY):
		tile_array[i] = Tile.new()
	
	print("Tiles have been generated.")
	
	# REFRESH TILE_MAP DISPLAY
	for i in range(LENGTH_OF_TILE_ARRAY):
		var x = i % SIZE_OF_GRID
		var y = floor(i / SIZE_OF_GRID)
		$TileMap.set_cell(x, y, tile_array[i].type)
		


func quit():
	print("Quitting... Goodbye!")
	get_tree().quit()
