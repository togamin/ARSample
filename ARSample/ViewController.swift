//
//  ViewController.swift
//  ARSample
//
//  Created by Togami Yuki on 2018/09/25.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene(飛行機のオブジェクト)
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = SCNScene()
        
        //xyzの位置に物体を生成
        creatNode(x:0,y:0,z:-0.5)
    }
    

    
    
    //(x,y,z)の位置に立方体を生成する関数。
    func creatNode(x:Float,y:Float,z:Float){
        //ノードを生成
        let node = SCNNode()
        // ノードの形状を一辺が20cmの立方体とする
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        //マテリアル(表面)を生成する
        let material = SCNMaterial()
        //表面はの画像を設定。
        material.diffuse.contents = UIImage(named: "swift.png")
        //表面の情報をノードに適用
        node.geometry?.materials = [material]
        //ノードの位置は、カメラを原点として左右：x m 上下：y m　奥：z m
        node.position = SCNVector3(x, y, z)
        // 生成したノードをシーンに追加する
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
