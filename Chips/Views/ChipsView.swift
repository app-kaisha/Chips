//
//  ChipsView.swift
//  Chips
//
//  Created by app-kaihatsusha on 16/02/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//
import SwiftUI

struct ChipsView<Content: View>: View {
    
    @ViewBuilder
    var content: Content
    
    var body: some View {
        // return a collection of subviews based on teh provided view
        Group(subviews: content) { collection in
            let choppedCollection = collection.chopByWidth(270)
            
            VStack(alignment: .center, spacing: 10.0) {
                ForEach(choppedCollection.indices, id:\.self) { index in
                    HStack(spacing: 10.0) {
                        ForEach(choppedCollection[index]) { subview in
                            //let viewWidth = subview.containerValues.viewWidth
                            
                            subview
                        }
                    }
                }
            }
        }
    }
    
}

extension ContainerValues {
    // create container value
    @Entry var viewWidth: CGFloat = 0
}

extension String {
    
    // with font size then get width of chip from width of text
    func size(_ font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: attributes)
    }
}

extension SubviewsCollection {
    
    // containerWidth is total width of chips view
    // Subview division is divided according to max items possible in a row
    func chopByWidth(_ containerWidth: CGFloat) -> [[Subview]] {
        var row: [Subview] = []
        var rows: [[Subview]] = []
        // matches spacing in top level view TODO: specify from parameter
        let spacing: CGFloat = 10
        var rowWidth: CGFloat = 0
        
        for subview in self {
            let viewWidth = subview.containerValues.viewWidth + spacing
            
            rowWidth += viewWidth
            
            if rowWidth < containerWidth {
                row.append(subview)
            } else {
                rows.append(row)
                row = [subview]
                rowWidth = viewWidth
            }
        }
        
        if !row.isEmpty {
            rows.append(row)
        }
        
        return rows
    }
    
    // split a single array into multiple arrays with specified size
    func chopIntoPieces(_ size: Int) -> [[Subview]] {
        return stride(from: 0, to: count, by: size).map { index in
            Array(self[index..<Swift.min(index + size, count)])
        }
    }
}

#Preview {
    ChipView()
}
