//
//  Chip.swift
//  Chips
//
//  Created by app-kaihatsusha on 16/02/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation

struct Chip: Identifiable {
    var id: String = UUID().uuidString
    var name: String
}

var mockChips: [Chip] = [
    .init(name: "Apple"),
    .init(name: "Google"),
    .init(name: "Microsoft"),
    .init(name: "Amazon"),
    .init(name: "Facebook"),
    .init(name: "Twitter"),
    .init(name: "Netflix"),
    .init(name: "Youtube"),
    .init(name: "Instagram"),
    .init(name: "Snapchat"),
    .init(name: "Pinterest"),
    .init(name: "Reddit"),
    .init(name: "TikTok"),
    .init(name: "Apple"),
    .init(name: "Apple"),
    .init(name: "Apple"),
    .init(name: "Apple"),
    
]
