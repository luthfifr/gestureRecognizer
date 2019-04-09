//
//  LongPressVC.swift
//  gestureRecognizers
//
//  Created by Luthfi Fathur Rahman on 6/21/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class LongPressVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction))
        longPress.minimumPressDuration = 1
        view.addGestureRecognizer(longPress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func longPressAction(_ sender: UILongPressGestureRecognizer){
        if !view.subviews.isEmpty {
            view.subviews.forEach({$0.removeFromSuperview()})
        }
        let location = sender.location(in: self.view)
        let pressLocation = UIView.init(frame: CGRect(x: location.x, y: location.y, width: 100, height: 100))
        pressLocation.layer.cornerRadius = pressLocation.frame.width/2
        pressLocation.backgroundColor = UIColor.black
        view.addSubview(pressLocation)
    
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
