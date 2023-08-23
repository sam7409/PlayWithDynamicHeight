//
//  ViewController.swift
//  PlayWithDynamicHeight
//
//  Created by HIMANSHU SINGH on 23/08/23.
//

import UIKit
import IOS_CommonUtilSPM

class ViewController: UIViewController {

    @IBOutlet var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let dynamicVC = DynamicViewController(nibName: "DynamicViewController", bundle: nil)
        addChildVCneeshu(childViewController: dynamicVC , placeHolderView:bottomView)
 
//        self.view.layoutSubviews()
//        self.view.layoutIfNeeded()
        //addChildVCWithMultiplier(<#T##childViewController: UIViewController##UIViewController#>)
//        dynamicVC.view.translatesAutoresizingMaskIntoConstraints = false // Important: Disable autoresizing mask translation
//
//        // Add leading and trailing constraints
//        let leadingConstraint = dynamicVC.view.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor)
//        let trailingConstraint = dynamicVC.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
//
//        // Activate the constraints
//        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint])
//
//        // You might also want to add other constraints to properly position the view, such as top and bottom constraints.
//        // For example:
//        let topConstraint = dynamicVC.view.topAnchor.constraint(equalTo: bottomView.topAnchor)
//        let bottomConstraint = dynamicVC.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor)
//        NSLayoutConstraint.activate([topConstraint, bottomConstraint])
    }


}


extension UIViewController {
    func addChildVCneeshu(childViewController:UIViewController , placeHolderView: UIView) {
        let childView = childViewController.view.subviews.first!
        let view: UIView = placeHolderView
        childViewController.removeFromParent()
        childViewController.willMove(toParent: self)
        childViewController.view.backgroundColor = .purple
        addChild(childViewController)
        childViewController.didMove(toParent: self)
        childView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childView)
        
        let hCon =  NSLayoutConstraint(item: childView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        hCon.priority = UILayoutPriority(150)
        
//        let heightConstraint = NSLayoutConstraint(
//                  item: childViewController.view!,
//                  attribute: .height,
//                  relatedBy: .equal,
//                  toItem: view,
//                  attribute: .notAnAttribute,
//                  multiplier: 1.0,
//                  constant: 100 // Set your desired constant height here
//              )
//        heightConstraint.priority = UILayoutPriority(150)
        
        view.addConstraints([

            NSLayoutConstraint(item: childView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: childView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: childView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
                            ])
        
        NSLayoutConstraint.activate([hCon])
    }
}
