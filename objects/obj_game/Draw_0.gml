

for (var i = 0; i < rooms_width; ++i) {
	for (var k = 0; k < rooms_height; ++k) {
	    
		draw_set_color(c_white)
		var xx = 62 + (i * 16 * 8)
		var yy = 62 + (k * 16 * 8)
		draw_text(xx, yy, string(rooms_data[@i][@k]))
		
		var dir = [[0,-1],[1,0],[0,1],[-1,0]]
		
		for (var v = 0; v < 4; ++v) {
			var val = rooms_data[@i][@k]
			if val != undefined and val & power(2,v) {
				
				var length = 8*8
				draw_arrow(xx, yy, xx+(dir[@v][@0] * length), yy+(dir[@v][@1] * length), 8)
				
			}
		}
		
	}
}

