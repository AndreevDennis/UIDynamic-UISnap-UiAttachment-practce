//
//  MyViewController.swift
//  UIDynamic UISnap UiAttachment + practce
//
//  Created by Денис Андреев on 7/9/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import UIKit

final class MyViewController: UIViewController {
    
    var square = UIView()
    var animator = UIDynamicAnimator()
    var snap : UISnapBehavior?
    
    override func viewDidLoad() {
        createGesture()
        createSquare()
        createAnimator()
    }
    
    
    private func createSquare(){
        square.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        square.backgroundColor = .green
        view.addSubview(square)
    }
    
    private func createGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(hanlder(_:)))
        view.addGestureRecognizer(tap)
    }
    
    
    private func createAnimator(){
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        snap = UISnapBehavior(item: square, snapTo: square.center)
        snap!.damping = 0.5
        animator.addBehavior(snap!)
    }
    
    @objc func hanlder(_ param : UITapGestureRecognizer){
      // get angle
        let tapPoint = param.location(in: view)
        
        if snap != nil {
            animator.removeBehavior(snap!)
        }
        
        snap = UISnapBehavior(item: square, snapTo: tapPoint)
        snap!.damping = 0.5 // middle
        animator.addBehavior(snap!)
    }
    
}
