//
//  ChipView.swift
//  Chips
//
//  Created by app-kaihatsusha on 16/02/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ChipView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ChipsView {
                    ForEach(mockChips) { chip in
                        Text(chip.name)
                            .font(.body)
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(.red.gradient, in: .capsule)
                    }
                }
            }
            .padding(15)
            .navigationTitle("Chips")
        }
    }
}


#Preview {
    ChipView()
}
