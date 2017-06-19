//
//  SwipeVC.swift
//  gestureRecognizers
//
//  Created by Luthfi Fathur Rahman on 6/19/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class SwipeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeCard))
        swipe.numberOfTouchesRequired = 2
        swipe.direction = [.up, .down, .right, .left]
        view.addGestureRecognizer(swipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeCard(_ sender: UISwipeGestureRecognizer) {
        print("swipe gesture detected")
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
