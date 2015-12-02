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
    let NathanHale = ["Sam Leach","Sam Nasralla","Julien Streetman","Ishmael Simpson", "Trey McAdams","Stieg Smith", "TJ Williams","Dempsey Hope","Kateel Barnett","Malcolm Gulyard","Khepra Mims"]
    var lineup = ["Kateel Barnett","Sam Leach","Sam Nasralla","Ishmael Simpson","Stieg Smith"]
    var bench = ["Julien Streetman", "Trey McAdams","TJ Williams","Dempsey Hope","Malcolm Gulyard","Khepra Mims"]
    var games = [NSManagedObject]()
    var firstTime = false
    
    let subButton = UIButton()
    
    let name1 = UILabel()
    let name2 = UILabel()
    let name3 = UILabel()
    let name4 = UILabel()
    let name5 = UILabel()
    
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
        name1.frame = CGRectMake(0,0,self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6)
        name1.text = "Name:"
        name1.textAlignment = NSTextAlignment.Center
        self.view.addSubview(name1)
        
        
        name2.frame = CGRectMake(0,self.view.frame.size.height / 6,self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6)
        name2.text = "Name:"
        name2.textAlignment = NSTextAlignment.Center
        self.view.addSubview(name2)
        
        name3.frame = CGRectMake(0,self.view.frame.size.height / 6 * 2,self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6)
        name3.text = "Name:"
        name3.textAlignment = NSTextAlignment.Center
        self.view.addSubview(name3)
        
        name4.frame = CGRectMake(0,self.view.frame.size.height / 6 * 3,self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6)
        name4.text = "Name:"
        name4.textAlignment = NSTextAlignment.Center
        self.view.addSubview(name4)
        
        name5.frame = CGRectMake(0,self.view.frame.size.height / 6 * 4,self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6)
        name5.text = "Name:"
        name5.textAlignment = NSTextAlignment.Center
        self.view.addSubview(name5)
    }
    
    func addTwoPMButtons() {
        twopm1.addTarget(self, action: "made2ptr1:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm1.frame = CGRectMake(self.view.frame.size.width / 6 * 2, 0, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        twopm1.setTitle("2PM", forState: UIControlState.Normal)
        twopm1.backgroundColor = UIColor.greenColor()
        twopm1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(twopm1)
        
        twopm2.addTarget(self, action: "made2ptr2:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm2.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        twopm2.setTitle("2PM", forState: UIControlState.Normal)
        twopm2.backgroundColor = UIColor.greenColor()
        twopm2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(twopm2)
        
        twopm3.addTarget(self, action: "made2ptr3:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm3.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        twopm3.setTitle("2PM", forState: UIControlState.Normal)
        twopm3.backgroundColor = UIColor.greenColor()
        twopm3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(twopm3)
        
        twopm4.addTarget(self, action: "made2ptr4:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm4.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        twopm4.setTitle("2PM", forState: UIControlState.Normal)
        twopm4.backgroundColor = UIColor.greenColor()
        twopm4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(twopm4)
        
        twopm5.addTarget(self, action: "made2ptr5:", forControlEvents: UIControlEvents.TouchUpInside)
        twopm5.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        twopm5.setTitle("2PM", forState: UIControlState.Normal)
        twopm5.backgroundColor = UIColor.greenColor()
        twopm5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(twopm5)
        
        

    }
    
    func addThreePMButtons() {
        
        let pink = UIColor(red:1.0, green:0.1, blue:0.65, alpha:1.0)
        
        threepm1.addTarget(self, action: "made3ptr1:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm1.frame = CGRectMake(self.view.frame.size.width / 6 * 3, 0, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        threepm1.setTitle("3PM", forState: UIControlState.Normal)
        threepm1.backgroundColor = pink
        threepm1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(threepm1)
        
        threepm2.addTarget(self, action: "made3ptr2:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm2.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        threepm2.setTitle("3PM", forState: UIControlState.Normal)
        threepm2.backgroundColor = pink
        threepm2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(threepm2)
        
        
        threepm3.addTarget(self, action: "made3ptr3:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm3.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        threepm3.setTitle("3PM", forState: UIControlState.Normal)
        threepm3.backgroundColor = pink
        threepm3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(threepm3)
        
        
        threepm4.addTarget(self, action: "made3ptr4:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm4.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        threepm4.setTitle("3PM", forState: UIControlState.Normal)
        threepm4.backgroundColor = pink
        threepm4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(threepm4)
        
        
        threepm5.addTarget(self, action: "made3ptr5:", forControlEvents: UIControlEvents.TouchUpInside)
        threepm5.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        threepm5.setTitle("3PM", forState: UIControlState.Normal)
        threepm5.backgroundColor = pink
        threepm5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(threepm5)
    }
    
    
    func addAssistButtons() {
        
        let blue = UIColor(red:0.12, green:0.54, blue:1.0, alpha:1.0)
        
        assist1.addTarget(self, action: "madeAssist1:", forControlEvents: UIControlEvents.TouchUpInside)
        assist1.frame = CGRectMake(self.view.frame.size.width / 6 * 4, 0, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        assist1.setTitle("ASSIST", forState: UIControlState.Normal)
        assist1.backgroundColor = blue
        assist1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(assist1)
        
        assist2.addTarget(self, action: "madeAssist2:", forControlEvents: UIControlEvents.TouchUpInside)
        assist2.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        assist2.setTitle("ASSIST", forState: UIControlState.Normal)
        assist2.backgroundColor = blue
        assist2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(assist2)
        
        assist3.addTarget(self, action: "madeAssist3:", forControlEvents: UIControlEvents.TouchUpInside)
        assist3.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        assist3.setTitle("ASSIST", forState: UIControlState.Normal)
        assist3.backgroundColor = blue
        assist3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(assist3)
        
        assist4.addTarget(self, action: "madeAssist4:", forControlEvents: UIControlEvents.TouchUpInside)
        assist4.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        assist4.setTitle("ASSIST", forState: UIControlState.Normal)
        assist4.backgroundColor = blue
        assist4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(assist4)
        
        assist5.addTarget(self, action: "madeAssist5:", forControlEvents: UIControlEvents.TouchUpInside)
        assist5.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        assist5.setTitle("ASSIST", forState: UIControlState.Normal)
        assist5.backgroundColor = blue
        assist5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(assist5)

    }
    
    func addReboundButtons() {
        
        let red = UIColor(red:0.74, green:0.0, blue:0.0, alpha:1.0)
        
        rebound1.addTarget(self, action: "madeRebound1:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound1.frame = CGRectMake(self.view.frame.size.width / 6 * 5,0, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        rebound1.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound1.backgroundColor = red
        rebound1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(rebound1)
        
        rebound2.addTarget(self, action: "madeRebound2:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound2.frame = CGRectMake(self.view.frame.size.width / 6 * 5,self.view.frame.size.height / 6 + 4, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        rebound2.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound2.backgroundColor = red
        rebound2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(rebound2)
        
        rebound3.addTarget(self, action: "madeRebound3:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound3.frame = CGRectMake(self.view.frame.size.width / 6 * 5,self.view.frame.size.height / 6 * 2 + 8, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        rebound3.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound3.backgroundColor = red
        rebound3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(rebound3)
        
        rebound4.addTarget(self, action: "madeRebound4:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound4.frame = CGRectMake(self.view.frame.size.width / 6 * 5,self.view.frame.size.height / 6 * 3 + 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        rebound4.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound4.backgroundColor = red
        rebound4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(rebound4)
        
        rebound5.addTarget(self, action: "madeRebound5:", forControlEvents: UIControlEvents.TouchUpInside)
        rebound5.frame = CGRectMake(self.view.frame.size.width / 6 * 5,self.view.frame.size.height / 6 * 4 + 16, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        rebound5.setTitle("REBOUND", forState: UIControlState.Normal)
        rebound5.backgroundColor = red
        rebound5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(rebound5)

    }
    
    
    
    func addMissButtons() {
        
        let gray = UIColor(red:0.35, green:0.35, blue:0.35, alpha:1.0)
        
        miss1.addTarget(self, action: "missedFG1:", forControlEvents: UIControlEvents.TouchUpInside)
        miss1.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.height / 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        miss1.setTitle("MISS", forState: UIControlState.Normal)
        miss1.backgroundColor = gray
        miss1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(miss1)
        
        miss2.addTarget(self, action: "missedFG2:", forControlEvents: UIControlEvents.TouchUpInside)
        miss2.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        miss2.setTitle("MISS", forState: UIControlState.Normal)
        miss2.backgroundColor = gray
        miss2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(miss2)
        
        miss3.addTarget(self, action: "missedFG3:", forControlEvents: UIControlEvents.TouchUpInside)
        miss3.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        miss3.setTitle("MISS", forState: UIControlState.Normal)
        miss3.backgroundColor = gray
        miss3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(miss3)
        
        miss4.addTarget(self, action: "missedFG4:", forControlEvents: UIControlEvents.TouchUpInside)
        miss4.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        miss4.setTitle("MISS", forState: UIControlState.Normal)
        miss4.backgroundColor = gray
        miss4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(miss4)
        
        miss5.addTarget(self, action: "missedFG5:", forControlEvents: UIControlEvents.TouchUpInside)
        miss5.frame = CGRectMake(self.view.frame.size.width / 6 * 2, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        miss5.setTitle("MISS", forState: UIControlState.Normal)
        miss5.backgroundColor = gray
        miss5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(miss5)
        
    }
    
    func addStealButtons() {
        steal1.addTarget(self, action: "madeSteal1:", forControlEvents: UIControlEvents.TouchUpInside)
        steal1.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.height / 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        steal1.setTitle("STEAL", forState: UIControlState.Normal)
        steal1.backgroundColor = UIColor.purpleColor()
        steal1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(steal1)
        
        steal2.addTarget(self, action: "madeSteal2:", forControlEvents: UIControlEvents.TouchUpInside)
        steal2.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        steal2.setTitle("STEAL", forState: UIControlState.Normal)
        steal2.backgroundColor = UIColor.purpleColor()
        steal2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(steal2)
        
        steal3.addTarget(self, action: "madeSteal3:", forControlEvents: UIControlEvents.TouchUpInside)
        steal3.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        steal3.setTitle("STEAL", forState: UIControlState.Normal)
        steal3.backgroundColor = UIColor.purpleColor()
        steal3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(steal3)
        
        steal4.addTarget(self, action: "madeSteal4:", forControlEvents: UIControlEvents.TouchUpInside)
        steal4.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        steal4.setTitle("STEAL", forState: UIControlState.Normal)
        steal4.backgroundColor = UIColor.purpleColor()
        steal4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(steal4)
        
        steal5.addTarget(self, action: "madeSteal5:", forControlEvents: UIControlEvents.TouchUpInside)
        steal5.frame = CGRectMake(self.view.frame.size.width / 6 * 3, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        steal5.setTitle("STEAL", forState: UIControlState.Normal)
        steal5.backgroundColor = UIColor.purpleColor()
        steal5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(steal5)
        
    }
    
    
    func addBlockButtons() {
        block1.addTarget(self, action: "madeBlock1:", forControlEvents: UIControlEvents.TouchUpInside)
        block1.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.height / 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        block1.setTitle("BLOCK", forState: UIControlState.Normal)
        block1.backgroundColor = UIColor.orangeColor()
        block1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(block1)
        
        block2.addTarget(self, action: "madeBlock2:", forControlEvents: UIControlEvents.TouchUpInside)
        block2.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        block2.setTitle("BLOCK", forState: UIControlState.Normal)
        block2.backgroundColor = UIColor.orangeColor()
        block2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(block2)
        
        block3.addTarget(self, action: "madeBlock3:", forControlEvents: UIControlEvents.TouchUpInside)
        block3.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        block3.setTitle("BLOCK", forState: UIControlState.Normal)
        block3.backgroundColor = UIColor.orangeColor()
        block3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(block3)
        
        block4.addTarget(self, action: "madeBlock4:", forControlEvents: UIControlEvents.TouchUpInside)
        block4.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        block4.setTitle("BLOCK", forState: UIControlState.Normal)
        block4.backgroundColor = UIColor.orangeColor()
        block4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(block4)
        
        block5.addTarget(self, action: "madeBlock5:", forControlEvents: UIControlEvents.TouchUpInside)
        block5.frame = CGRectMake(self.view.frame.size.width / 6 * 4, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        block5.setTitle("BLOCK", forState: UIControlState.Normal)
        block5.backgroundColor = UIColor.orangeColor()
        block5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(block5)
    }
    
    func addTurnoverButtons() {
        
        let blue = UIColor(red:0.0, green:0.0, blue:0.5, alpha:1.0)
        
        turnover1.addTarget(self, action: "madeTurnover1:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover1.frame = CGRectMake(self.view.frame.size.width / 6 * 5, self.view.frame.height / 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        turnover1.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover1.backgroundColor = blue
        turnover1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(turnover1)
        
        turnover2.addTarget(self, action: "madeTurnover2:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover2.frame = CGRectMake(self.view.frame.size.width / 6 * 5, self.view.frame.height / 12 * 3 + 4, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        turnover2.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover2.backgroundColor = blue
        turnover2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(turnover2)
        
        turnover3.addTarget(self, action: "madeTurnover3:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover3.frame = CGRectMake(self.view.frame.size.width / 6 * 5, self.view.frame.height / 12 * 5 + 8, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        turnover3.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover3.backgroundColor = blue
        turnover3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(turnover3)
        
        turnover4.addTarget(self, action: "madeTurnover4:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover4.frame = CGRectMake(self.view.frame.size.width / 6 * 5, self.view.frame.height / 12 * 7 + 12, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        turnover4.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover4.backgroundColor = blue
        turnover4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(turnover4)
        
        turnover5.addTarget(self, action: "madeTurnover5:", forControlEvents: UIControlEvents.TouchUpInside)
        turnover5.frame = CGRectMake(self.view.frame.size.width / 6 * 5, self.view.frame.height / 12 * 9 + 16, (self.view.frame.size.width / 6) - 8, (self.view.frame.size.height / 12) - 4)
        turnover5.setTitle("TURNOVER", forState: UIControlState.Normal)
        turnover5.backgroundColor = blue
        turnover5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(turnover5)
    }

    
    func createNewPlayers() {
//        for(var i=0; i<NathanHale.count; i++) {
//            print(NathanHale[i])
//        }
    }
    
    func addSubButton() {
        subButton.addTarget(self, action: "goToSub:", forControlEvents: UIControlEvents.TouchUpInside)
        subButton.frame = CGRectMake(0 , self.view.frame.height / 48 * 43, self.view.frame.size.width, (self.view.frame.size.height / 48) * 5)
        subButton.setTitle("Substitutions", forState: UIControlState.Normal)
        subButton.backgroundColor = UIColor.blueColor()
        subButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(subButton)
    }
    
    func goToSub(sender: UIButton) {
        performSegueWithIdentifier("subPlayers", sender: nil)
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
        
        
        
        addNameLabels()
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
        name1.text = lineup[0]
        name2.text = lineup[1]
        name3.text = lineup[2]
        name4.text = lineup[3]
        name5.text = lineup[4]
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
        }
    }

    
    
    func made2ptr1(sender: UIButton) {
        
    }

}