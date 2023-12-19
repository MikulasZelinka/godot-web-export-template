shader_type canvas_item;

uniform float distortion : hint_range(0.0, 1.0) = 0.1;
uniform float distortion_speed : hint_range(0.0, 32.0) = 1.0;

uniform sampler2D distortion_texture;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 pixel_color = texture(TEXTURE, UV + sin(TIME * distortion_speed) * distortion * texture(distortion_texture, UV).r);
	COLOR = pixel_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
