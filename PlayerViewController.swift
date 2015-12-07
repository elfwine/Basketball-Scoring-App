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

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    
    var players = [NSManagedObject]()
    var game = Int()
    var player = Int()
    var opponent = String()
    var date = String()
    
    
    let blankLabel = UILabel()
    let pointsLabel = UILabel()
    let shootingLabel = UILabel()
    let assistsLabel = UILabel()
    let reboundsLabel = UILabel()
    let stealsLabel = UILabel()
    let blocksLabel = UILabel()
    let turnoversLabel = UILabel()
    let fantasyPointsLabel = UILabel()
    
    
    let gameLabel = UILabel()
    let gPointsLabel = UILabel()
    let gShootingLabel = UILabel()
    let gAssistsLabel = UILabel()
    let gReboundsLabel = UILabel()
    let gStealsLabel = UILabel()
    let gBlocksLabel = UILabel()
    let gTurnoversLabel = UILabel()
    let gFantasyPointsLabel = UILabel()
    
    let averageLabel = UILabel()
    let aPointsLabel = UILabel()
    let aShootingLabel = UILabel()
    let aAssistsLabel = UILabel()
    let aReboundsLabel = UILabel()
    let aStealsLabel = UILabel()
    let aBlocksLabel = UILabel()
    let aTurnoversLabel = UILabel()
    let aFantasyPointsLabel = UILabel()
    
    
    let NathanHale = ["Sam Leach","Sam Nasralla","Julien Streetman","Ishmael Simpson", "Trey McAdams","Stieg Smith", "TJ Williams","Dempsey Hope","Kateel Barnett","Malcolm Gulyard","Khepra Mims"]
    let backButton = UIButton()
    let forwardButton = UIButton()
    let boxScoreButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playerNameLabel.text = (players[player].valueForKey("name") as! String) + " vs. " + opponent + " on " + date
        
        makeButtons()
        
        addLabels()
        
    }
    
    func addLabels() {
        
        //creates static labels
        let labels = [blankLabel, pointsLabel,shootingLabel,assistsLabel,reboundsLabel,stealsLabel,blocksLabel,turnoversLabel,fantasyPointsLabel]
        let labelsText = ["","Points", "Shooting", "Assists", "Rebounds", "Steals","Blocks","Turnovers","Fantasy"]
        for(var i=0; i<labels.count; i++) {
            let label = labels[i]
            label.frame = CGRectMake(((self.view.frame.size.width / 9) * CGFloat(i)), (self.view.frame.size.height / 5), (self.view.frame.size.width / 9), (self.view.frame.size.height / 5) - 4)
            label.text = labelsText[i]
            label.textAlignment = NSTextAlignment.Center
            self.view.addSubview(label)
        }
        
        //creates current game labels
        
        let gameLabels = [gameLabel, gPointsLabel,gShootingLabel,gAssistsLabel,gReboundsLabel,gStealsLabel,gBlocksLabel,gTurnoversLabel,gFantasyPointsLabel]
        let gamePoints = ((players[player].valueForKey("twopointersmade") as! Int) * 2) + (((players[player].valueForKey("threepointersmade") as! Int) * 3))
        let madeShots = (players[player].valueForKey("twopointersmade") as! Int) + (players[player].valueForKey("threepointersmade") as! Int)
        let missedShots = players[player].valueForKey("missedshots") as! Int
        let totalShots = missedShots + madeShots
        let shooting = String(madeShots) + "-" + String(totalShots)
        let assists = players[player].valueForKey("assists") as! Int
        let rebounds = players[player].valueForKey("rebounds") as! Int
        let steals = players[player].valueForKey("steals") as! Int
        let blocks = players[player].valueForKey("blocks") as! Int
        let turnovers = players[player].valueForKey("turnovers") as! Int
        let fantasyPoints = gamePoints - missedShots + assists + rebounds + steals + blocks - turnovers
        
        let gameLabelsText = ["Game",String(gamePoints),shooting,String(assists),String(rebounds), String(steals), String(blocks), String(turnovers), String(fantasyPoints)]
        
        for(var i=0; i<labels.count; i++) {
            let label = gameLabels[i]
            label.frame = CGRectMake(((self.view.frame.size.width / 9) * CGFloat(i)), (self.view.frame.size.height / 5) * 2, (self.view.frame.size.width / 9), (self.view.frame.size.height / 5) - 4)
            label.text = gameLabelsText[i]
            label.textAlignment = NSTextAlignment.Center
            self.view.addSubview(label)
        }
        
        //average row
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let averageLabels = [averageLabel, aPointsLabel,aShootingLabel,aAssistsLabel,aReboundsLabel,aStealsLabel,aBlocksLabel,aTurnoversLabel,aFantasyPointsLabel]
        
        let fetchReq = NSFetchRequest(entityName:"Player")
        let err: NSError?
        var fetchedR = [NSManagedObject]()
        do {
            fetchedR = try managedContext.executeFetchRequest(fetchReq) as! [NSManagedObject]
        } catch let err as NSError {
            
            print("Fetch failed: \(err.localizedDescription)")
        }
        let allP = fetchedR
        
        var aPoints = 0
        var aMadeShots = 0
        var aMissedShots = 0
        var aTotalShots = 0
        
        var aAssists = 0
        var aRebounds = 0
        var aSteals = 0
        var aBlocks = 0
        var aTurnovers = 0
        var aFantasyPoints = 0
        var c = 0
        
        for(var i=0; i<allP.count; i++) {
            if((allP[i].valueForKey("name") as! String) == (players[player].valueForKey("name") as! String)) {
                let tPoints = ((allP[i].valueForKey("twopointersmade") as! Int) * 2) + (((allP[i].valueForKey("threepointersmade") as! Int) * 3))
                let tMadeShots = (allP[i].valueForKey("twopointersmade") as! Int) + (allP[i].valueForKey("threepointersmade") as! Int)
                let tMissedShots = (allP[i].valueForKey("missedshots") as! Int)
                let tAssists = (allP[i].valueForKey("assists") as! Int)
                let tRebounds = (allP[i].valueForKey("rebounds") as! Int)
                let tSteals = (allP[i].valueForKey("steals") as! Int)
                let tBlocks = (allP[i].valueForKey("blocks") as! Int)
                let tTurnovers = (allP[i].valueForKey("turnovers") as! Int)
                
                aPoints = aPoints + tPoints
                aMadeShots = aMadeShots + tMadeShots
                aMissedShots = aMissedShots + tMissedShots
                aTotalShots = aMissedShots + aMadeShots
                aAssists = aAssists + tAssists
                aRebounds = aRebounds + tRebounds
                aSteals = aSteals + tSteals
                aBlocks = aBlocks + tBlocks
                aTurnovers = aTurnovers + tTurnovers
                aFantasyPoints = aFantasyPoints + tPoints - tMissedShots + tAssists + tRebounds + tSteals + tBlocks - tTurnovers
                c++
            }
        }
        
        let counter = Float(c)
        var aPointsF = Float(aPoints)
        var aMadeShotsF = Float(aMadeShots)
        var aTotalShotsF = Float(aTotalShots)
        var aAssistsF = Float(aAssists)
        var aReboundsF = Float(aRebounds)
        var aStealsF = Float(aSteals)
        var aTurnoversF = Float(aTurnovers)
        var aFantasyPointsF = Float(aFantasyPoints)
        var aBlocksF = Float(aBlocks)
        
        aPointsF = aPointsF / counter
        aMadeShotsF = aMadeShotsF / counter
        aTotalShotsF = aTotalShotsF / counter
        aAssistsF = aAssistsF / counter
        aReboundsF = aReboundsF / counter
        aStealsF = aStealsF / counter
        aTurnoversF = aTurnoversF / counter
        aFantasyPointsF = aFantasyPointsF / counter
        aBlocksF = aBlocksF / counter
        
        let aShooting = String(aMadeShotsF) + "-" + String(aTotalShotsF)
        
        let averageLabelsText = ["Average",String(aPointsF),aShooting,String(aAssistsF),String(aReboundsF), String(aStealsF), String(aBlocksF), String(aTurnoversF), String(aFantasyPointsF)]
        
        for(var i=0; i<labels.count; i++) {
            let label = averageLabels[i]
            label.frame = CGRectMake(((self.view.frame.size.width / 9) * CGFloat(i)), (self.view.frame.size.height / 5) * 3, (self.view.frame.size.width / 9), (self.view.frame.size.height / 5) - 4)
            label.text = averageLabelsText[i]
            label.textAlignment = NSTextAlignment.Center
            self.view.addSubview(label)
        }
        
        
    }
    
    func updateGameLabels() {
        
        let gameLabels = [gameLabel, gPointsLabel,gShootingLabel,gAssistsLabel,gReboundsLabel,gStealsLabel,gBlocksLabel,gTurnoversLabel,gFantasyPointsLabel]
        let gamePoints = ((players[player].valueForKey("twopointersmade") as! Int) * 2) + (((players[player].valueForKey("threepointersmade") as! Int) * 3))
        let madeShots = (players[player].valueForKey("twopointersmade") as! Int) + (players[player].valueForKey("threepointersmade") as! Int)
        let missedShots = players[player].valueForKey("missedshots") as! Int
        let totalShots = missedShots + madeShots
        let shooting = String(madeShots) + "-" + String(totalShots)
        let assists = players[player].valueForKey("assists") as! Int
        let rebounds = players[player].valueForKey("rebounds") as! Int
        let steals = players[player].valueForKey("steals") as! Int
        let blocks = players[player].valueForKey("blocks") as! Int
        let turnovers = players[player].valueForKey("turnovers") as! Int
        let fantasyPoints = gamePoints - missedShots + assists + rebounds + steals + blocks - turnovers
        
        let gameLabelsText = ["Game",String(gamePoints),shooting,String(assists),String(rebounds), String(steals), String(blocks), String(turnovers), String(fantasyPoints)]
        
        for(var i=0; i<gameLabelsText.count; i++) {
            let label = gameLabels[i]
            label.text = gameLabelsText[i]
        }
        
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let averageLabels = [averageLabel, aPointsLabel,aShootingLabel,aAssistsLabel,aReboundsLabel,aStealsLabel,aBlocksLabel,aTurnoversLabel,aFantasyPointsLabel]
        
        let fetchReq = NSFetchRequest(entityName:"Player")
        let err: NSError?
        var fetchedR = [NSManagedObject]()
        do {
            fetchedR = try managedContext.executeFetchRequest(fetchReq) as! [NSManagedObject]
        } catch let err as NSError {
            
            print("Fetch failed: \(err.localizedDescription)")
        }
        let allP = fetchedR
        
        var aPoints = 0
        var aMadeShots = 0
        var aMissedShots = 0
        var aTotalShots = 0
        
        var aAssists = 0
        var aRebounds = 0
        var aSteals = 0
        var aBlocks = 0
        var aTurnovers = 0
        var aFantasyPoints = 0
        var c = 0
        
        for(var i=0; i<allP.count; i++) {
            if((allP[i].valueForKey("name") as! String) == (players[player].valueForKey("name") as! String)) {
                let tPoints = ((allP[i].valueForKey("twopointersmade") as! Int) * 2) + (((allP[i].valueForKey("threepointersmade") as! Int) * 3))
                let tMadeShots = (allP[i].valueForKey("twopointersmade") as! Int) + (allP[i].valueForKey("threepointersmade") as! Int)
                let tMissedShots = (allP[i].valueForKey("missedshots") as! Int)
                let tAssists = (allP[i].valueForKey("assists") as! Int)
                let tRebounds = (allP[i].valueForKey("rebounds") as! Int)
                let tSteals = (allP[i].valueForKey("steals") as! Int)
                let tBlocks = (allP[i].valueForKey("blocks") as! Int)
                let tTurnovers = (allP[i].valueForKey("turnovers") as! Int)
                
                aPoints = aPoints + tPoints
                aMadeShots = aMadeShots + tMadeShots
                aMissedShots = aMissedShots + tMissedShots
                aTotalShots = aMissedShots + aMadeShots
                aAssists = aAssists + tAssists
                aRebounds = aRebounds + tRebounds
                aSteals = aSteals + tSteals
                aBlocks = aBlocks + tBlocks
                aTurnovers = aTurnovers + tTurnovers
                aFantasyPoints = aFantasyPoints + tPoints - tMissedShots + tAssists + tRebounds + tSteals + tBlocks - tTurnovers
                c++
            }
        }
        
        let counter = Float(c)
        var aPointsF = Float(aPoints)
        var aMadeShotsF = Float(aMadeShots)
        var aTotalShotsF = Float(aTotalShots)
        var aAssistsF = Float(aAssists)
        var aReboundsF = Float(aRebounds)
        var aStealsF = Float(aSteals)
        var aTurnoversF = Float(aTurnovers)
        var aFantasyPointsF = Float(aFantasyPoints)
        var aBlocksF = Float(aBlocks)
        
        aPointsF = aPointsF / counter
        aMadeShotsF = aMadeShotsF / counter
        aTotalShotsF = aTotalShotsF / counter
        aAssistsF = aAssistsF / counter
        aReboundsF = aReboundsF / counter
        aStealsF = aStealsF / counter
        aTurnoversF = aTurnoversF / counter
        aFantasyPointsF = aFantasyPointsF / counter
        aBlocksF = aBlocksF / counter
        
        let aShooting = String(aMadeShotsF) + "-" + String(aTotalShotsF)
        
        let averageLabelsText = ["Average",String(aPointsF),aShooting,String(aAssistsF),String(aReboundsF), String(aStealsF), String(aBlocksF), String(aTurnoversF), String(aFantasyPointsF)]
        
        for(var i=0; i<averageLabels.count; i++) {
            let label = averageLabels[i]
            label.text = averageLabelsText[i]
        }
        
    }
    
    func previous(sender: UIButton) {
        if(player > 0) {
            player = player - 1
        } else {
            player = players.count - 1
        }
        updateGameLabels()
        var prevName = ""
        if(player > 0) {
            prevName = players[player - 1].valueForKey("name") as! String
        } else {
            prevName = players[players.count - 1].valueForKey("name") as! String
        }
        backButton.setTitle(prevName, forState: UIControlState.Normal)
        
        var nextName = ""
        if(player < players.count - 1) {
            nextName = players[player + 1].valueForKey("name") as! String
        } else {
            nextName = players[0].valueForKey("name") as! String
        }
        forwardButton.setTitle(nextName, forState: UIControlState.Normal)
        playerNameLabel.text = players[player].valueForKey("name") as! String + " vs. " + opponent
    }
    
    func next(sender: UIButton) {
        if(player < players.count - 1) {
            player = player + 1
        } else {
            player = 0
        }
        updateGameLabels()
        var prevName = ""
        if(player > 0) {
            prevName = players[player - 1].valueForKey("name") as! String
        } else {
            prevName = players[players.count - 1].valueForKey("name") as! String
        }
        backButton.setTitle(prevName, forState: UIControlState.Normal)
        
        var nextName = ""
        if(player < players.count - 1) {
            nextName = players[player + 1].valueForKey("name") as! String
        } else {
            nextName = players[0].valueForKey("name") as! String
        }
        forwardButton.setTitle(nextName, forState: UIControlState.Normal)
        playerNameLabel.text = players[player].valueForKey("name") as! String + " vs. " + opponent
    }
    
    func makeButtons() {
        
        let blue = UIColor(red:0.0, green:0.0, blue:0.5, alpha:1.0)
        
        backButton.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width / 4, 44)
        backButton.addTarget(self, action: "previous:", forControlEvents: UIControlEvents.TouchUpInside)
        var prevName = ""
        if(player > 0) {
            prevName = players[player - 1].valueForKey("name") as! String
        } else {
            prevName = players[players.count - 1].valueForKey("name") as! String
        }
        backButton.setTitle(prevName, forState: UIControlState.Normal)
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
        var nextName = ""
        if(player < players.count - 1) {
            nextName = players[player + 1].valueForKey("name") as! String
        } else {
            nextName = players[0].valueForKey("name") as! String
        }
        forwardButton.setTitle(nextName, forState: UIControlState.Normal)
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
}
