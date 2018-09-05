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
        
        urgentActivities.append(Activity(title: "BANJIR NTT", date: "31/09/2018 - 27/10/2018", location: "NTT", ngo: "Stay.org", image: #imageLiteral(resourceName: "banjirntt"), bookmark: true))
        urgentActivities.append(Activity(title: "KEBAKARAN GILI LAWA", date: "28/08/2017 - 29/10/2019", location: "Pulau Komodo", ngo: "The Helper", image: #imageLiteral(resourceName: "kebakarangililawa"), bookmark: false))
        urgentActivities.append(Activity(title: "PEDULI LOMBOK", date: "27/09/2018 - 30/09/2018", location: "Lombok", ngo: "HOPE", image: #imageLiteral(resourceName: "gempalombok"), bookmark: false))
        
        
        delegate = self
        dataSource = self
        
        if urgentActivities.count > 0 {
            let firstController = getItemController(0)!
            let startingViewController = [firstController]
            
            setViewControllers(startingViewController, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        urgentDelegate?.urgentPageCount(urgentPageViewController: self, didUpdatePageCount: urgentActivities.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        if urgentActivities[itemIndex].bookmark == true{
//            bookmarkButton.setImage(#imageLiteral(resourceName: "starActive"), for: .normal)
//        }
//        else{
//            bookmarkButton.setImage(#imageLiteral(resourceName: "starNot"), for: .normal)
//        }
    }
    
    func getItemController (_ itemIndex: Int) -> UrgentViewController? {
        if itemIndex < urgentActivities.count{
            let pageItemController = self.storyboard?.instantiateViewController(withIdentifier: "itemController") as! UrgentViewController
            
            print(urgentActivities[itemIndex])
            pageItemController.itemIndex = itemIndex
            pageItemController.image = urgentActivities[itemIndex].image
            pageItemController.titleActivity = urgentActivities[itemIndex].title
            pageItemController.ngo = urgentActivities[itemIndex].ngo
            pageItemController.date = urgentActivities[itemIndex].date
            pageItemController.location = urgentActivities[itemIndex].location
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
