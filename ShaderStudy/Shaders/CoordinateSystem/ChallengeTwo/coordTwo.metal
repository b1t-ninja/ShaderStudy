//
//  coordTwo.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;

[[stitchable]] half4 coordTwo(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  // represents the average of both x and y value, to get the middle value
  float g = (uv.x + uv.y) * 0.5;
  return half4(g, g, g, 1);
}
