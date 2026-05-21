//
//  adjustableBrightness.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 adjustableBrightness(
                                            float2 position,
                                            half4 color,
                                            float brightness
                                            ) {
  // here we multiply the current pixel color with brightness,
  // alpha channel gets passed through directly
  return half4(color.rgb * brightness, color.a);
}
