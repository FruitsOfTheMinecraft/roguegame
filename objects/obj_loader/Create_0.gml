
global.rooms = []

selected_map = 0

files_to_load = []



bytes_per_pixel = 4

loaded = false

processes = [false, false]
// 0 = initial img loading
// 1 = room connection flags setting



function imgmap_struct(data, width, height, name) {
	
	var struct = {}
	struct.data = data
	struct.width = width
	struct.height = height
	struct.name = name
	struct.connection_flags = 0x0000
	
	return struct
	
}

function buffer_to_colordata(buffer_id) {
	
	var size = buffer_get_size(buffer_id)
	
	buffer_seek(buffer_id, buffer_seek_start, 0)
	
	var array = []
	
	for (var i = 0; i < floor(size / 4); ++i) {
		var r = buffer_read(buffer_id, buffer_u8)
		var g = buffer_read(buffer_id, buffer_u8)
		var b = buffer_read(buffer_id, buffer_u8)
		var alpha = buffer_read(buffer_id, buffer_u8)
		array_push(array, make_color_rgb(r, g, b))
	}
	
	return array
	
}

function buffer_to_array(buffer_id) {
	
	var size = buffer_get_size(buffer_id)
	
	buffer_seek(buffer_id, buffer_seek_start, 0)
	
	var array = []
	
	for (var i = 0; i < size; ++i) {
	    var val = buffer_read(buffer_id, buffer_u8)
		array_push(array, val)
	}
	
	return array
	
}
