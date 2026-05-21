//
//  challengeFour.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 challengeFour(float2 position, half4 color, half4 recColor) {
  return recColor;
}
