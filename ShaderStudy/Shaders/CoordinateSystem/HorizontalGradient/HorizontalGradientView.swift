//
//  HorizontalGradientView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

struct HorizontalGradientView: View {
    var body: some View {
      ShaderView { size, _ , _ , _ in
        ShaderLibrary.horizontalGradient(
          .float2(size)
        )
      }
    }
}

#Preview {
    HorizontalGradientView()
}
