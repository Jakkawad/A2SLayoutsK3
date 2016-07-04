//
//  Page5ViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 5/31/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Page1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
        let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
        return cell0!
        */
        if indexPath.row == 0 {
            let cellMenu0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.menuCell0) as? Page1CellMenu0TableViewCell
            let dummyImageURL = NSURL(string: dummyImage("200x100"))
            cellMenu0?.imageViewBanner.setImageWithURL(dummyImageURL!)
            return cellMenu0!
        } else if indexPath.row == 1 {
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1Cell0TableViewCell
            return cell0!
        } else if indexPath.row == 2 {
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1) as? Page1Cell1TableViewCell
            return cell1!
        } else {
            let cell2 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell2) as? Page1Cell2TableViewCell
            return cell2!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120
        } else if indexPath.row == 1 {
            return 224
        } else if indexPath.row == 2 {
            return 224
        } else {
            return 1000
        }
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductDetailSegue1" {
            print("ProductDetailSegue1")
            
        } else {
            "Error"
        }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.navigationBar.barTintColor = UIColor(red: 16/255, green: 132/255, blue: 142/255, alpha: 1.0)
        self.title = "All2Sale"
        
        //UIApplication.sharedApplication().applicationIconBadgeNumber = 1
        /*
        tabBarController?.tabBar.items?[4].badgeValue = "1"
        tabBarController?.tabBar.items?.first?.badgeValue = "2nd"
        */
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
