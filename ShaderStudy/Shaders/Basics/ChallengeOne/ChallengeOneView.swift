//
//  ChallengeOneView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

struct ChallengeOneView: View {
  @State private var selectedColor: Color = .red
  var body: some View {
    VStack {
      RoundedRectangle(cornerRadius: 10)
        .colorEffect(ShaderLibrary.challengeOne(.color(selectedColor)))
      HStack {
        Button {
          selectedColor = .red
        }label: {
          Text("Red")
        }
        Button {
          selectedColor = .green
        }label: {
          Text("Green")
        }
        Button {
          selectedColor = .blue
        }label: {
          Text("Blue")
        }
      }
    }
    .frame(width: 400)
  }
}

#Preview {
  ChallengeOneView()
}
