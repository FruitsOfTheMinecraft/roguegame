
function tile_meeting(ix, iy, thelayer) {
	///@description tile_meeting(x,y,thelayer)
	///@param x
	///@param y
	///@param thelayer

	// taken from the game maker studio tutorial on precise tile collisions

	//var _layer = layer_get_id(thelayer)
	var _tm = layer_tilemap_get_id(thelayer)
	
	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (argument0 - x), y),
	_y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (argument1 - y)),
	_x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (argument0 - x), y),
	_y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (argument1 - y));
 
	for(var _x = _x1; _x <= _x2; _x++) {
		for(var _y = _y1; _y <= _y2; _y++) {
			
			if(tile_get_index(tilemap_get(_tm, _x, _y))) {
				return true;
			}
		
		}
	}

	return false;
}


function tile_meeting_specific(ix, iy, thelayer, tiles) {
	///@description tile_meeting(x,y,thelayer)
	///@param x
	///@param y
	///@param thelayer
	
	// taken from the game maker studio tutorial on precise tile collisions
	
	//var _layer = layer_get_id(thelayer)
	var _tm = layer_tilemap_get_id(thelayer)
	
	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (ix - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (iy - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (ix - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (iy - y));
 
	for(var _x = _x1; _x <= _x2; _x++) {
		for(var _y = _y1; _y <= _y2; _y++) {
			var _this_tile = tile_get_index(tilemap_get(_tm, _x, _y))
			if value_in_list(_this_tile, tiles) {
				return true
			}
		}
	}

	return false;
}


function value_in_list(entry,list) {
	var len = array_length(list)
	for (var i = 0; i < len; ++i) {
		var this_entry = list[@i]
		if this_entry == entry {return true}
	}
	return false
}




	


function portion(val,target,percent) {
	var _dif = target - val
	return val + (_dif*percent)
}





function step_towards_point(px,py,step_length) {
	
	var dist_ = point_distance(x,y,px,py)
	
	var dif_x = px - x
	dif_x /= dist_
	dif_x *= step_length
	
	var dif_y = py - y
	dif_y /= dist_
	dif_y *= step_length
	
	x += dif_x
	y += dif_y
	
}



function array_max(_array) {
	
	if array_length(_array) == 1 {
		return _array[@0]
	}
	else {
		
		var _max = -9999999999
		for (var i = 0; i < array_length(_array); ++i) {
		    if _array[@i] > _max {_max = _array[@i]}
		}
		return _max
		
	}
	
	
}



function array_random(_array) {
	// gets a random item from an array
	var _ind = irandom(array_length(_array)-1)
	return _array[@_ind]
}

function array_random_blacklist(_array) {
	
	repeat 999 {
		
		
		
	}
	
}