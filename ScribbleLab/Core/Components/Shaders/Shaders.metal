//
//  Shaders.metal
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

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

[[ stitchable ]] half4 gradient(float2 pos, half4 color) {
    return half4(
        pos.x / pos.y,
        0,
        pos.y / pos.x,
        color.a
    );
}

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
