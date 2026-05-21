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
        SL.circleFollow(
          .float2(size),
          .float2(mouse),
          .float(time),
        )
      }
      .frame(width: 500, height: 500)
    }
}

#Preview {
    CircleView()
}
