//
//  coordFour.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;

// smooth circle
[[ stitchable ]] half4 coordFour(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  float2 center = uv - 0.5;
  
  // we need aspect as we use length wich is aspect dependend
  center = aspect(center, size);
  
  float dist = length(center);
  float circle = 1.0 - smoothstep(0.29, 0.31, dist);
  
  return half4(circle, circle, circle, 1.0);
}

