//
//  SecondViewController.swift
//  UIAttachment&&UISnap
//
//  Created by max on 17.01.2020.
//  Copyright © 2020 max. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var sqareView = UIView()
    var animator = UIDynamicAnimator()
    var snap: UISnapBehavior?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createSquareView()
        createGesture()
        createCollision()
        createSnap()
        
    }
    func createSquareView() {
        sqareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        sqareView.center = view.center
        sqareView.backgroundColor = .purple
        view.addSubview(sqareView)
    }
    
    func createGesture() {
        let gest = UITapGestureRecognizer(target: self, action: #selector(gestureFunc(param:)))
        view.addGestureRecognizer(gest)
    }
    
    func createCollision() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [sqareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    func createSnap() {
        snap = UISnapBehavior(item: sqareView, snapTo: sqareView.center)
        snap?.damping = 0.5
        animator.addBehavior(snap!)
    }
    
    @objc func gestureFunc(param: UITapGestureRecognizer) {
        let tapPoint = param.location(in: view)
        print(tapPoint)
        if snap != nil {
            animator.removeBehavior(snap!)
        }
        snap = UISnapBehavior(item: sqareView, snapTo: tapPoint)
        snap?.damping = 0.5
        animator.addBehavior(snap!)
        
    }

    

}
