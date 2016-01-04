//
//  ScoringViewController.swift
//  scorer
//
//  Created by Jacob Kohn on 11/30/15.
//  Copyright © 2015 Jacob Kohn. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ScoringViewController: UIViewController {
    
    var game = Int()
    
    var team = Int()
    var lineup = [String]()
    var bench = [String]()
    var games = [NSManagedObject]()
    var players = [NSManagedObject]()
    var firstTime = false
    
    let subButton = UIButton()
    let homeButton = UIButton()
    
    let name1 = UILabel()
    let name2 = UILabel()
    let name3 = UILabel()
    let name4 = UILabel()
    let name5 = UILabel()
    
    let madeft1 = UIButton()
    let madeft2 = UIButton()
    let madeft3 = UIButton()
    let madeft4 = UIButton()
    let madeft5 = UIButton()
    
    let missedft1 = UIButton()
    let missedft2 = UIButton()
    let missedft3 = UIButton()
    let missedft4 = UIButton()
    let missedft5 = UIButton()
    
    let twopm1 = UIButton()
    let twopm2 = UIButton()
    let twopm3 = UIButton()
    let twopm4 = UIButton()
    let twopm5 = UIButton()
    
    let threepm1 = UIButton()
    let threepm2 = UIButton()
    let threepm3 = UIButton()
    let threepm4 = UIButton()
    let threepm5 = UIButton()
    
    let assist1 = UIButton()
    let assist2 = UIButton()
    let assist3 = UIButton()
    let assist4 = UIButton()
    let assist5 = UIButton()
    
    let rebound1 = UIButton()
    let rebound2 = UIButton()
    let rebound3 = UIButton()
    let rebound4 = UIButton()
    let rebound5 = UIButton()
    
    let miss1 = UIButton()
    let miss2 = UIButton()
    let miss3 = UIButton()
    let miss4 = UIButton()
    let miss5 = UIButton()
    
    let steal1 = UIButton()
    let steal2 = UIButton()
    let steal3 = UIButton()
    let steal4 = UIButton()
    let steal5 = UIButton()
    
    let block1 = UIButton()
    let block2 = UIButton()
    let block3 = UIButton()
    let block4 = UIButton()
    let block5 = UIButton()
    
    let turnover1 = UIButton()
    let turnover2 = UIButton()
    let turnover3 = UIButton()
    let turnover4 = UIButton()
    let turnover5 = UIButton()
    
    
    func addNameLabels() {
    name1.frame = CGRectMake(0,0,self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6)
    name1.text = "Name:"
    name1.textAlignment = NSTextAlignment.Center
    self.view.addSubview(name1)
    
    
    name2.frame = CGRectMake(0,self.view.frame.size.height / 6,self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6)
    name2.text = "Name:"
    name2.textAlignment = NSTextAlignment.Center
    self.view.addSubview(name2)
    
    name3.frame = CGRectMake(0,self.view.frame.size.height / 6 * 2,self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6)
    name3.text = "Name:"
    name3.textAlignment = NSTextAlignment.Center
    self.view.addSubview(name3)
    
    name4.frame = CGRectMake(0,self.view.frame.size.height / 6 * 3,self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6)
    name4.text = "Name:"
    name4.textAlignment = NSTextAlignment.Center
    self.view.addSubview(name4)
    
    name5.frame = CGRectMake(0,self.view.frame.size.height / 6 * 4,self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6)
    name5.text = "Name:"
    name5.textAlignment = NSTextAlignment.Center
    self.view.addSubview(name5)
    }
    
    
    func addMadeFTButtons() {
        let blue = UIColor(red:0.0, green:0.225, blue: 1.0, alpha:1.0)
        
        
        madeft1.addTarget(self, action: "madeft:", forControlEvents: UIControlEvents.TouchUpInside)
        madeft1.frame = CGRectMake(self.view.frame.size.width / 7 * 2, 0, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        madeft1.setTitle("FT", forState: UIControlState.Normal)
        madeft1.backgroundColor = blue
        madeft1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        madeft1.tag = 0
        self.view.addSubview(madeft1)
        
        madeft2.addTarget(self, action: "madeft:", forControlEvents: UIControlEvents.TouchUpInside)
        madeft2.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        madeft2.setTitle("FT", forState: UIControlState.Normal)
        madeft2.backgroundColor = blue
        madeft2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        madeft2.tag = 1
        self.view.addSubview(madeft2)
        
        madeft3.addTarget(self, action: "madeft:", forControlEvents: UIControlEvents.TouchUpInside)
        madeft3.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        madeft3.setTitle("FT", forState: UIControlState.Normal)
        madeft3.backgroundColor = blue
        madeft3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        madeft3.tag = 2
        self.view.addSubview(madeft3)
        
        madeft4.addTarget(self, action: "madeft:", forControlEvents: UIControlEvents.TouchUpInside)
        madeft4.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        madeft4.setTitle("FT", forState: UIControlState.Normal)
        madeft4.backgroundColor = blue
        madeft4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        madeft4.tag = 3
        self.view.addSubview(madeft4)
        
        madeft5.addTarget(self, action: "madeft:", forControlEvents: UIControlEvents.TouchUpInside)
        madeft5.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        madeft5.setTitle("FT", forState: UIControlState.Normal)
        madeft5.backgroundColor = blue
        madeft5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        madeft5.tag = 4
        self.view.addSubview(madeft5)
    }
    
    
    func addMissedFTButtons() {
        let yellow = UIColor(red:1.0, green: 0.8, blue:0.0 , alpha:1.0)
        
        missedft1.addTarget(self, action: "missedft:", forControlEvents: UIControlEvents.TouchUpInside)
        missedft1.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.height / 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        missedft1.setTitle("MISS FT", forState: UIControlState.Normal)
        missedft1.backgroundColor = yellow
        missedft1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        missedft1.tag = 0
        self.view.addSubview(missedft1)
        
        missedft2.addTarget(self, action: "missedft:", forControlEvents: UIControlEvents.TouchUpInside)
        missedft2.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        missedft2.setTitle("MISS FT", forState: UIControlState.Normal)
        missedft2.backgroundColor = yellow
        missedft2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        missedft2.tag = 1
        self.view.addSubview(missedft2)
        
        missedft3.addTarget(self, action: "missedft:", forControlEvents: UIControlEvents.TouchUpInside)
        missedft3.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        missedft3.setTitle("MISS FT", forState: UIControlState.Normal)
        missedft3.backgroundColor = yellow
        missedft3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        missedft3.tag = 2
        self.view.addSubview(missedft3)
        
        missedft4.addTarget(self, action: "missedft:", forControlEvents: UIControlEvents.TouchUpInside)
        missedft4.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        missedft4.setTitle("MISS FT", forState: UIControlState.Normal)
        missedft4.backgroundColor = yellow
        missedft4.setTitleColor(UIColor.blackColor(), forState: .Normal)
        missedft4.tag = 3
        self.view.addSubview(missedft4)
        
        missedft5.addTarget(self, action: "missedft:", forControlEvents: UIControlEvents.TouchUpInside)
        missedft5.frame = CGRectMake(self.view.frame.size.width / 7 * 2, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        missedft5.setTitle("MISS FT", forState: UIControlState.Normal)
        missedft5.backgroundColor = yellow
        missedft5.setTitleColor(UIColor.blackColor(), forState: .Normal)
        missedft5.tag = 4
        self.view.addSubview(missedft5)
        
        
    }
    
    
    func addTwoPMButtons() {
        
        twopm1.addTarget(self, action: "made2ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm1.frame = CGRectMake(self.view.frame.size.width / 7 * 3, 0, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        twopm1.setTitle("2PM", forState: UIControlState.Normal)
        twopm1.backgroundColor = UIColor.greenColor()
        twopm1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        twopm1.tag = 0
        self.view.addSubview(twopm1)
        
        twopm2.addTarget(self, action: "made2ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm2.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        twopm2.setTitle("2PM", forState: UIControlState.Normal)
        twopm2.backgroundColor = UIColor.greenColor()
        twopm2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        twopm2.tag = 1
        self.view.addSubview(twopm2)
        
        twopm3.addTarget(self, action: "made2ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm3.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        twopm3.setTitle("2PM", forState: UIControlState.Normal)
        twopm3.backgroundColor = UIColor.greenColor()
        twopm3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        twopm3.tag = 2
        self.view.addSubview(twopm3)
        
        twopm4.addTarget(self, action: "made2ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm4.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        twopm4.setTitle("2PM", forState: UIControlState.Normal)
        twopm4.backgroundColor = UIColor.greenColor()
        twopm4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        twopm4.tag = 3
        self.view.addSubview(twopm4)
        
        twopm5.addTarget(self, action: "made2ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm5.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        twopm5.setTitle("2PM", forState: UIControlState.Normal)
        twopm5.backgroundColor = UIColor.greenColor()
        twopm5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        twopm5.tag = 4
        self.view.addSubview(twopm5)
        
        
        
    }
    
    func addThreePMButtons() {
        
        let pink = UIColor(red:1.0, green:0.1, blue:0.65, alpha:1.0)
        
        threepm1.addTarget(self, action: "made3ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm1.frame = CGRectMake(self.view.frame.size.width / 7 * 4, 0, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        threepm1.setTitle("3PM", forState: UIControlState.Normal)
        threepm1.backgroundColor = pink
        threepm1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        threepm1.tag = 0
        self.view.addSubview(threepm1)
        
        threepm2.addTarget(self, action: "made3ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm2.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        threepm2.setTitle("3PM", forState: UIControlState.Normal)
        threepm2.backgroundColor = pink
        threepm2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        threepm2.tag = 1
        self.view.addSubview(threepm2)
        
        
        threepm3.addTarget(self, action: "made3ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm3.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        threepm3.setTitle("3PM", forState: UIControlState.Normal)
        threepm3.backgroundColor = pink
        threepm3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        threepm3.tag = 2
        self.view.addSubview(threepm3)
        
        
        threepm4.addTarget(self, action: "made3ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm4.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        threepm4.setTitle("3PM", forState: UIControlState.Normal)
        threepm4.backgroundColor = pink
        threepm4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        threepm4.tag = 3
        self.view.addSubview(threepm4)
        
        
        threepm5.addTarget(self, action: "made3ptr:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm5.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        threepm5.setTitle("3PM", forState: UIControlState.Normal)
        threepm5.backgroundColor = pink
        threepm5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        threepm5.tag = 4
        self.view.addSubview(threepm5)
    }
    
    
    func addAssistButtons() {
        
        let blue = UIColor(red:0.12, green:0.54, blue:1.0, alpha:1.0)
        
        assist1.addTarget(self, action: "madeAssist:", forControlEvents: UIControlEvents.TouchUpInside)
        assist1.frame = CGRectMake(self.view.frame.size.width / 7 * 5, 0, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        assist1.setTitle("ASSIST", forState: UIControlState.Normal)
        assist1.backgroundColor = blue
        assist1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        assist1.tag = 0
        self.view.addSubview(assist1)
        
        assist2.addTarget(self, action: "madeAssist:", forControlEvents: UIControlEvents.TouchUpInside)
        assist2.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        assist2.setTitle("ASSIST", forState: UIControlState.Normal)
        assist2.backgroundColor = blue
        assist2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        assist2.tag = 1
        self.view.addSubview(assist2)
        
        assist3.addTarget(self, action: "madeAssist:", forControlEvents: UIControlEvents.TouchUpInside)
        assist3.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        assist3.setTitle("ASSIST", forState: UIControlState.Normal)
        assist3.backgroundColor = blue
        assist3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        assist3.tag = 2
        self.view.addSubview(assist3)
        
        assist4.addTarget(self, action: "madeAssist:", forControlEvents: UIControlEvents.TouchUpInside)
        assist4.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        assist4.setTitle("ASSIST", forState: UIControlState.Normal)
        assist4.backgroundColor = blue
        assist4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        assist4.tag = 3
        self.view.addSubview(assist4)
        
        assist5.addTarget(self, action: "madeAssist:", forControlEvents: UIControlEvents.TouchUpInside)
        assist5.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        assist5.setTitle("ASSIST", forState: UIControlState.Normal)
        assist5.backgroundColor = blue
        assist5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        assist5.tag = 4
        self.view.addSubview(assist5)
        
    }
    
    func addReboundButtons() {
        
        let red = UIColor(red:0.74, green:0.0, blue:0.0, alpha:1.0)
        
        rebound1.addTarget(self, action: "madeRebound:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound1.frame = CGRectMake(self.view.frame.size.width / 7 * 6,0, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        rebound1.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound1.backgroundColor = red
        rebound1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rebound1.tag = 0
        self.view.addSubview(rebound1)
        
        rebound2.addTarget(self, action: "madeRebound:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound2.frame = CGRectMake(self.view.frame.size.width / 7 * 6,self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        rebound2.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound2.backgroundColor = red
        rebound2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rebound2.tag = 1
        self.view.addSubview(rebound2)
        
        rebound3.addTarget(self, action: "madeRebound:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound3.frame = CGRectMake(self.view.frame.size.width / 7 * 6,self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        rebound3.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound3.backgroundColor = red
        rebound3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rebound3.tag = 2
        self.view.addSubview(rebound3)
        
        rebound4.addTarget(self, action: "madeRebound:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound4.frame = CGRectMake(self.view.frame.size.width / 7 * 6,self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        rebound4.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound4.backgroundColor = red
        rebound4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rebound4.tag = 3
        self.view.addSubview(rebound4)
        
        rebound5.addTarget(self, action: "madeRebound:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound5.frame = CGRectMake(self.view.frame.size.width / 7 * 6,self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        rebound5.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound5.backgroundColor = red
        rebound5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rebound5.tag = 4
        self.view.addSubview(rebound5)
        
    }
    
    
    
    func addMissButtons() {
        
        let gray = UIColor(red:0.35, green:0.35, blue:0.35, alpha:1.0)
        
        miss1.addTarget(self, action: "missedFG:", forControlEvents: UIControlEvents.TouchUpInside)
        miss1.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.height / 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        miss1.setTitle("MISS", forState: UIControlState.Normal)
        miss1.backgroundColor = gray
        miss1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        miss1.tag = 0
        self.view.addSubview(miss1)
        
        miss2.addTarget(self, action: "missedFG:", forControlEvents: UIControlEvents.TouchUpInside)
        miss2.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        miss2.setTitle("MISS", forState: UIControlState.Normal)
        miss2.backgroundColor = gray
        miss2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        miss2.tag = 1
        self.view.addSubview(miss2)
        
        miss3.addTarget(self, action: "missedFG:", forControlEvents: UIControlEvents.TouchUpInside)
        miss3.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        miss3.setTitle("MISS", forState: UIControlState.Normal)
        miss3.backgroundColor = gray
        miss3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        miss3.tag = 2
        self.view.addSubview(miss3)
        
        miss4.addTarget(self, action: "missedFG:", forControlEvents: UIControlEvents.TouchUpInside)
        miss4.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        miss4.setTitle("MISS", forState: UIControlState.Normal)
        miss4.backgroundColor = gray
        miss4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        miss4.tag = 3
        self.view.addSubview(miss4)
        
        miss5.addTarget(self, action: "missedFG:", forControlEvents: UIControlEvents.TouchUpInside)
        miss5.frame = CGRectMake(self.view.frame.size.width / 7 * 3, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        miss5.setTitle("MISS", forState: UIControlState.Normal)
        miss5.backgroundColor = gray
        miss5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        miss5.tag = 4
        self.view.addSubview(miss5)
        
    }
    
    func addStealButtons() {
        steal1.addTarget(self, action: "madeSteal:", forControlEvents: UIControlEvents.TouchUpInside)
        steal1.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.height / 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        steal1.setTitle("STEAL", forState: UIControlState.Normal)
        steal1.backgroundColor = UIColor.purpleColor()
        steal1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        steal1.tag = 0
        self.view.addSubview(steal1)
        
        steal2.addTarget(self, action: "madeSteal:", forControlEvents: UIControlEvents.TouchUpInside)
        steal2.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        steal2.setTitle("STEAL", forState: UIControlState.Normal)
        steal2.backgroundColor = UIColor.purpleColor()
        steal2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        steal2.tag = 1
        self.view.addSubview(steal2)
        
        steal3.addTarget(self, action: "madeSteal:", forControlEvents: UIControlEvents.TouchUpInside)
        steal3.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        steal3.setTitle("STEAL", forState: UIControlState.Normal)
        steal3.backgroundColor = UIColor.purpleColor()
        steal3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        steal3.tag = 2
        self.view.addSubview(steal3)
        
        steal4.addTarget(self, action: "madeSteal:", forControlEvents: UIControlEvents.TouchUpInside)
        steal4.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        steal4.setTitle("STEAL", forState: UIControlState.Normal)
        steal4.backgroundColor = UIColor.purpleColor()
        steal4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        steal4.tag = 3
        self.view.addSubview(steal4)
        
        steal5.addTarget(self, action: "madeSteal:", forControlEvents: UIControlEvents.TouchUpInside)
        steal5.frame = CGRectMake(self.view.frame.size.width / 7 * 4, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        steal5.setTitle("STEAL", forState: UIControlState.Normal)
        steal5.backgroundColor = UIColor.purpleColor()
        steal5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        steal5.tag = 4
        self.view.addSubview(steal5)
        
    }
    
    
    func addBlockButtons() {
        block1.addTarget(self, action: "madeBlock:", forControlEvents: UIControlEvents.TouchUpInside)
        block1.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.height / 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        block1.setTitle("BLOCK", forState: UIControlState.Normal)
        block1.backgroundColor = UIColor.orangeColor()
        block1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        block1.tag = 0
        self.view.addSubview(block1)
        
        block2.addTarget(self, action: "madeBlock:", forControlEvents: UIControlEvents.TouchUpInside)
        block2.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        block2.setTitle("BLOCK", forState: UIControlState.Normal)
        block2.backgroundColor = UIColor.orangeColor()
        block2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        block2.tag = 1
        self.view.addSubview(block2)
        
        block3.addTarget(self, action: "madeBlock:", forControlEvents: UIControlEvents.TouchUpInside)
        block3.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        block3.setTitle("BLOCK", forState: UIControlState.Normal)
        block3.backgroundColor = UIColor.orangeColor()
        block3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        block3.tag = 2
        self.view.addSubview(block3)
        
        block4.addTarget(self, action: "madeBlock:", forControlEvents: UIControlEvents.TouchUpInside)
        block4.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        block4.setTitle("BLOCK", forState: UIControlState.Normal)
        block4.backgroundColor = UIColor.orangeColor()
        block4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        block4.tag = 3
        self.view.addSubview(block4)
        
        block5.addTarget(self, action: "madeBlock:", forControlEvents: UIControlEvents.TouchUpInside)
        block5.frame = CGRectMake(self.view.frame.size.width / 7 * 5, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        block5.setTitle("BLOCK", forState: UIControlState.Normal)
        block5.backgroundColor = UIColor.orangeColor()
        block5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        block5.tag = 4
        self.view.addSubview(block5)
    }
    
    func addTurnoverButtons() {
        
        let blue = UIColor(red:0.0, green:0.0, blue:0.5, alpha:1.0)
        
        turnover1.addTarget(self, action: "madeTurnover:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover1.frame = CGRectMake(self.view.frame.size.width / 7 * 6, self.view.frame.height / 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        turnover1.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover1.backgroundColor = blue
        turnover1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        turnover1.tag = 0
        self.view.addSubview(turnover1)
        
        turnover2.addTarget(self, action: "madeTurnover:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover2.frame = CGRectMake(self.view.frame.size.width / 7 * 6, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        turnover2.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover2.backgroundColor = blue
        turnover2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        turnover2.tag = 1
        self.view.addSubview(turnover2)
        
        turnover3.addTarget(self, action: "madeTurnover:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover3.frame = CGRectMake(self.view.frame.size.width / 7 * 6, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        turnover3.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover3.backgroundColor = blue
        turnover3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        turnover3.tag = 2
        self.view.addSubview(turnover3)
        
        turnover4.addTarget(self, action: "madeTurnover:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover4.frame = CGRectMake(self.view.frame.size.width / 7 * 6, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        turnover4.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover4.backgroundColor = blue
        turnover4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        turnover4.tag = 3
        self.view.addSubview(turnover4)
        
        turnover5.addTarget(self, action: "madeTurnover:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover5.frame = CGRectMake(self.view.frame.size.width / 7 * 6, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 7) - 8, (self.view.frame.size.height / 12) - 4)
        turnover5.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover5.backgroundColor = blue
        turnover5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        turnover5.tag = 4
        self.view.addSubview(turnover5)
    }
    
    
    func createNewPlayers() {
        
    }
    
    func addSubButton() {
        subButton.addTarget(self, action: "goToSub:", forControlEvents: UIControlEvents.TouchUpInside)
        subButton.frame = CGRectMake(self.view.frame.size.width / 2, self.view.frame.height / 48 * 43, self.view.frame.size.width / 2, (self.view.frame.size.height / 48) * 5)
        subButton.setTitle("Substitutions", forState: UIControlState.Normal)
        subButton.backgroundColor = UIColor.blueColor()
        subButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(subButton)
        
        homeButton.addTarget(self, action: "returnHome:", forControlEvents: UIControlEvents.TouchUpInside)
        homeButton.frame = CGRectMake(0 , self.view.frame.height / 48 * 43, self.view.frame.size.width / 2, (self.view.frame.size.height / 48) * 5)
        homeButton.setTitle("Home", forState: UIControlState.Normal)
        homeButton.backgroundColor = UIColor.redColor()
        homeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(homeButton)
    }
    
    func goToSub(sender: UIButton) {
        performSegueWithIdentifier("subPlayers", sender: nil)
    }
    
    func returnHome(sender: UIButton) {
        performSegueWithIdentifier("scoringToHome", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:"Game")
        let error: NSError?
        var fetchedResults = [NSManagedObject]()
        do {
        fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
    } catch let error as NSError {
        
        print("Fetch failed: \(error.localizedDescription)")
        }
        games = fetchedResults
        
        
        let fetchReq = NSFetchRequest(entityName:"Player")
        let err: NSError?
        var fetchedR = [NSManagedObject]()
        do {
        fetchedR = try managedContext.executeFetchRequest(fetchReq) as! [NSManagedObject]
    } catch let err as NSError {
        
        print("Fetch failed: \(err.localizedDescription)")
        }
        players = fetchedR
        
        
        
        
        addNameLabels()
        addMissedFTButtons()
        addMadeFTButtons()
        addTwoPMButtons()
        addThreePMButtons()
        addAssistButtons()
        addReboundButtons()
        addMissButtons()
        addStealButtons()
        addBlockButtons()
        addTurnoverButtons()
        createNewPlayers()
        setNameLabels()
        addSubButton()
        
    }
    
    func setNameLabels() {
        var counter = 0
        let nameLabels = [name1, name2, name3, name4, name5]
        for(var i=0; i<players.count; i++) {
        if((players[i].valueForKey("inlineup") as! Bool)) {
        if((players[i].valueForKey("game") as! Int) == game) {
        nameLabels[counter].text = players[i].valueForKey("name") as! String
        lineup.append(players[i].valueForKey("name") as! String)
        counter++
        }
    } else {
        if(!(players[i].valueForKey("inlineup") as! Bool)) {
        bench.append(players[i].valueForKey("name") as! String)
        }
        }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if(firstTime == true) {
        let alert = UIAlertController(title: "Opponent", message: "", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
        
        })
        
        alert.addAction(UIAlertAction(title: "Done", style: .Default, handler: { (action) -> Void in
        let textField = alert.textFields![0]
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Game",
        inManagedObjectContext:
        managedContext)
        
        
        self.games[self.game].setValue(textField.text, forKey: "opponent")
        
        self.performSegueWithIdentifier("subPlayers", sender: nil)
        
        do {
        try managedContext.save()
    } catch _ {
        }
        
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "subPlayers" {
        
        let controller = segue.destinationViewController as! SubViewController
        
        controller.lineup = lineup
        controller.bench = bench
        controller.games = games
        controller.players = players
        controller.game = game
        controller.team = team
    } else if(segue.identifier == "scoringToHome") {
        let controller = segue.destinationViewController as! ViewController
        
        controller.team = team
        }
    }
    
    
    
    func made2ptr(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("twopointersmade") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "twopointersmade")
        do {
        try managedContext.save()
    } catch _ {
        }
        
    }
    
    
    func made3ptr(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        
        var value = players[playersIdx].valueForKey("threepointersmade") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "threepointersmade")
        do {
        try managedContext.save()
    } catch _ {
        }
        
    }
    
    
    func madeAssist(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("assists") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "assists")
        do {
        try managedContext.save()
    } catch _ {
        }
    }
    
    func madeRebound(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("rebounds") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "rebounds")
        do {
        try managedContext.save()
    } catch _ {
        }
    }
    
    func missedFG(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("missedshots") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "missedshots")
        do {
        try managedContext.save()
    } catch _ {
        }
    }
    
    func madeSteal(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("steals") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "steals")
        do {
        try managedContext.save()
    } catch _ {
        }
    }
    
    func madeBlock(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("blocks") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "blocks")
        do {
        try managedContext.save()
    } catch _ {
        }
    }
    
    func madeTurnover(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("turnovers") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "turnovers")
        do {
        try managedContext.save()
    } catch _ {
        }
    }
    
    func madeft(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("madefts") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "madefts")
        do {
        try managedContext.save()
    } catch _ {
        }
    }
    
    func missedft(sender: UIButton) {
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Player",
        inManagedObjectContext:
        managedContext)
        
        let playersIdx = searchPlayers(lineup[sender.tag])
        
        var value = players[playersIdx].valueForKey("missedfts") as! Int
        value++
        self.players[playersIdx].setValue(value, forKey: "missedfts")
        do {
        try managedContext.save()
    } catch _ {
        }
    }
    
    
    
    
    func searchPlayers(name: String) -> Int {
        for(var i=0; i<players.count; i++) {
        let pName = players[i].valueForKey("name") as! String
        let gNum = players[i].valueForKey("game") as! Int
        if((pName == name) && (gNum == game)) {
        return i
        }
        }
        return -1
    }
    
}
