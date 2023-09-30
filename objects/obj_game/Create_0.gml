
width = room_width div 8
height = room_height div 8

rooms_width = width div 16
rooms_height = height div 16

rooms_data = []

for (var i = 0; i < rooms_width; ++i) {
	array_push(rooms_data, [])
	for (var k = 0; k < rooms_height; ++k) {
	    array_push(rooms_data[@i], undefined)
	}
}

function get_room(i, k) {
	if i >= 0 and i < rooms_width and k >= 0 and k < rooms_height {
		return rooms_data[@i][@k]
	}
	return undefined
}

function bits_opposite(bits) {
	
	return ((bits * 2) mod 16) + ((bits * 2) mod 16)
	
}

function room_selector(xx, yy) {
	
	var flag_needed = 0x0000
	
	var this_room = get_room(xx, yy - 1)
	if this_room != undefined {
		flag_needed = flag_needed | bits_opposite(this_room)
	}
	this_room = get_room(xx + 1, yy)
	if this_room != undefined {
		flag_needed = flag_needed | bits_opposite(this_room)
	}
	this_room = get_room(xx, yy + 1)
	if this_room != undefined {
		flag_needed = flag_needed | bits_opposite(this_room)
	}
	this_room = get_room(xx - 1, yy)
	if this_room != undefined {
		flag_needed = flag_needed | bits_opposite(this_room)
	}
	
	if flag_needed mod 8 and flag_needed div 8 == 0 and random(1) > 0.5 {
		flag_needed += 8
	}
	if flag_needed div 4 == 0 and random(1) > 0.5 {
		flag_needed += 4
	}
	if flag_needed div 2 == 0 and random(1) > 0.5 {
		flag_needed += 2
	}
	if flag_needed div 1 == 0 and random(1) > 0.5 {
		flag_needed += 1
	}
	
	flag_needed = flag_needed | irandom(15)
	
	rooms_data[@xx][@yy] = flag_needed
	
}



for (var i = 0; i < rooms_width; ++i) {
	array_push(rooms_data, [])
	for (var k = 0; k < rooms_height; ++k) {
	    room_selector(i, k)
	}
}



global.tilemap = layer_tilemap_get_id(layer_get_id("Tiles_1"));

//for (var i = 0; i < width; ++i) {
//for (var k = 0; k < height; ++k) {
	
//	var room_i = i div 16
//	var room_k = k div 16
	
//	var this_room = rooms_data[@room_i][@room_k]
	
//	var room_xx = i mod 16
//	var room_yy = k mod 16
//	var index = room_xx + (room_yy * this_room.width)
	
//	var this_color = this_room.data[@index]
	
//	if this_color = make_color_rgb(255,0,0) {
//		tilemap_set(global.tilemap, 1, i ,k)
//	}
//	else {
//		tilemap_set(global.tilemap, 0, i ,k)
//	}
	
//}
//}
