//
//  RotateVC.swift
//  gestureRecognizers
//
//  Created by Luthfi Fathur Rahman on 6/20/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class RotateVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btn_reset: UIBarButtonItem!
    
    let _90degree: CGFloat = 3.14159
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateCard))
        view.addGestureRecognizer(rotate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotateCard(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
    }

    @IBAction func btn_reset(_ sender: UIBarButtonItem) {
        let currAngle = atan2f(Float(imageView.transform.b), Float(imageView.transform.a))
        imageView.transform = imageView.transform.rotated(by: _90degree-CGFloat(currAngle))
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
