//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Mikus Zarins on 29/04/2025.
//

import SwiftUI
import ThemeKit

struct ThemePicker: View {
    @Binding var selection: Theme
    var body: some View {
        Picker(selection: $selection, label: Text("Theme")) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)

    }
}

#Preview {
    @Previewable @State var theme = Theme.periwinkle
    ThemePicker(selection: $theme)
}
