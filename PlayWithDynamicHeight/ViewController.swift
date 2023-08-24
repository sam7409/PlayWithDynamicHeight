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
    @IBOutlet var mainView: UIView!
    var currentVC : UIViewController?
    var customTabBarController = UITabBarController ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        
    }
    
  
    override func viewDidAppear(_ animated: Bool) {
        //setupTabBarController()
    }
//    func dynamicViewOne(){
//        let dynamicVCOne = DynamicViewController(nibName: "DynamicViewController", bundle: nil)
//        currentVC = dynamicVCOne
//        // Add the child view controller to the parent view controller
//        addChild(dynamicVCOne)
//        bottomView.addSubview(dynamicVCOne.view)
//        dynamicVCOne.didMove(toParent: self)
//
//        // Set up constraints
//        dynamicVCOne.view.translatesAutoresizingMaskIntoConstraints = false
//        let topConstraintLowPriority = dynamicVCOne.view.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10)
//        topConstraintLowPriority.priority = UILayoutPriority(250)
//        topConstraintLowPriority.isActive = true
//
//        NSLayoutConstraint.activate([
//            dynamicVCOne.view.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 10),
//            dynamicVCOne.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: -10),
//            dynamicVCOne.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -10),
//        ])
//    }
//
//    func dynamicViewTwo(){
//        let dynamicVCTwo = SecondDynamicViewController(nibName: "SecondDynamicViewController", bundle: nil)
//        currentVC = dynamicVCTwo
//        // Add the child view controller to the parent view controller
//        addChild(dynamicVCTwo)
//        bottomView.addSubview(dynamicVCTwo.view)
//        dynamicVCTwo.didMove(toParent: self)
//
//        // Set up constraints
//        dynamicVCTwo.view.translatesAutoresizingMaskIntoConstraints = false
//        let topConstraintLowPriority = dynamicVCTwo.view.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10)
//        topConstraintLowPriority.priority = UILayoutPriority(250)
//        topConstraintLowPriority.isActive = true
//
//        NSLayoutConstraint.activate([
//            dynamicVCTwo.view.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 10),
//            dynamicVCTwo.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: -10),
//            dynamicVCTwo.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -10),
//        ])
//    }
//
//    func dynamicViewThree(){
//        let dynamicVCThree = ThirdDynamicViewController(nibName: "ThirdDynamicViewController", bundle: nil)
//        currentVC = dynamicVCThree
//        // Add the child view controller to the parent view controller
//        addChild(dynamicVCThree)
//        bottomView.addSubview(dynamicVCThree.view)
//        dynamicVCThree.didMove(toParent: self)
//
//        // Set up constraints
//        dynamicVCThree.view.translatesAutoresizingMaskIntoConstraints = false
//
//        let topConstraintLowPriority = dynamicVCThree.view.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10)
//        topConstraintLowPriority.priority = UILayoutPriority(250)
//        topConstraintLowPriority.isActive = true
//
//        NSLayoutConstraint.activate([
//            dynamicVCThree.view.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 10),
//            dynamicVCThree.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: -10),
//            dynamicVCThree.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -10),
//        ])
//    }
    
    func setupTabBarController() {
       
        customTabBarController.delegate = self

        let dynamicVCOne = DynamicViewController(nibName: "DynamicViewController", bundle: nil)
        let dynamicVCTwo = SecondDynamicViewController(nibName: "SecondDynamicViewController", bundle: nil)
        let dynamicVCThree = ThirdDynamicViewController(nibName: "ThirdDynamicViewController", bundle: nil)

       
        
        // Create UITabBarItem instances and assign them to view controllers
        dynamicVCOne.tabBarItem = UITabBarItem(title: "One", image: nil, tag: 0)
        dynamicVCTwo.tabBarItem = UITabBarItem(title: "Two", image: nil, tag: 1)
        dynamicVCThree.tabBarItem = UITabBarItem(title: "Three", image: nil,  tag: 2)

        // Set the view controllers for the tab bar controller
        customTabBarController.viewControllers = [dynamicVCOne, dynamicVCTwo, dynamicVCThree]
        addChild(customTabBarController)
        bottomView.addSubview(customTabBarController.view)
        customTabBarController.tabBar.backgroundColor = .white
        // Set the tab bar controller's view to use Auto Layout
         customTabBarController.view.translatesAutoresizingMaskIntoConstraints = false
          // Add constraints
        let topConstraintLowPriority = customTabBarController.view.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 10)
         topConstraintLowPriority.priority = UILayoutPriority(200)
         topConstraintLowPriority.isActive = true
        
        NSLayoutConstraint.activate([
            customTabBarController.view.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 10),
            customTabBarController.view.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: -10),
            customTabBarController.view.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -10),
            ])
        let selectedChildView = customTabBarController.viewControllers?[0]
        if let childView = selectedChildView {
            tabBarController(customTabBarController, didSelect: childView)
        }
        customTabBarController.didMove(toParent: self)
    }



//    func removeView(current : UIViewController){
//        // Remove the child view controller from the parent view controller
//        current.willMove(toParent: nil)
//        current.view.removeFromSuperview()
////        current.removeFromParent()
//    }

}

extension ViewController: UITabBarControllerDelegate {
    func tabBarController(_ customTabBarController: UITabBarController, didSelect viewController: UIViewController) {
   
        // Ensure that the selected view controller is in the tab bar's view controllers
             guard let selectedIndex = customTabBarController.viewControllers?.firstIndex(of: viewController) else {
                 return
             }
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
   
        viewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            viewController.view.leadingAnchor.constraint(equalTo: customTabBarController.view.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: customTabBarController.view.trailingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: customTabBarController.view.bottomAnchor)
        ])
        
        UIView.animate(withDuration: 1.0, delay: 0) {
            let topConstraintLowPriority = viewController.view.topAnchor.constraint(equalTo: customTabBarController.view.topAnchor)
            topConstraintLowPriority.priority = UILayoutPriority(250)
            topConstraintLowPriority.isActive = true
           
        }
    }
}



/*
 
 View 300 - 300
 
 textView - 200 ( p = 200 )
 textView - Vertical Hugging
 
 HorzontalHugging
 
 [ Done See Ya Later  ]
 
 
 Hugging , Compression
 
 TextView Title , Subtitle
 
 
 UIVIew - Height
 
 
 
 */
