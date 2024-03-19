//
//  ContentView.swift
//  Template
//
//  Created by Nandini Thakur on 3/12/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveControlView: View {
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
 
    var body: some View {
        VStack{
            Button{
                Task{
                    await openImmersiveSpace(id: "Immersive View")
                }
            } label: {
                Image(systemName: "visionpro")
            }
        }
        .padding()
    }
}
 
#Preview(windowStyle: .automatic) {
    ImmersiveControlView()
}
