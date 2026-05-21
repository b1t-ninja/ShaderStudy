//
//  ContentView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ShaderView { iResolution, iTime, iMouse, mouseDown in
      ShaderLibrary.overtimeAnimatedGradient(
        .float3(iResolution.x, iResolution.y, iResolution.z),
        .float(iTime),
        .float4(iMouse.x, iMouse.y, iMouse.z, iMouse.w),
        .float(mouseDown) // if mouseDown is already Float
      )
    }
  }
}

#Preview {
  ContentView()
}
