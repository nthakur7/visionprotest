//
//  TemplateApp.swift
//  Template
//
//  Created by Nandini Thakur on 3/12/24.
//

import SwiftUI

@main
struct TemplateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
