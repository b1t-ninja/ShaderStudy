//
//  coordChallengeOne.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;


// vertical gradient
[[stitchable]] half4 coordOne(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  half4 col = half4(uv.y, uv.y, uv.y, 1);
  return col;
}
