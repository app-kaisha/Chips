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
            let choppedCollection = collection.chopIntoPieces(2)
            
            VStack(alignment: .center, spacing: 10.0) {
                ForEach(choppedCollection.indices, id:\.self) { index in
                    HStack(spacing: 10.0) {
                        ForEach(choppedCollection[index]) { subview in
                            subview
                        }
                    }
                }
            }
        }
    }
}

extension SubviewsCollection {
    
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
