//
//  CircleView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
      ShaderView {size, time , mouse, _ in
        SL.smoothCircle(
          .float2(size),
        )
      }
      .frame(width: 400, height: 400)
    }
}

#Preview {
    CircleView()
}
