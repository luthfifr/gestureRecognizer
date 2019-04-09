//
//  MultiGesturesVC.swift
//  gestureRecognizers
//
//  Created by Luthfi Fathur Rahman on 6/21/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class MultiGesturesVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btn_reset: UIBarButtonItem!
    
    var oriImageViewWidth: CGFloat?
    var oriImageViewHeight: CGFloat?
    var oriImageViewSize: CGFloat?
    var oriImageViewBounds: CGRect?
    var maxscale: CGFloat?
    var lastImageWidth: CGFloat?
    var lastImageHeight: CGFloat?
    let minImageWidth: CGFloat = 22.8332872338159
    let minImageHeight: CGFloat = 23.1588330013989
    let _180degree: CGFloat = 3.14159
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oriImageViewBounds = imageView.bounds
        oriImageViewWidth = imageView.frame.size.width
        oriImageViewHeight = imageView.frame.size.height
        oriImageViewSize = oriImageViewWidth!*oriImageViewHeight!
        lastImageWidth = oriImageViewWidth
        lastImageHeight = oriImageViewHeight
        maxscale = (view.frame.size.width*view.frame.size.height)/oriImageViewSize!

        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchCard))
        view.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateCard))
        view.addGestureRecognizer(rotate)
        
        pinch.delegate = self
        rotate.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if (gestureRecognizer is UIPinchGestureRecognizer || gestureRecognizer is UIRotationGestureRecognizer) {
            return true
        } else {
            return false
        }
    }
    
    @objc func pinchCard(_ sender: UIPinchGestureRecognizer) {
        var scale = sender.scale*0.05
        let velocity = sender.velocity
        var currImageWidth = imageView.frame.size.width
        var currImageHeight = imageView.frame.size.height
        
        if scale > maxscale! {
            scale = maxscale!
        }
        
        if velocity < 0 {
            currImageWidth -= (lastImageWidth!*scale)
            currImageHeight -= (lastImageHeight!*scale)
        } else {
            currImageWidth += (lastImageWidth!*scale)
            currImageHeight += (lastImageHeight!*scale)
        }
        
        if currImageWidth < minImageWidth && currImageHeight < minImageHeight {
            currImageWidth = minImageWidth
            currImageHeight = minImageHeight
        }
        
        if currImageWidth > view.frame.size.width && currImageHeight > view.frame.size.height {
            currImageWidth = view.frame.size.width
            currImageHeight = view.frame.size.height
        }
        
        imageView.frame.size.width = currImageWidth
        imageView.frame.size.height = currImageHeight
        
        lastImageWidth = imageView.frame.size.width
        lastImageHeight = imageView.frame.size.height
        
        imageView.center = view.center
        
    }
    
    @objc func rotateCard(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
    }
    
    @IBAction func btn_reset(_ sender: Any) {
        imageView.bounds = oriImageViewBounds!
        
        let currAngle = atan2f(Float(imageView.transform.b), Float(imageView.transform.a))
        imageView.transform = imageView.transform.rotated(by: _180degree-CGFloat(currAngle))
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
