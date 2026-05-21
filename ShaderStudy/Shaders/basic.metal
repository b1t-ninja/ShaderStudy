//
//  basic.metal
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

#include <metal_stdlib>
using namespace metal;

/*
 // SwiftUI → Metal Parameter Types
 .float<T>(T)                    // → float
 .float2(CGPoint)                // → float2 (from point.x, point.y)
 .float2<T>(T, T)               // → float2
 .float3<T>(T, T, T)            // → float3
 .float4<T>(T, T, T, T)         // → float4
 .color(Color)                   // → half4 (premultiplied in target color space)
 .colorArray([Color])            // → device const half4 *ptr, int count
 .image(Image)                   // → texture2d<half> (one per shader limit)
 .floatArray([Float])            // → device const float *ptr, int count
 .data(Data)                     // → device const void *ptr, int size_in_bytes
 .boundingRect                   // → float4 (automatically provided by SwiftUI) as float4(x, y, width, height)
 */

/*
 // SwiftUI Side - Multiple touch points
 let touchPoints: [Float] = [
 Float(touch1.x), Float(touch1.y),
 Float(touch2.x), Float(touch2.y),
 Float(touch3.x), Float(touch3.y)
 ]
 
 Rectangle()
 .colorEffect(ShaderLibrary.multiTouchRipple(.floatArray(touchPoints)))

 */
