//
//  AdustableBrightnessView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

struct ChallengeTwoView: View {
  @State private var brightness: Float = 0.5
  var body: some View {
    Image("face")
      .resizable()
      .scaledToFit()
      .colorEffect(ShaderLibrary.challengeTwo(.float(brightness)))
      .overlay(alignment: .bottom) {
        Slider(value: $brightness, in: 0...1)
          .padding()
      }
  }
}

#Preview {
    ChallengeTwoView()
}
