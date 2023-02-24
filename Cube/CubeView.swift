//
//  CubeView.swift
//  Cube
//
//  Created by YuanLiYong on 2023/2/17.
//

import Cocoa
import SceneKit

class CubeView: NSView {
    let cubeSize = 80
    let scene = SCNScene()

    let srcColor: NSColor
    let desColor: NSColor
    let tolerance: CGFloat

    init(src: NSColor, des: NSColor, hueTolerance: CGFloat) {
        srcColor = src
        desColor = des
        tolerance = hueTolerance
        super.init(frame: .zero)

        addSceneView()
        addLight()
        addCamera()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCube() {
        let size = cubeSize
        let interval = 256 / CGFloat(size)
        for b in 0..<size {
            for g in 0..<size {
                for r in 0..<size {
                    var color = NSColor(red: CGFloat(r) / 255 * interval, green: CGFloat(g) / 255 * interval, blue: CGFloat(b) / 255 * interval, alpha: 1)
                    var countMin = 0
                    var countMax = 0
                    if r == 0 { countMin += 1 }
                    if g == 0 { countMin += 1 }
                    if b == 0 { countMin += 1 }
                    if r == size - 1 { countMax += 1 }
                    if g == size - 1 { countMax += 1 }
                    if b == size - 1 { countMax += 1 }
                    if countMin + countMax >= 2 {
                        color = .black
                    }

                    if countMin + countMax != 0 {
                        let cube = Cube.color(
                            color,
                            x: CGFloat(r),
                            y: CGFloat(b),
                            z: CGFloat(g)
                        )
                        scene.rootNode.addChildNode(cube)
                    }
                }
            }
        }
    }

    func addChangedAndOther() {
        let size = cubeSize
        let interval = 256 / CGFloat(size)
        for b in 0..<size {
            for g in 0..<size {
                for r in 0..<size {
                    var color = NSColor(red: CGFloat(r) / 255 * interval, green: CGFloat(g) / 255 * interval, blue: CGFloat(b) / 255 * interval, alpha: 1)
                    if color.hueComponent > srcColor.hueComponent - tolerance && color.hueComponent < srcColor.hueComponent + tolerance {
                        color = NSColor(hue: desColor.hueComponent, saturation: color.saturationComponent, brightness: color.brightnessComponent, alpha: 1)
                    }
                    var countMin = 0
                    var countMax = 0
                    if r == 0 { countMin += 1 }
                    if g == 0 { countMin += 1 }
                    if b == 0 { countMin += 1 }
                    if r == size - 1 { countMax += 1 }
                    if g == size - 1 { countMax += 1 }
                    if b == size - 1 { countMax += 1 }
                    if countMin + countMax >= 2 {
                        color = .black
                    }

                    if countMin + countMax != 0 {
                        let cube = Cube.color(
                            color,
                            x: CGFloat(r),
                            y: CGFloat(b),
                            z: CGFloat(g)
                        )
                        scene.rootNode.addChildNode(cube)
                    }
                }
            }
        }
    }

    func addWillChangeCube() {
        let size = cubeSize
        let interval = 256 / CGFloat(size)
        for b in 0..<size {
            for g in 0..<size {
                for r in 0..<size {
                    var cube: SCNNode?

                    var color = NSColor(red: CGFloat(r) / 255 * interval, green: CGFloat(g) / 255 * interval, blue: CGFloat(b) / 255 * interval, alpha: 1)
                    if color.hueComponent > srcColor.hueComponent - tolerance && color.hueComponent < srcColor.hueComponent + tolerance {
                        cube = Cube.color(
                            color,
                            x: CGFloat(r),
                            y: CGFloat(b),
                            z: CGFloat(g)
                        )
                    }
                    var countMin = 0
                    var countMax = 0
                    if r == 0 { countMin += 1 }
                    if g == 0 { countMin += 1 }
                    if b == 0 { countMin += 1 }
                    if r == size - 1 { countMax += 1 }
                    if g == size - 1 { countMax += 1 }
                    if b == size - 1 { countMax += 1 }
                    if countMin + countMax >= 2 {
                        color = .black
                        cube = Cube.color(
                            color,
                            x: CGFloat(r),
                            y: CGFloat(b),
                            z: CGFloat(g)
                        )
                    }
                    if let cube = cube {
                        scene.rootNode.addChildNode(cube)
                    }
                }
            }
        }
    }

    func addChangedCube() {
        let size = cubeSize
        let interval = 256 / CGFloat(size)
        for b in 0..<size {
            for g in 0..<size {
                for r in 0..<size {
                    var cube: SCNNode?

                    var color = NSColor(red: CGFloat(r) / 255 * interval, green: CGFloat(g) / 255 * interval, blue: CGFloat(b) / 255 * interval, alpha: 1)
                    if color.hueComponent > srcColor.hueComponent - tolerance && color.hueComponent < srcColor.hueComponent + tolerance {
                        color = NSColor(hue: desColor.hueComponent, saturation: color.saturationComponent, brightness: color.brightnessComponent, alpha: 1)
                        cube = Cube.color(
                            color,
                            x: CGFloat(r),
                            y: CGFloat(b),
                            z: CGFloat(g)
                        )
                    }
                    var countMin = 0
                    var countMax = 0
                    if r == 0 { countMin += 1 }
                    if g == 0 { countMin += 1 }
                    if b == 0 { countMin += 1 }
                    if r == size - 1 { countMax += 1 }
                    if g == size - 1 { countMax += 1 }
                    if b == size - 1 { countMax += 1 }
                    if countMin + countMax >= 2 {
                        color = .black
                        cube = Cube.color(
                            color,
                            x: CGFloat(r),
                            y: CGFloat(b),
                            z: CGFloat(g)
                        )
                    }
                    if let cube = cube {
                        scene.rootNode.addChildNode(cube)
                    }
                }
            }
        }
    }

    func addCamera() {
        let camera = SCNCamera()
        camera.zFar = 1000
        // 设置正投影【即：物体不论靠近或者远离，大小看起来都一样】
        camera.usesOrthographicProjection = true
        // 正投影比例 默认1【当且仅当usesOrthographicProjection == true 时有效】
        camera.orthographicScale = 80

        camera.focusDistance = 80

        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(500, 300, 200)
        scene.rootNode.addChildNode(cameraNode)


        let oriPoint = SCNNode()
        oriPoint.position = .init(0, 0, 0)


        let constraint = SCNLookAtConstraint(target: oriPoint)
        constraint.isGimbalLockEnabled = true
        cameraNode.constraints = [constraint]
    }

    func addSceneView() {
        let sceneView = SCNView(frame: .zero)
        sceneView.allowsCameraControl = true
        sceneView.scene = scene
        addSubview(sceneView)

        sceneView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            sceneView.topAnchor.constraint(equalTo: topAnchor),
            sceneView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sceneView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sceneView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    func addLight() {
        let light = SCNLight()
        light.type = .ambient
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(300, 300, 300)

        scene.rootNode.addChildNode(lightNode)
    }
}
