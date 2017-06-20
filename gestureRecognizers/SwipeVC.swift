//
//  SwipeVC.swift
//  gestureRecognizers
//
//  Created by Luthfi Fathur Rahman on 6/19/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class SwipeVC: UIViewController {

    @IBOutlet weak var cardContainerView: UIView!
    @IBOutlet weak var Card1: UIImageView!
    @IBOutlet weak var Card2: UIImageView!
    @IBOutlet weak var Card3: UIImageView!
    
    var originView: UIImageView?
    var destinationView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardContainerView.addSubview(Card1)
        cardContainerView.addSubview(Card2)
        cardContainerView.addSubview(Card3)
        view.addSubview(cardContainerView)
        
        print("originIndex = \(cardContainerView.subviews.startIndex)")
        print("cardContainerView.subviews.count = \(cardContainerView.subviews.count)")
        originView = cardContainerView.subviews[view.subviews.endIndex-1] as? UIImageView

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeCard))
        swipe.numberOfTouchesRequired = 1
        swipe.direction = [.up, .down, .right, .left]
        cardContainerView.addGestureRecognizer(swipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareForNextSwipe() {
        //originView = destinationView
        destinationView = nil
    }
    
    func swipeCard(_ sender: UISwipeGestureRecognizer) {
        print("swipe gesture detected")
        let transition = UIViewAnimationOptions.curveEaseOut
        var indexOfDestinationView: Int?
        let indexOfOriginView = cardContainerView.subviews.index(of: originView!)
        
        if !cardContainerView.subviews.isEmpty {
            if indexOfOriginView != nil {
                indexOfDestinationView = indexOfOriginView!-1
            } else {
                indexOfDestinationView = cardContainerView.subviews.startIndex
            }
                
            if indexOfDestinationView! >= cardContainerView.subviews.count {
                indexOfDestinationView = cardContainerView.subviews.startIndex
            }
            
            if indexOfDestinationView! < cardContainerView.subviews.startIndex {
                indexOfDestinationView = cardContainerView.subviews.count-1
            }
                
            destinationView = cardContainerView.subviews[indexOfDestinationView!] as? UIImageView
            
            print("origin index = \(String(describing: indexOfOriginView!)), destination index = \(String(describing: indexOfDestinationView!))")
            
            UIView.transition(from: originView!, to: destinationView!, duration: 1.0, options: transition, completion: { finised in
                self.originView = self.destinationView
                self.prepareForNextSwipe()
                
            })
        } else {
            print("cardContainerView.subviews array is empty by accident")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
