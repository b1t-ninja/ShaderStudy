//
//  ChallengeOneView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

import SwiftUI

struct CoordOneView: View {
    var body: some View {
      ShaderView { size, _, _, _ in
        SL.coordOne(
          .float2(size)
        )
      }
      .frame(width: 400, height: 400)
    }
}

#Preview {
    CoordOneView()
}
