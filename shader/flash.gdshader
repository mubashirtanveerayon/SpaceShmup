shader_type canvas_item;

uniform bool enabled=false;
uniform float dead_pixel_threshold=0.3;
void fragment() {
	if (enabled){
		vec4 pixelColor = texture(TEXTURE,UV);
		COLOR=vec4(1.0,1.0,1.0,pixelColor.a >= dead_pixel_threshold ? 1.0 : 0.0);
	}
}
