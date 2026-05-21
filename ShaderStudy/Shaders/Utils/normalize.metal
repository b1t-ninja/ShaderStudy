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

// [-1, 1]
inline half2 normalizedPositionCenter(float2 position, float2 size) {
  half2 uv01 = half2(position / max(size, float2(1.0f))); // avoid div-by-0
  half2 p = (uv01 - half2(0.5h)) * 2.0h;                  // -1..1
  p.x *= half(size.x / max(size.y, 1.0f));                // aspect correct
  return p;
}

// (0,1)
inline float2 normalizedPositionUnclamped(float2 position, float2 size) {
  float2 safeSize = max(size, float2(1.0f));
  return position / safeSize; // ~0..1 inside bounds
}

// [0, 1]
inline float2 normalizedPosition(float2 position, float2 size) {
  float2 safeSize = max(size, float2(1.0f));
  return saturate(position / safeSize); // 0..1 inclusive
}
#endif
