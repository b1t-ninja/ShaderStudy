//
//  overtimeReminderAnimatedGradient.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
#include "Utils/normalize.metal"

using namespace metal;

[[stitchable]] half4 overtimeAnimatedGradient(
                                              float2 pos,
                                              half4 color,
                                              float3 iResolution,
                                              float iTime,
                                              float4 iMouse,
                                              float mouseDown
                                              ) {
  // Normalize pixel coords to 0..1 (with aspect-correct x)
  half2 p = normalizedPosition(iResolution.xy, pos);
  
  // Animated cosine palette (classic shader gradient)
  float t = iTime * 0.6;
  float v = length(p) * 1.2 + 0.35 * sin(t + p.x * 2.0) + 0.35 * cos(t * 1.3 + p.y * 2.4);
  
  // Dark red / burgundy biased cosine palette
  float3 a = float3(0.35, 0.08, 0.10);   // base (dark red)
  float3 b = float3(0.45, 0.12, 0.14);   // amplitude (mostly red, little green/blue)
  float3 c = float3(1.00, 1.00, 1.00);
  float3 d = float3(0.05, 0.20, 0.25);   // phase offsets to keep variation in reds
  
  float3 rgb = a + b * cos(6.28318 * (c * v + d + t * 0.05));
  
  // Add a subtle "wine" shadow tint so it doesn't go gray/flat
  rgb = mix(rgb, float3(0.10, 0.00, 0.02), 0.25);
  
  // Keep it in range
  rgb = clamp(rgb, 0.0, 1.0);
  
  return half4(half3(rgb), 1.0);
}
