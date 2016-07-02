//
//  Page1ProductDetailProductDetailViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 7/2/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Page1ProductDetailProductDetailViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var productDetail:ProductRands?
    //var a12 = productDetail.productId
    
    func loadWeb() {
        //let a12 = productDetail!.productId!
        //print(productDetail?.productId)
        //let string = String(a12)
        let url = NSURL(string: "http://rest.all2sale.com/api_mobile_get.php?api=productid&productid=1003&value=ProductDescription%2CProductOther&html=yes")
        //let url = NSURL(string: "http://rest.all2sale.com/api_mobile_get.php?api=productid&productid="+string+"&value=ProductDescription%2CProductOther&html=yes")
        //print(url)
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWeb()
        
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
