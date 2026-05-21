//
//  solidRed.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
using namespace metal;

// the two args are the bare minimum, and are passed by swift automatically
// we can't remove them
[[ stitchable ]] half4 solidRed(float2 position, half4 color) {
  //           | red channel  | alpha channel
  // meaning it returns exactly red, for every pixel, thats it
  return half4(1.0, 0.0, 0.0, 1.0);
}
