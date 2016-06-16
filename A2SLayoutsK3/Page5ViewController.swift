//
//  Page5ViewController.swift
//  A2SLayoutsK3
//
//  Created by Jakkawad Chaiplee on 6/3/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Page5ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return 3
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 3
        /*
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 4
        } else {
            return 1
        }
        */
        //return 2
        if section == 0 {
            return 2
        } else {
            return 2
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0)
        
        return cell0!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("first", sender: self)
            break
        case 1:
            self.performSegueWithIdentifier("second", sender: self)
            break
        default:
            break
        }
        */
        if indexPath.section == 0 {
            print("DDD")
            if indexPath.row == 0 {
                self.performSegueWithIdentifier("first", sender: self)
            } else {
                self.performSegueWithIdentifier("second", sender: self)
            }
        } else {
            print("CCC")
            if indexPath.row == 0 {
                self.performSegueWithIdentifier("third", sender: self)
            } else {
                self.performSegueWithIdentifier("fourth", sender: self)
            }
        }
    }
    
    
    
    /*
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Setting User"
        } else if section == 1 {
            return "Customer Support"
        } else if section == 2 {
            return "About"
        } else {
            return "Other Product"
        }
    }
    */
    /*
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBar.barTintColor = UIColor(red: 16/255, green: 132/255, blue: 142/255, alpha: 1.0)
        self.title = "Setting"
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
