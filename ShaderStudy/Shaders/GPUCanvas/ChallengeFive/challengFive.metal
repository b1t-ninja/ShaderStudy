//
//  challengFive.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 challengeFive(float2 position, half4 color, float time) {
  return half4(sin(time), cos(time), sin(time), 1);
}
