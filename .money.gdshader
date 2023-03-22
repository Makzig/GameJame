shader_type canvas_item;

uniform vec4 color: source_color ;


void fragment() {
	vec4 sprite  = texture(TEXTURE , UV);
	COLOR = color * sprite;
}
