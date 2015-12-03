//
//  PlayerViewController.swift
//  scorer
//
//  Created by Jacob Kohn on 12/2/15.
//  Copyright © 2015 Jacob Kohn. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class PlayerViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var tableCollectionView: UICollectionView!
    var games = [NSManagedObject]()
    var players = [NSManagedObject]()
    var game = Int()
    var player = Int()
    
    
    
    let NathanHale = ["Sam Leach","Sam Nasralla","Julien Streetman","Ishmael Simpson", "Trey McAdams","Stieg Smith", "TJ Williams","Dempsey Hope","Kateel Barnett","Malcolm Gulyard","Khepra Mims"]
    let backButton = UIButton()
    let forwardButton = UIButton()
    let boxScoreButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playerNameLabel.text = players[player].valueForKey("name") as! String
        
        makeButtons()
        
        tableCollectionView.dataSource = self
        
        
    }
    
    func makeButtons() {
        
        let blue = UIColor(red:0.0, green:0.0, blue:0.5, alpha:1.0)
        
        backButton.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width / 4, 44)
        backButton.addTarget(self, action: "previous:", forControlEvents: UIControlEvents.TouchUpInside)
        backButton.setTitle("Home", forState: UIControlState.Normal)
        backButton.backgroundColor = blue
        backButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(backButton)
        
        boxScoreButton.frame = CGRectMake(self.view.frame.size.width / 4, self.view.frame.size.height - 44, self.view.frame.size.width / 2, 44)
        boxScoreButton.addTarget(self, action: "backToBoxScore:", forControlEvents: UIControlEvents.TouchUpInside)
        boxScoreButton.setTitle("Return to Player List", forState: UIControlState.Normal)
        boxScoreButton.backgroundColor = UIColor.redColor()
        boxScoreButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(boxScoreButton)
        
        forwardButton.frame = CGRectMake((self.view.frame.size.width / 4) * 3, self.view.frame.size.height - 44, self.view.frame.size.width / 4, 44)
        forwardButton.addTarget(self, action: "next:", forControlEvents: UIControlEvents.TouchUpInside)
        forwardButton.setTitle("Home", forState: UIControlState.Normal)
        forwardButton.backgroundColor = blue
        forwardButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(forwardButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backToBoxScore(sender: UIButton) {
        performSegueWithIdentifier("backToBox", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "backToBox") {
            
            let controller = segue.destinationViewController as! BoxScoreViewController
            controller.game = game
            controller.players = players
        }
    }
    
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TextCell", forIndexPath: indexPath) as! TextCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.textLabel.text = self.items[indexPath.item] as! String
        cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
}
