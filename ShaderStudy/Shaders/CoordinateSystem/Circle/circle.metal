//
//  circle.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;

[[stitchable]] half4 circleFollow(
                                  float2 position, half4 color, float2 size, float2 mousePos, float time
                                  ) {
  float2 uv = position / size;   // 0..1
  float2 m  = mousePos / size;   // 0..1
  
  // small oscillation (in UV units)
  float2 wobble = float2(sin(time * 10.0), cos(time * 12.0)) * 0.01;
  
  float2 c = m + wobble;
  
  float radius = 0.2;
  float dist = length(uv - c);
  
  return (dist < radius)
  ? half4(1.0, m.x, sin(time), 1.0)
  : half4(0.0, 0.0, 0.0, 1.0);
}

[[ stitchable ]] half4 circle(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  float2 center = uv - 0.5;  // Center at (0,0)
  float radius = 0.5;
  
  float dist = length(center);  // Distance from center
  
  if (dist < radius) {
    return half4(1.0, 1.0, 1.0, 1.0);  // White inside
  } else {
    return half4(0.0, 0.0, 0.0, 1.0);  // Black outside
  }
}

[[ stitchable ]] half4 smoothCircle(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  float2 center = uv - 0.5;
  
  float dist = length(center);
  float circle = 1.0 - smoothstep(0.29, 0.31, dist);
  
  return half4(circle, circle, circle, 1.0);
}
