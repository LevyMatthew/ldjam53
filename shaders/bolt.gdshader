shader_type spatial;

uniform float scale = 5.0f;
uniform float speed = 1.5f;
uniform float width = 0.04f;

vec2 random(vec2 uv){
    uv = vec2( dot(uv, vec2(127.1,311.7) ),
               dot(uv, vec2(269.5,183.3) ) );
    return -1.0 + 2.0 * fract(sin(uv) * 43758.5453123);
}

float noise(vec2 uv) {
    vec2 uv_index = floor(uv);
    vec2 uv_fract = fract(uv);

    vec2 blur = smoothstep(0.0, 1.0, uv_fract);

    return mix( mix( dot( random(uv_index + vec2(0.0,0.0) ), uv_fract - vec2(0.0,0.0) ),
                     dot( random(uv_index + vec2(1.0,0.0) ), uv_fract - vec2(1.0,0.0) ), blur.x),
                mix( dot( random(uv_index + vec2(0.0,1.0) ), uv_fract - vec2(0.0,1.0) ),
                     dot( random(uv_index + vec2(1.0,1.0) ), uv_fract - vec2(1.0,1.0) ), blur.x), blur.y) + 0.5;
}

float narrow_band(float x, float center, float edge) {
	float dist = abs(x - center);
	if (dist > width)
		return 0.f;
		
	float width_dist = abs(dist - width);
	if (width_dist < edge)
		return width_dist / edge;
	
	return 1.f;
}


void fragment() {
	vec2 anim_uv = UV + speed * TIME * vec2(0.f, 1.f);
	float perlin = noise(anim_uv * scale);
	
	vec3 colour = vec3(.7, 1.f, .7);
	
	ALBEDO = perlin * colour;
	
	ALPHA = narrow_band(UV.x + (perlin - 0.5) * 0.2, 0.5, 0.01);
}
