//
//  Cube.swift
//  Cube
//
//  Created by YuanLiYong on 2023/2/17.
//

import Cocoa
import SceneKit

class Cube {
    static func color(_ color: NSColor, x: CGFloat, y: CGFloat, z: CGFloat) -> SCNNode {
        let cubeGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let cubeNode = SCNNode(geometry: cubeGeometry)

        cubeNode.position = .init(x, y, z)

        let material = SCNMaterial()
        material.diffuse.contents = color
        cubeGeometry.materials = [material]

        return cubeNode
    }
}
