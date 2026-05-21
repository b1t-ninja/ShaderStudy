//
//  ShaderView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI
import simd
/**
 `ShaderView` is a reusable SwiftUI component that provides common shader inputs like resolution, time, mouse position, and mouse button state.
 
 Use it by supplying a closure that creates a `Shader` with the following parameters:
 
 - `reqMouseDown`: `Bool` - sets weather or not mousetracking works without clicking
 - `size`: `SIMD2<Float>` — the viewport resolution `(width, height)`.
 - `time`: `Float` — elapsed time in seconds since the view appeared.
 - `mouse`: `SIMD4<Float>` — mouse coordinates.
 - `mouseDown`: `Bool` — whether the mouse button (or touch) is currently pressed.
 
 Example usage:
 
 ```swift
 ShaderView { size, time, mouse, mouseDown in
  SL.overtimeAnimatedGradient(
    .float2(size),
    .float(time),
    .float4(mouse),
    .float(mouseDown)
  )
 }
 ```
 
 Any other params are passed directly from SwiftUI to the shader, not limited to the existing params.
 
 An example:
 ```swift
 struct ChallengeFourView: View {
 @State private var firstColor: Color = .blue
 @State private var secondColor: Color = .white
 @State private var thirdColor: Color = .red
 
 var body: some View {
 VStack {
 Text("Flag Creator")
 .font(.largeTitle)
 .bold()
 
 HStack(spacing: 0) {
 Rectangle()
 .colorEffect(ShaderLibrary.challengeFour(.color(firstColor)))
 Rectangle()
 .colorEffect(ShaderLibrary.challengeFour(.color(secondColor)))
 Rectangle()
 .colorEffect(ShaderLibrary.challengeFour(.color(thirdColor)))
 }
 
 HStack {
 ColorPicker("First", selection: $firstColor)
 ColorPicker("Second", selection: $secondColor)
 ColorPicker("Third", selection: $thirdColor)
 }
 }
 .padding()
 }
 }
```
 */
struct ShaderView: View {
  let makeShader: (SIMD2<Float>, Float, SIMD4<Float>, Float) -> Shader
  var reqMouseDown: Bool = true
  
  let start = Date.now
  
  @State private var mouseLocation: CGPoint = .zero
  @State private var mouseClickLocation: CGPoint = .zero
  @State private var mouseDown = false
  
  init(
    reqMouseDown: Bool = true,
    _ makeShader: @escaping (SIMD2<Float>, Float, SIMD4<Float>, Float) -> Shader
  ) {
    self.reqMouseDown = reqMouseDown
    self.makeShader = makeShader
  }
  
  var body: some View {
    TimelineView(.animation) { tl in
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
        .overlay(
          GeometryReader { _ in
            Color.clear
              .contentShape(Rectangle())
              .onContinuousHover { phase in
                if case .active(let location) = phase {
                  if !reqMouseDown || mouseDown {
                    mouseLocation = location
                  }
                }
              }
          }
        )
        .visualEffect { content, proxy in
          let size = proxy.size
          let iResolution = SIMD2<Float>(Float(size.width), Float(size.height))
          
          let iMouse = SIMD4<Float>(
            Float(mouseLocation.x),
            Float(mouseLocation.y),
            Float(mouseClickLocation.x),
            Float(mouseClickLocation.y)
          )
          
          let iTime = Float(start.distance(to: tl.date))
          
          return content.colorEffect(
            makeShader(iResolution, iTime, iMouse, mouseDown ? 1.0 : 0.0)
          )
        }
    }
  }
}

typealias SL = ShaderLibrary

extension Shader.Argument {
  // MARK: - float2
  
  static func float2(_ v: SIMD2<Float>) -> Shader.Argument {
    .float2(v.x, v.y)
  }
  
  static func float2(_ v: SIMD3<Float>) -> Shader.Argument {
    .float2(v.x, v.y)
  }
  
  static func float2(_ v: SIMD4<Float>) -> Shader.Argument {
    .float2(v.x, v.y)
  }
  
  // MARK: - float3
  
  static func float3(_ v: SIMD2<Float>, z: Float = 0) -> Shader.Argument {
    .float3(v.x, v.y, z)
  }
  
  static func float3(_ v: SIMD3<Float>) -> Shader.Argument {
    .float3(v.x, v.y, v.z)
  }
  
  static func float3(_ v: SIMD4<Float>) -> Shader.Argument {
    .float3(v.x, v.y, v.z)
  }
  
  // MARK: - float4
  
  static func float4(_ v: SIMD2<Float>, z: Float = 0, w: Float = 0) -> Shader.Argument {
    .float4(v.x, v.y, z, w)
  }
  
  static func float4(_ v: SIMD3<Float>, w: Float = 0) -> Shader.Argument {
    .float4(v.x, v.y, v.z, w)
  }
  
  static func float4(_ v: SIMD4<Float>) -> Shader.Argument {
    .float4(v.x, v.y, v.z, v.w)
  }
}
