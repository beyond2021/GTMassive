//
//  MainViewController.swift
//  GTMassive
//
//  Created by KEEVIN MITCHELL on 4/23/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  var swappers = [UIViewController]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // last wild dance with the automatic name-finding
        self.swappers += [GTMassiveTimeline(nibName:nil, bundle:nil)]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tableVC:GTMassiveTimeline = GTMassiveTimeline(className: "Cat")
        
//                 self.swappers.append(self.childViewControllers[0] as! UIViewController)        // Do any additional setup after loading the view.
        
        self.addChildViewController(tableVC)
        self.view.addSubview(tableVC.view)
        tableVC.didMoveToParentViewController(self)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//    private func displayControllerViewController()
//    {
//        addChildViewController(swappers)
//        _collectionViewController.view.frame = CGRectMake(100, 0, 500, 500)
//        self.view.addSubview(_collectionViewController.view)
//        _collectionViewController.didMoveToParentViewController(self)
//    }
    
    
}
