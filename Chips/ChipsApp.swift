//
//  ChipsApp.swift
//  Chips
//
//  Created by app-kaihatsusha on 16/02/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

@main
struct ChipsApp: App {
    var body: some Scene {
        WindowGroup {
            ChipView()
                .onAppear {
                    Thread.sleep(forTimeInterval: 3)
                }
        }
    }
}
