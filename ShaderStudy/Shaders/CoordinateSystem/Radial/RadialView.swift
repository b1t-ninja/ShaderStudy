//
//  RadialView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 22.05.26.
//

import SwiftUI

struct RadialView: View {
    var body: some View {
      ShaderView { size, _, _, _ in
        SL.radial(
          .float2(size)
        )
      }
    }
}

#Preview {
    RadialView()
}
