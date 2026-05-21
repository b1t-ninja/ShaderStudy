//
//  challengeThree.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
using namespace metal;


[[stitchable]] half4 challengeThree(float2 position, half4 color, half4 filterChannel) {
  return half4(color * filterChannel);
}
