//
//  challengeOne.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 challengeOne(float2 position, half4 color, half4 selectedColor) {
  return half4(selectedColor.rgb, selectedColor.a);
}
