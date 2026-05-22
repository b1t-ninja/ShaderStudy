//
//  gridPattern.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

#include <metal_stdlib>
#include "../../Utils/normalize.metal"
using namespace metal;

[[ stitchable ]] half4 gridPattern(float2 position, half4 color, float2 size) {
  float2 uv = normalizedPosition(position, size);
  
  float2 cell = uv * 8.0;
  float2 f = fract(cell);
  
  float lineWidth = 0.1;
  
  // interior grid lines (only one side, so no doubles)
  float lineX = (f.x < lineWidth);
  float lineY = (f.y < lineWidth);
  
  // add outer borders (right + bottom)
  lineX = lineX || (uv.x > 1.0 - lineWidth / 8.0);
  lineY = lineY || (uv.y > 1.0 - lineWidth / 8.0);
  
  float lines = (lineX || lineY) ? 1.0 : 0.0;
  
  return half4(lines, lines, lines, 1.0);
}
