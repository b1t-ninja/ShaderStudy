//
//  coordThree.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;

// angular around the center
[[stitchable]] half4 coordThree(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  
  float2 center = uv - 0.5;
  center = aspect(center, size);
  
  float dist = length(center);
  
  float g = 1.0 - dist;
  return half4(g, g, g, 1);
}
