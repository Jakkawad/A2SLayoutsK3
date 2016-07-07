//
//  Page1SearchViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 7/5/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import SideMenu
import MapleBacon

class Page1SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView:UICollectionView!
    
    
    //var searchBar:UISearchBar = UISearchBar()
    let searchController = UISearchController(searchResultsController: nil)
    
    func searchBarOnTableView() {
        //searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        //collectionView.tableHeaderView = searchController.searchBar
        //navigationItem.titleView = searchController.searchBar
        
        //tableView.setContentOffset(CGPoint(x: 0, y: searchController.searchBar.frame.size.height), animated: false)
        
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1SearchFilterCell0CollectionViewCell
        col0!.imageViewProduct.setImageWithURL(NSURL(string: dummyImage("176x176"))!)
        return col0!
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSideMenu()
        
        /*
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        navigationItem.titleView = searchController.searchBar
        */
        /*
        searchBar.placeholder = "Enter Keyword"
        //searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSideMenu() {
        let menuRightNavigationController = UISideMenuNavigationController()
        SideMenuManager.menuRightNavigationController = menuRightNavigationController
        
    }

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        
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
/*
extension Page1SearchViewController: UISearchBarDelegate {
    // MARK: UISearchBar Delegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension Page1SearchViewController: UISearchResultsUpdating {
    // MARK: UISearchResultsUpdating Delegate
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}
*/