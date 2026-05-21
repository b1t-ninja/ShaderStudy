//
//  ChallengeThreeView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

enum Channel {
  case red
  case green
  case blue
  case neutral
  
  func color() -> Color {
    return switch self {
    case .red:
      Color.red
    case .green:
      Color.green
    case .blue:
      Color.blue
    case .neutral:
      Color.white // white is (1, 1, 1) so for multiplication is essentially the neutral element
    }
  }
}

struct ChallengeThreeView: View {
  @State private var selection: Channel = .red
  
  var body: some View {
    VStack {
      Image("landscape")
        .resizable()
        .scaledToFill()
        .frame(height: 250)
        .clipped()
        .colorEffect(ShaderLibrary.challengeThree(.color(selection.color())))
      
      Picker("Filter", selection: $selection) {
        Text("Original").tag(Channel.neutral)
        Text("Red Only").tag(Channel.red)
        Text("Green Only").tag(Channel.green)
        Text("Blue Only").tag(Channel.blue)
      }
      .pickerStyle(.palette)
      .padding()
    }
  }
}

#Preview {
  ChallengeThreeView()
}
