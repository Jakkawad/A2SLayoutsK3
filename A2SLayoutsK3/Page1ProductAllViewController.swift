//
//  Page1ProductAllViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/2/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapleBacon

class Page1ProductAllViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var numberOfItemPerSection = 16
    
    var dataJSON = NSArray()
    
    func loadJSON() {
        Alamofire.request(.POST,"https://www.all2sale.com/sendmail/testfunction/json/apitest.php",parameters: ["api":"productall","productall":numberOfItemPerSection]).responseJSON { response in
            //print(response.result)
            self.dataJSON = response.result.value as! NSArray
            //print(self.dataJSON.description)
            self.collectionView.reloadData()
            
        }
    }
    

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 10
        //eturn self.dataJSON.count
        return numberOfItemPerSection
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1ProductAllCollectionViewCell
        let dummyImageURL = NSURL(string: dummyImage("176x176"))
        col0?.imageViewProduct.setImageWithURL(dummyImageURL!)
        col0?.lblProductName.text = dummyText()
        return col0!
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        //print("offsetY\(offsetY)")
        let contentHeight = scrollView.contentSize.height
        //print("contentHeight\(contentHeight)")
        //if offsetY > contentHeight - scrollView.frame.size.height {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) {
            numberOfItemPerSection += 9
            self.collectionView.reloadData()
            print("numberOfItemPerSection = \(numberOfItemPerSection)")
            
            /*
            loadJSON()
            if numberOfItemPerSection > 35 {
                print("5555")
                activityIndicator.startAnimating()
                let delay = 1 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue()) {
                    self.activityIndicator.stopAnimating()
                }
            } else {
                print("DDD")
            }
            */
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
