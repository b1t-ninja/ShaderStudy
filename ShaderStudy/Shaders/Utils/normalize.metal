//
//  normalize.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#ifndef UTILS_NORMALIZED_POSITION
#define UTILS_NORMALIZED_POSITION

#include <metal_stdlib>
using namespace metal;

inline half2 normalizedPosition(float2 size, float2 position) {
  half2 uv01 = half2(position / max(size, float2(1.0f))); // avoid div-by-0
  half2 p = (uv01 - half2(0.5h)) * 2.0h;                  // -1..1
  p.x *= half(size.x / max(size.y, 1.0f));                // aspect correct
  return p;
}

inline half2 normalizedPositionPointFive(float2 size, float2 position) {
  float2 uv = position / max(size, float2(1.0f));
  float aspect = size.x / max(size.y, 1.0f);
  return half2( (uv.x - 0.5f) * aspect,
               (uv.y - 0.5f) );
}
#endif
