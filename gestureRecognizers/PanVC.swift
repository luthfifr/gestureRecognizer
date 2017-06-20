//
//  PanVC.swift
//  gestureRecognizers
//
//  Created by Luthfi Fathur Rahman on 6/20/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class PanVC: UIViewController {

    @IBOutlet weak var objectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        objectView.layer.cornerRadius = 5
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pannedView))
        objectView.addGestureRecognizer(pan)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pannedView(_ sender: UIPanGestureRecognizer) {
        let newpoint = sender.location(in: self.view)//sender.translation(in: self.view)
        let newFrame = CGRect(x: newpoint.x, y: newpoint.y, width: objectView.frame.size.width, height: objectView.frame.size.height)
        objectView.frame = newFrame
        print(sender.velocity(in: self.view))
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
