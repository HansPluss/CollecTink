shader_type sky;
uniform vec3 horizoncolor : source_color;
uniform vec3 skycolor : source_color;

uniform sampler2D skyTexture;
void sky() {
	float col = clamp(EYEDIR.y/0.05,0.0,1.0);
	vec3 finalColor = mix(horizoncolor,skycolor,col);
	COLOR = texture(skyTexture,vec2(SKY_COORDS.x ,SKY_COORDS.y)).rgb;
}
