//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 29/04/2025.
//

import SwiftUI
import ThemeKit

struct ThemeView: View {
    var theme: Theme
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
