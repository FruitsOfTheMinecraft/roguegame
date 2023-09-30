

for (var i = 0; i < rooms_width; ++i) {
	for (var k = 0; k < rooms_height; ++k) {
	    
		draw_set_color(c_white)
		var xx = 32 + (i * 16 * 8)
		var yy = 32 + (k * 16 * 8)
		draw_text(xx, yy, string(rooms_data[@i][@k]))
		
	}
}

