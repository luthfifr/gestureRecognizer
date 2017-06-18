//
//  TapVC.swift
//  gestureRecognizers
//
//  Created by Luthfi Fathur Rahman on 6/19/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class TapVC: UIViewController {

    @IBOutlet weak var cardContainerView: UIView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var label_tapCount: UILabel!
    
    var originView: UIImageView?
    var destinationView: UIImageView?
    
    private var backcardFlag = true
    private var tapcounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label_tapCount.text = String(describing: tapcounter)
        label_tapCount.sizeToFit()
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        cardContainerView.addGestureRecognizer(singleTap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareForNextFlip() {
        originView = nil
        destinationView = nil
    }
    
    func flipCard(_ sender: UITapGestureRecognizer){
        tapcounter += 1
        label_tapCount.text = String(describing: tapcounter)
        label_tapCount.sizeToFit()
        
        var transition = UIViewAnimationOptions.transitionFlipFromLeft
        
        while originView == nil || destinationView == nil {
            originView = backcardFlag ? backImageView : frontImageView
            destinationView = backcardFlag ? frontImageView : backImageView
            transition = backcardFlag ? UIViewAnimationOptions.transitionFlipFromLeft : UIViewAnimationOptions.transitionFlipFromRight
        }
        
        UIView.transition(from: originView!, to: destinationView!, duration: 1.0, options: [transition, .showHideTransitionViews], completion: { finised in
            
                self.backcardFlag = !self.backcardFlag
                self.prepareForNextFlip()
        
        })
    }

    @IBAction func btn_resetTap(_ sender: UIButton) {
        tapcounter = 0
        label_tapCount.text = String(describing: tapcounter)
        label_tapCount.sizeToFit()
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
