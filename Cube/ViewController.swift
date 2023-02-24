//
//  ViewController.swift
//  Cube
//
//  Created by YuanLiYong on 2023/2/17.
//

import Cocoa
import SceneKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrColor = NSColor(red: CGFloat(67) / 255, green: CGFloat(128) / 255, blue: CGFloat(235) / 255, alpha: 1)
        let desColor = NSColor(red: CGFloat(235) / 255, green: CGFloat(97) / 255, blue: 0, alpha: 1)

        let oriCubeView = CubeView(src: .red, des: .red, hueTolerance: 0.02)

        let desCubeView = CubeView(src: scrColor, des: desColor, hueTolerance: 0.02)

        let willChageCube = CubeView(src: scrColor, des: desColor, hueTolerance: 0.02)

        let didChangeCube = CubeView(src: scrColor, des: desColor, hueTolerance: 0.02)

        view.addSubview(oriCubeView)
        view.addSubview(desCubeView)
        view.addSubview(willChageCube)
        view.addSubview(didChangeCube)

        oriCubeView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            oriCubeView.topAnchor.constraint(equalTo: view.topAnchor),
            oriCubeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])

        desCubeView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            desCubeView.topAnchor.constraint(equalTo: view.topAnchor),
            desCubeView.leadingAnchor.constraint(equalTo: oriCubeView.trailingAnchor),
            desCubeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])


        willChageCube.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            willChageCube.topAnchor.constraint(equalTo: oriCubeView.bottomAnchor),
            willChageCube.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            willChageCube.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        didChangeCube.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            didChangeCube.topAnchor.constraint(equalTo: desCubeView.bottomAnchor),
            didChangeCube.leadingAnchor.constraint(equalTo: willChageCube.trailingAnchor),
            didChangeCube.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            didChangeCube.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        view.addConstraints([
            oriCubeView.widthAnchor.constraint(equalTo: desCubeView.widthAnchor),
            desCubeView.widthAnchor.constraint(equalTo: willChageCube.widthAnchor),
            willChageCube.widthAnchor.constraint(equalTo: didChangeCube.widthAnchor),
            oriCubeView.heightAnchor.constraint(equalTo: desCubeView.heightAnchor),
            desCubeView.heightAnchor.constraint(equalTo: willChageCube.heightAnchor),
            willChageCube.heightAnchor.constraint(equalTo: didChangeCube.heightAnchor),
        ])


        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            oriCubeView.addCube()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                desCubeView.addChangedAndOther()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    willChageCube.addWillChangeCube()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        didChangeCube.addChangedCube()
                    }
                }
            }
        }

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

