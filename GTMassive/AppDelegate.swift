//
//  AppDelegate.swift
//  GTMassive
//
//  Created by KEEVIN MITCHELL on 4/21/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let slideNav = SlideNavigationController()
    
    struct SlideNav{
        static let DidClose = "DidClose"
        static let DidOpen = "DidOpen"
        static let DidReveal = "DidReveal"
    }




    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Parse.setApplicationId("lywnNYHsHEgkUM0svF4YpkF1XlDRSDJw5kDJpO5p", clientKey: "df4SJ4mkKwbkCUySMgsJM8hrEMJG71ZbQ58anskm")
        
//        var tableVC:GTMassiveTimeline = GTMassiveTimeline(className: "Cat")
//        tableVC.title = "GT"
        
        
        
        
        
        //UINavigationBar.appearance().tintColor = UIColor(red: 0.05, green: 0.47, blue: 0.91, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.05, green: 0.47, blue: 0.91, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        

        
        
        
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let leftMenu = mainStoryBoard.instantiateViewControllerWithIdentifier("LeftMenuViewController")as! LeftMenuViewController
        let rightMenu = mainStoryBoard.instantiateViewControllerWithIdentifier("RightMenuViewController")as! RightMenuViewController
        
        
        SlideNavigationController.sharedInstance().rightMenu = rightMenu
        SlideNavigationController.sharedInstance().leftMenu = leftMenu
        
        
        
               let rightButton = UIButton(frame: CGRectMake(0, 0, 30, 30))
        let rightButtonImage = UIImage(named: "gear")
        
        rightButton.setImage(rightButtonImage, forState: UIControlState.Normal)
        rightButton.addTarget(SlideNavigationController.sharedInstance(), action: "toggleRightMenu", forControlEvents: UIControlEvents.TouchUpInside)
        let rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
         SlideNavigationController.sharedInstance().rightBarButtonItem = rightBarButtonItem
        
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        
        let closeNotification = NSNotification(name: SlideNavigationControllerDidClose, object: self, userInfo: nil)
        center.postNotification(closeNotification)
        
        
        let openNotification = NSNotification(name: SlideNavigationControllerDidOpen, object: self, userInfo: nil)
        center.postNotification(openNotification)
        
        let revealNotification = NSNotification(name: SlideNavigationControllerDidReveal, object: self, userInfo: nil)
        center.postNotification(revealNotification)

        
        
        
//        NSNotificationCenter.defaultCenter().addObserverForName(SlideNavigationControllerDidOpen, object: nil, queue: queue) { (note:NSNotification) -> Void in
//            
//            let menu:NString = note.userInfo["menu"]
//          //  println("Opened"\(menu))
//            
//        }

 
        
        
        
        
        
        
        
      //  var navigationVC:UINavigationController = UINavigationController(rootViewController: tableVC)
        
//        var navigationVC:SlideNavigationController = SlideNavigationController(rootViewController: tableVC)
//        
//        let frame = UIScreen.mainScreen().bounds
//        window = UIWindow(frame: frame)
//        
//        window!.rootViewController = navigationVC
//        window!.makeKeyAndVisible()
        
       // return true
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

