
shader_type canvas_item;

uniform float blur_amount : hint_range(0.0, 5.0) = 0;

void fragment() {
    vec4 color = vec4(0.0);
    vec2 pixel = TEXTURE_PIXEL_SIZE * blur_amount;

    for (int x = -2; x <= 2; x++) {
        for (int y = -2; y <= 2; y++) {
            color += texture(TEXTURE, UV + vec2(float(x), float(y)) * pixel);
        }
    }

    COLOR = color / 25.0;
}
