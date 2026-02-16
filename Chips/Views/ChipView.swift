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
                        
                        // calculate chip width for font + 10 padding
                        let viewWidth = chip.name.size(.preferredFont(forTextStyle: .body)).width + 20
                        
                        Text(chip.name)
                            .font(.body)
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(.red.gradient, in: .capsule)
                            .containerValue(\.viewWidth, viewWidth )
                    }
                }
                // TODO: frame width fixed - use geometry reader to pass to ChipsView
                .frame(width: 300)
                .padding(15)
                .background(.primary.opacity(0.06), in: .rect(cornerRadius: 10))
            }
            .padding(15)
            .navigationTitle("Chips")
        }
    }
}


#Preview {
    ChipView()
}
