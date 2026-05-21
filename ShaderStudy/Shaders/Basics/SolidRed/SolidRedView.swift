//
//  SolidRedView.swift
//  ShaderStudy
//
//  Created by Nico Rückner on 21.05.26.
//

import SwiftUI

struct SolidRedView: View {
  var body: some View {
    Rectangle()
      .colorEffect(ShaderLibrary.solidRed())
      .frame(width: 400, height: 400)
  }
}

#Preview {
  SolidRedView()
}
