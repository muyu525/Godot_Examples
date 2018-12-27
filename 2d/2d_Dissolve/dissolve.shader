shader_type canvas_item;

uniform sampler2D noise_img : hint_albedo;
uniform float dissolve : hint_range(0,1);

void fragment() {
    vec4 texture = texture(TEXTURE, UV);
    vec4 noise_texture = texture(noise_img, UV);
    texture.a *= floor(1.0 - dissolve + min(0.99, noise_texture.x));
    COLOR = texture;
}