//
//  horizontalGradient.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;

[[stitchable]]
half4 horizontalGradient(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  return half4(uv.x, uv.x, uv.x, 1.0);
}

