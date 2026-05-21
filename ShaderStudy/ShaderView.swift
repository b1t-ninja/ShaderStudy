//
//  ShaderView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI
/**
 `ShaderView` is a reusable SwiftUI component that provides common shader inputs like resolution, time, mouse position, and mouse button state.
 
 Use it by supplying a closure that creates a `Shader` with the following parameters:
 
 - `iResolution`: `SIMD3<Float>` — the viewport resolution `(width, height, 0)`, matching `u_resolution` or `iResolution` in GLSL shaders.
 - `iTime`: `Float` — elapsed time in seconds since the view appeared, matching `u_time` or `iTime`.
 - `iMouse`: `SIMD4<Float>` — mouse coordinates with the Y-axis flipped:
 - `iMouse.xy` is the current mouse position in pixels.
 - `iMouse.zw` is the mouse click position in pixels.
 - `mouseDown`: `Bool` — whether the mouse button (or touch) is currently pressed.
 
 Example usage:
 
 ```swift
 ShaderView { iResolution, iTime, iMouse, mouseDown in
 ShaderLibrary.overtimeAnimatedGradient(
 .float3(iResolution.x, iResolution.y, iResolution.z),
 .float(iTime),
 .float4(iMouse.x, iMouse.y, iMouse.z, iMouse.w),
 .float(mouseDown) // if mouseDown is already Float
 )
 }
 */
struct ShaderView: View {
  let makeShader: (SIMD3<Float>, Float, SIMD4<Float>, Float) -> Shader
  let start = Date.now
  
  @State private var mouseLocation: CGPoint = .zero
  @State private var mouseClickLocation: CGPoint = .zero
  @State private var mouseDown = false
  
  var body: some View {
    TimelineView(.animation) { tl in
      let time = start.distance(to: tl.date)
      
      Rectangle()
        .contentShape(Rectangle())
        .gesture(
          DragGesture(minimumDistance: 0)
            .onChanged { value in
              mouseLocation = value.location
              if !mouseDown {
                mouseDown = true
                mouseClickLocation = value.location
              }
            }
            .onEnded { _ in
              mouseDown = false
            }
        )
        .visualEffect { content, proxy in
          let size = proxy.size
          
          let iResolution = SIMD3<Float>(Float(size.width), Float(size.height), 0)
          let iMouse = SIMD4<Float>(
            Float(mouseLocation.x),
            Float(size.height - mouseLocation.y),
            Float(mouseClickLocation.x),
            Float(size.height - mouseClickLocation.y)
          )
          let iTime = Float(start.distance(to: tl.date))
          
          return content.colorEffect(
            makeShader(iResolution, iTime, iMouse, mouseDown ? 1.0 : 0.0)
          )
        }
    }
  }
}

