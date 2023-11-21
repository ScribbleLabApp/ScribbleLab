//
//  Shaders.metal
//  ScribbleLab
//
//  Created by Nevio Hirani on 15.11.23.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

//  `colorEffect()`
//  - half4 name(float2 position, half4 color, args...)
// `distortionEffect()`
//  - float2 name(float2 position, args...)
// `layerEffect()`
//  - half4 name(float2 position, SwiftUI::Layer layer, args...)

// Grayscale shader
[[ stitchable ]] half4 grayscale(float2 position, SwiftUI::Layer layer) {
    half4 originalColor = layer.sample(position);
    float grayscaleValue = (originalColor.r + originalColor.g + originalColor.b) / 3.0;
    return half4(grayscaleValue, grayscaleValue, grayscaleValue, originalColor.a);
}

[[ stitchable ]] half4 passthrough(float2 pos, half4 color) {
    return color;
}

[[ stitchable ]] half4 recolor(float2 pos, half4 color) {
    return half4(1, 0, 0, color.a); /// ` half4(r, g, b, a)` r: red, g; green, b: blue, a: alpha (opacity)
}

[[ stitchable ]] half4 invertAlpha(float2 pos, half4 color) {
    return half4(1, 0, 0, 1 - color.a);
}

// Gardient fill shader
[[ stitchable ]] half4 gradient(float2 pos, half4 color) {
    return half4(
        pos.x / pos.y,
        0,
        pos.y / pos.x,
        color.a
    );
}

// animated gradient
[[ stitchable ]] half4 rainbow(float2 pos, half4 color, float t, float2 s) { // t: time, s: size
    float angle = atan2(pos.y, pos.x) + t;
    
    return half4(
        sin(angle),
        sin(angle + 2),
        sin(angle + 4),
        color.a
    );
}

[[ stitchable ]] float2 wave(float2 pos, float t, float2 s) {
    float2 distance = pos / s;
    pos.y += sin(t * 5 + pos.y / 20) * distance.x * 10;
    return pos;
}

[[ stitchable ]] half4 loupe(float2 pos, SwiftUI::Layer layer, float2 s, float2 touch) {
    float maxDistance = 0.05;
    
    float2 uv = pos / s;
    float2 center = touch / s;
    float2 delta = uv - center;
    
    float aspectRatio = s.x / s.y;
    float distance = (delta.x * delta.x) + (delta.y * delta.y) / aspectRatio;
    
    float totalZoom = 1;
    
    if (distance < maxDistance) {
        totalZoom /= 2;
        totalZoom += distance * 10;
    }
    
    float2 newPos = delta * totalZoom + center;
    return layer.sample(newPos * s);
}

[[ stitchable ]] half4 circles(float2 pos, half4 color, float2 s, float ammount) {
    float2 uv = pos / s;
    float strenght = 20;
    float2 f = fract(pos / strenght);
    float d = distance(f, 0.5);
    
    if (d + uv.x + uv.y < ammount * 3) {
        return color;
    } else {
        return 0;
    }
}
