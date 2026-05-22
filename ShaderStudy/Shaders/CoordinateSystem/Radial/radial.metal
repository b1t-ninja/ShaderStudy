//
//  radial.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;

[[ stitchable ]] half4 radial(float2 position, half4 color, float2 size) {
  float2 uv = position / size;
  float2 center = uv - 0.5;
  center = aspect(center, size);
  
  float dist = length(center);
  // sin gives us -1, 1, so we need to map that to 0, 1 to get a valid color output
  // 20 is the oscillating factor so to say, bigger number -> more rings
  float pattern = to01(sin(dist * 20.0));
  
  return half4(pattern, pattern, pattern, 1.0);
}
