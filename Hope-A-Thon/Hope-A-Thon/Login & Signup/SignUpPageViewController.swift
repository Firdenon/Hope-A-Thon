//
//  SignUpPageViewController.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpPageViewController: UIPageViewController {
    
    private var currentVCIndex: Int! = 0
    private(set) lazy var orderedViewControllers: [BaseSignUpViewController] = {
        // The view controllers will be shown in this order
        return [self.newSignUpViewController("Name"),
                self.newSignUpViewController("Email"),
                self.newSignUpViewController("Password"),
                self.newSignUpViewController("Gender"),
                self.newSignUpViewController("Birthdate")]
    }()
    
    private func newSignUpViewController(_ identifier: String) -> BaseSignUpViewController {
        return UIStoryboard(name: "SignIn", bundle: nil) .
            instantiateViewController(withIdentifier: "SignUp\(identifier)") as! BaseSignUpViewController
    }
    
    override var transitionStyle: UIPageViewControllerTransitionStyle {
        return .scroll
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        self.view.backgroundColor = #colorLiteral(red: 0.3102046847, green: 0.722851932, blue: 0.870384872, alpha: 1)
        
//        var appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
//        appearance.pageIndicatorTintColor = UIColor.red
//        appearance.currentPageIndicatorTintColor = UIColor.red
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(initialViewController)
        }
    }
    
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
            scrollToViewController(nextViewController)
        }
    }

    private func scrollToViewController(_ viewController: UIViewController) {
        setViewControllers([viewController],
                           direction: .forward,
                           animated: true,
                           completion: { (finished) -> Void in
                            // Setting the view controller programmatically does not fire
                            // any delegate methods, so we have to manually notify the
                            // 'tutorialDelegate' of the new index.
//                            self.notifyTutorialDelegateOfNewIndex()
        })
    }

}

extension SignUpPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let coloredViewController = viewController as? BaseSignUpViewController,
            let viewControllerIndex = orderedViewControllers.index(of: coloredViewController) else {
                return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
//            return orderedViewControllers.last
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let coloredViewController = viewController as? BaseSignUpViewController,
            let viewControllerIndex = orderedViewControllers.index(of: coloredViewController) else {
                return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
//        guard orderedViewControllersCount != nextIndex else {
//            return orderedViewControllers.first
//        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        print()
        return currentVCIndex
    }
}

extension SignUpPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
//        notifyTutorialDelegateOfNewIndex()
        currentVCIndex = previousViewControllers.count
    }
    
}
