//
//  FeedViewController.swift
//  DealOn
//
//  Created by Akkshay Khoslaa on 3/13/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import UIKit
import Parse
class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    var dealObjects = Array<PFObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        feedCollectionView.backgroundColor = Constants.backgroundGrayColor
        
        getDeals()

    }
    
    func getDeals() {
        var query = PFQuery(className:"Deals")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    self.dealObjects = objects
                    self.feedCollectionView.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Return the number of items per section of the collectionview, meaning the number of deals that the database got
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dealObjects.count
    }
    
    
    //Set the insets of the collectionview
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 6, 0, 6)
    }
    
    
    //Return the size of the cell based on the screensize using CGSizeMake()
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(UIScreen.mainScreen().bounds.width - 12 , 220)
    }
    
    //Return the number of sections in the collectionview, 1 for our case
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Dequeue the cell and customize it. Then return it.
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = feedCollectionView.dequeueReusableCellWithReuseIdentifier("dealCell", forIndexPath: indexPath) as! FeedCollectionViewCell
        
        
        cell.dealDescriptionLabel.text = dealObjects[indexPath.row]["description"] as! String
        
        let dealImageFile = dealObjects[indexPath.row]["img"] as! PFFile
        dealImageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data:imageData)
                    cell.dealImageView.image = image
                }
            }
        }
        
        
        
        return cell
    }
    
    //This is what happens when a cell is selected
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
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
