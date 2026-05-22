//
//  CoordFourView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

import SwiftUI

struct CoordFourView: View {
    var body: some View {
      ShaderView {size, _, _, _ in
        SL.coordFour(
          .float2(size),
        )
      }
      .frame(width: 400, height: 400)
    }
}

#Preview {
    CoordFourView()
}
