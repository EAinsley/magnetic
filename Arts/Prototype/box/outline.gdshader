shader_type canvas_item;

uniform float edge_width = 0.1; // 描边宽度
uniform vec4 edge_color = vec4(1.0, 1.0, 1.0, 1.0); // 描边颜色，这里设置为白色

void fragment() {
    // 从纹理中获取颜色
    vec4 albedo = texture(TEXTURE, UV);
    
    // 边缘检测，这里使用简单的阈值检测
    float edge = step(0.5 - edge_width, albedo.a);
    
    // 混合边缘颜色和纹理颜色
    vec4 final_color = mix(albedo, edge_color, edge);
    
    // 输出最终颜色
    COLOR = final_color;
}