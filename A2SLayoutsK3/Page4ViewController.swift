//
//  Page4ViewController.swift
//  A2SLayoutsK3
//
//  Created by Jakkawad Chaiplee on 6/3/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import MapleBacon
import Alamofire
import SwiftyJSON

class Page4ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page4Cell0TableViewCell
        let dummyImageURL = NSURL(string: dummyImage("100x100"))
        let dummyImageURL2 = NSURL(string: dummyImage("375x110"))
        cell0?.imageViewCover.setImageWithURL(dummyImageURL2!)
        cell0?.imageViewProfile.setImageWithURL(dummyImageURL!)
        return cell0!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 180
        } else {
            return 180
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
