//
//  ViewController.swift
//  UIDynamic UISnap UiAttachment + practce
//
//  Created by Денис Андреев on 7/9/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // UIAttachment - anchor
    // UISnap - снимок
    
    
    var square = UIView()
    var animator = UIDynamicAnimator()
    var squareViewAnchor = UIView()
    var anchor = UIView()
    var attachment: UIAttachmentBehavior?
    
    
    override func viewDidLoad() {
        createGesture()
        createSquare()
        createAnchor()
        createAnimationAndBehaviour()
    }
    
    private func createSquare(){
        square.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        square.backgroundColor = .green
        square.center = self.view.center
        squareViewAnchor = UIView(frame: (CGRect(x: 30, y: 0, width: 20, height: 20)))
        squareViewAnchor.backgroundColor = .brown
        square.addSubview(squareViewAnchor)
        self.view.addSubview(square)
    }
    
    
    //view с точкой привязки
    private func createAnchor(){
        anchor = UIView(frame: (CGRect(x: 120, y: 120, width: 20, height: 20)))
        anchor.backgroundColor = .red
        view.addSubview(anchor)
    }
    
    //создадим регистратор жеста панорамарования
    private func createGesture(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handler(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    //создаем столкновение и прикрепление
    private func createAnimationAndBehaviour(){
        animator = UIDynamicAnimator(referenceView: view)
        //столкновения
        let colision = UICollisionBehavior(items: [square])
        colision.translatesReferenceBoundsIntoBoundary = true
        attachment = UIAttachmentBehavior(item: square, attachedToAnchor: anchor.center)
        animator.addBehavior(colision)
        animator.addBehavior(attachment!)

        
    }
    
    @objc func handler(_ param:UIPanGestureRecognizer){
        let tapPoint = param.location(in: view)
        print(tapPoint)
        attachment?.anchorPoint = tapPoint
        anchor.center = tapPoint
    }
    
    
}

