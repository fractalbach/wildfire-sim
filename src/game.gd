extends Node2D

enum VEG {NONE, LOW, MED, HIGH}
enum DIRECTION {NORTH, SOUTH, EAST, WEST}

class Tile:
	var vegetation : int = VEG.NONE
	var hasFire : bool = false
	var windDirect : int = DIRECTION.NORTH
	var windSpeed : int = 5
	
	func get_wind_direction_letter() -> String:
		match windDirect:
			DIRECTION.NORTH: return "N"
			DIRECTION.SOUTH: return "S"
			DIRECTION.EAST: return "E"
			DIRECTION.WEST: return "W"
		return "_"
	
	func _to_string() -> String:
		var formatString = "{veg:%s, fire:%s, wind:%s%s}"
		var direction = get_wind_direction_letter()
		return formatString % [vegetation, hasFire, windSpeed, direction]


func _ready() -> void:
	var t : Tile = Tile.new()
	print(t)
	print("Quitting... Goodbye!")
	get_tree().quit()
