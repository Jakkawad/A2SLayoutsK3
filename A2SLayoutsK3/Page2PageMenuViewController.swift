//
//  Page2PageMenuViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/14/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import PageMenu

class Page2PageMenuViewController: UIViewController {

    var pageMenu:CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "PAGE MENU"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 18/255.0, green: 137/255.0, blue: 142/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.orangeColor()]
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var controllerArray:[UIViewController] = []
        let controller1 = mainStoryboard.instantiateViewControllerWithIdentifier("Menu1Story")
        controller1.title = "Menu1"
        controllerArray.append(controller1)
        
        let controller2 = mainStoryboard.instantiateViewControllerWithIdentifier("Menu2Story")
        controller2.title = "Menu2"
        controllerArray.append(controller2)
        
        let parameters:[CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 18/255.0, green: 137/255.0, blue: 142/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .MenuHeight(40.0),
            .MenuItemWidth(50.0),
            .CenterMenuItems(true)
        ]
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)

        
        // Do any additional setup after loading the view.
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

}
