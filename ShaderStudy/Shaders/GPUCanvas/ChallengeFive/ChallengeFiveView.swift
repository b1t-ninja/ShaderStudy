//
//  ChallengeFiveView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

struct ChallengeFiveView: View {
  var body: some View {
    ShaderView { _, iTime, _, _ in
      ShaderLibrary.challengeFive(
        .float(iTime),
      )
    }
  }
}

#Preview {
  ChallengeFiveView()
}
