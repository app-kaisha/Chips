//
//  ChipView.swift
//  Chips
//
//  Created by app-kaihatsusha on 16/02/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ChipView: View {
    
    @State private var containerWidth: Float = 4
    @State private var isFixedWidth: Bool = false
    
    @State var bindChopType: ChipChopType = .fixedPieces
    
    private var chopType: ChipChopType {
        switch isFixedWidth {
        case true:
                return .fixedPieces
        case false:
                return .frameWidth
        }
    }
    
    @State private var liveChips: [Chip] = []
    
    var body: some View {
        NavigationStack {
            
            Divider()
            
            VStack(alignment: .leading, spacing: 20.0) {
                
                ScrollView(.vertical){
                    ChipsView(chopType: $bindChopType, pieceCount: $containerWidth) {
                        ForEach(liveChips) { chip in
                            
                            // calculate chip width for font + 10 padding
                            let viewWidth = chip.name.size(.preferredFont(forTextStyle: .body)).width + 20
                            
                            Text(chip.name)
                                .font(.body)
                                .lineLimit(1)
                                .foregroundStyle(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(.red.gradient, in: .capsule)
                                .containerValue(\.viewWidth, viewWidth )
                                
                        }
                    }
                    // TODO: frame width fixed - use geometry reader to pass to ChipsView
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .padding(10)
                    
                    
                }
                .background(.primary.opacity(0.06), in: .rect(cornerRadius: 10))
                .scrollIndicators(.hidden)
                
                Toggle("Fixed Count: \(Int(containerWidth))", isOn: $isFixedWidth)
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(10)
                    .background(.black.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text("Number of Containers")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Slider(value: $containerWidth, in: 1...6, step: 1, minimumValueLabel: Text("1"), maximumValueLabel: Text("6")) {
                    }
                    .padding(10)
                    .foregroundStyle(.secondary)
                    .background(.black.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .disabled(!isFixedWidth)
                }
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .navigationTitle("Chips")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Random Chip") {
                        liveChips.append(liveChips[Int.random(in: 0...mockChips.count-1)])
                        let _ = print(liveChips.count)
                    }
                }
            }
        }
        .onAppear {
            liveChips = mockChips
        }
    }
}


#Preview {
    ChipView()
}
