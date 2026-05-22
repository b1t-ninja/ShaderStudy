//
//  circle.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;

[[ stitchable ]] half4 circle(float2 position, half4 color, float2 size) {
  float2 uv = position / size;
  float2 center = uv - 0.5;  // Center at (0,0)
  
  // we need aspect as we use length wich is aspect dependend
  center = aspect(center, size);
  
  float dist = length(center);  // Distance from center
  
  if (dist < 0.1) {
    return half4(1.0, 1.0, 1.0, 1.0);  // White inside
  } else {
    return half4(0.0, 0.0, 0.0, 1.0);  // Black outside
  }
}

[[ stitchable ]] half4 smoothCircle(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  float2 center = uv - 0.5;
  
  // we need aspect as we use length wich is aspect dependend
  center = aspect(center, size);
  
  float dist = length(center);
  float circle = 1.0 - smoothstep(0.29, 0.31, dist);
  
  return half4(circle, circle, circle, 1.0);
}
