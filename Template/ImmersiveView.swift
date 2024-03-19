//
//  ImmersiveView.swift
//  Template
//
//  Created by Nandini Thakur on 3/12/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AVFoundation
import AVKit

struct ImmersiveView: View {
    var body: some View {
        
        RealityView { content in

            if let scene = try? await Entity(named:"Immersive", in: realityKitContentBundle) {
                content.add(scene)
            }
            
            let sphere = content.entities[0].findEntity(named: "Sphere")
            var stereo_material = sphere?.components[ModelComponent.self]?.materials[0] as! ShaderGraphMaterial
//            print(stereo_material.parameterNames)
//            let im = UIImage(contentsOfFile: "/Users/nandinithakur/Desktop/left_eye_example.png")!
//            do{
//                let texture = try await TextureResource.generate(from: im.cgImage!, options: TextureResource.CreateOptions.init(semantic: nil))
//                try stereo_material.setParameter(name: "right", value: .textureResource(texture))
//            } catch {
//                print("error loading new texture")
//            }
            
            //Skybox -> large sphere
//            guard let skyBoxEntity = createSkyBox() else {
//                print("error loading sky box entity")
//                return
//            }
            
            let skyBoxEntity = Entity()
            let largePlane = MeshResource.generatePlane(width: 12.88, height: 7.96)
            skyBoxEntity.components.set(
                ModelComponent(mesh: largePlane, materials: [stereo_material])
            )
//            
            skyBoxEntity.setPosition(SIMD3<Float>(x:0, y:1.5, z:-5), relativeTo: nil)
            //add to reality view
            content.add(skyBoxEntity)
            
//            sphere?.scale *= .init(x:-1, y:1, z:1)
            
        }
    }

//    private func createSkyBox () -> Entity? {
////        let largeSphere = MeshResource.generateSphere(radius: 1000)
//        let largePlane = MeshResource.generatePlane(width: 10, height: 6)
//        var skyBoxMaterial = UnlitMaterial()
//
//        do{
//            let texture =  try TextureResource.load(named:"StarryNight")
//            skyBoxMaterial.color = .init(texture: .init(texture))
//        } catch {
//            print("error loading texture")
//        }
//
//        let skyBoxEntity = Entity()
//
//        //map texture to inner surface
////        skyBoxEntity.scale *= .init(x:-1, y:1, z:1)
//        return skyBoxEntity
//    }
}

//RealityView { content in
//    if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
//        content.add(scene)
//    }
//    let sphere = content.entities[0].findEntity(named: "Sphere")
//    sphere?.scale *= .init(x:-1, y:1, z:1)
//}
 
#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
