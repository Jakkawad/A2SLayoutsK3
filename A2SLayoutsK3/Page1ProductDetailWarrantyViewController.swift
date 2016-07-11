//
//  Page1ProductDetailWarrantyViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 7/11/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Page1ProductDetailWarrantyViewController: ViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var productDetail:ProductRands?
    
    func loadWeb() {
        //let a12 = productDetail!.productId!
        let productId = productDetail!.productId!
        print(productId)
        let url = NSURL(string: "http://rest.all2sale.com/api_mobile_get.php?api=productid&productid="+productId+"&value=ProductClaim&html=yes")
        print(url)
        //let url = NSURL(string: "http://rest.all2sale.com/api_mobile_get.php?api=productid&productid="+id_product+"&value=ProductClaim&html=yes")
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
