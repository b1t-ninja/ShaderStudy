//
//  ChallengeFourView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

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

#Preview {
    ChallengeFourView()
}
