//
//  TemplateApp.swift
//  Template
//
//  Created by Nandini Thakur on 3/12/24.
//

import SwiftUI

@main
struct TemplateApp: App {
    
    @State var immersionMode: ImmersionStyle = .full
    var body: some Scene {
        //Starting Window
        WindowGroup {
            ImmersiveControlView()
        }
        .defaultSize(width: 10, height: 10)
        .windowStyle(.plain)

        //Immersive View
        ImmersiveSpace(id: "ImmersiveSpace") {
            //VR View
            ImmersiveView()
        }
        .immersionStyle(selection: $immersionMode, in: .full)
    }
}
