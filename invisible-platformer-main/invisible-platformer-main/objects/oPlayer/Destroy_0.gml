var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

var center_screen_x = view_w/2 - sPlayButton.sprite_width/2;
var center_screen_y = view_y + view_h/2 - sPlayButton.sprite_height/2;
var y_offset = -100;

instance_create_depth(
	center_screen_x,
	center_screen_y + y_offset,
	-200,
	oPlayButton
);