//
//  UrgentPageViewController.swift
//  Hope-A-Thon
//
//  Created by Ferlix Yanto Wang on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

protocol UrgentDelegate: class {
    func urgentPageCount(urgentPageViewController: UrgentPageViewController,didUpdatePageCount count: Int)
    func urgentPageIndex(urgentPageViewController: UrgentPageViewController,didUpdatePageIndex index: Int)
}

class UrgentPageViewController: UIPageViewController {

    // MARK: - Variables
    weak var urgentDelegate: UrgentDelegate?
    
    lazy var vc : [UrgentViewController] = { () -> [UrgentViewController?] in
        var a = [UrgentViewController]()
        for i in 0...urgentActivities.count-1{
            a.append(getItemController(i)!)
        }
        return a
    }() as! [UrgentViewController]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        if urgentActivities.count > 0 {
            let firstController = getItemController(0)!
            let startingViewController = [firstController]
            
            setViewControllers(startingViewController, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        urgentDelegate?.urgentPageCount(urgentPageViewController: self, didUpdatePageCount: urgentActivities.count)
    }
    
    func getItemController (_ itemIndex: Int) -> UrgentViewController? {
        if itemIndex < urgentActivities.count{
            let pageItemController = self.storyboard?.instantiateViewController(withIdentifier: "itemController") as! UrgentViewController
            
            pageItemController.itemIndex = itemIndex
            pageItemController.image = urgentActivities[itemIndex].image
            return pageItemController
        }
        return nil
    }
}

extension UrgentPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! UrgentViewController
        if itemController.itemIndex > 0 {
            return vc[itemController.itemIndex-1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! UrgentViewController
        if itemController.itemIndex+1 < urgentActivities.count {
            return vc[itemController.itemIndex+1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first as? UrgentViewController,
            let index = vc.index(of: firstViewController) {
            urgentDelegate?.urgentPageIndex(urgentPageViewController: self, didUpdatePageIndex: index)
        }
    }
}
