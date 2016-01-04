//
//  TeamViewController.swift
//  scorer
//
//  Created by Jacob Kohn on 12/11/15.
//  Copyright © 2015 Jacob Kohn. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class TeamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var teamTableView: UITableView!
    
    var joint = [NSManagedObject]()
    var teams = [NSManagedObject]()
    let newButton = UIButton()
    var currentTeam = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:"Team")
        let error: NSError?
        var fetchedResults = [NSManagedObject]()
        do {
            fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
        } catch let error as NSError {
            
            print("Fetch failed: \(error.localizedDescription)")
        }
        teams = fetchedResults
        
        let fetchReq = NSFetchRequest(entityName:"Joint")
        let err: NSError?
        var fetchedR = [NSManagedObject]()
        do {
            fetchedR = try managedContext.executeFetchRequest(fetchReq) as! [NSManagedObject]
        } catch let err as NSError {
            
            print("Fetch failed: \(err.localizedDescription)")
        }
        joint = fetchedR

        
        
        teamTableView.frame = CGRectMake(0, 44, self.view.frame.width, self.view.frame.height - 88)
        
        teamTableView.dataSource = self
        
        makeButtons()
        
        test()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test() {
        if(teams.count == 0) {
        
        //CoreData stuff
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Team",
            inManagedObjectContext:
            managedContext)
        
        
        //creates new team object
        let teamObject = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        teamObject.setValue(0, forKey: "id")
        teamObject.setValue("A", forKey: "name")
        
        var error: NSError?
        do {
            try managedContext.save()
        } catch var error1 as NSError {
            error = error1
            print("Could not save \(error), \(error?.userInfo)")
        }
        
        self.teams.insert(teamObject, atIndex: self.teams.count)
        
        //creates new team object
        let teamO = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        teamO.setValue(1, forKey: "id")
        teamO.setValue("B", forKey: "name")
        
        var e: NSError?
        do {
            try managedContext.save()
        } catch var error1 as NSError {
            e = error1
            print("Could not save \(e), \(e?.userInfo)")
        }
        
        self.teams.insert(teamO, atIndex: self.teams.count)
        
        
        let ent =  NSEntityDescription.entityForName("Joint",
            inManagedObjectContext:
            managedContext)
        
        let j1 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j1.setValue(0, forKey: "teamnum")
        j1.setValue("A", forKey: "playername")
        self.joint.insert(j1, atIndex: 0)
        
        let j2 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j2.setValue(0, forKey: "teamnum")
        j2.setValue("B", forKey: "playername")
        self.joint.insert(j2, atIndex: 1)
        
        let j3 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j3.setValue(0, forKey: "teamnum")
        j3.setValue("C", forKey: "playername")
        self.joint.insert(j3, atIndex: 2)
        
        let j4 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j4.setValue(0, forKey: "teamnum")
        j4.setValue("D", forKey: "playername")
        self.joint.insert(j4, atIndex: 3)
        
        let j5 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j5.setValue(0, forKey: "teamnum")
        j5.setValue("E", forKey: "playername")
        self.joint.insert(j5, atIndex: 4)
        
        let j6 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j6.setValue(0, forKey: "teamnum")
        j6.setValue("F", forKey: "playername")
        self.joint.insert(j6, atIndex: 5)
        
        let j7 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j7.setValue(1, forKey: "teamnum")
        j7.setValue("Z", forKey: "playername")
        self.joint.insert(j7, atIndex: 6)
        
        let j8 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j8.setValue(1, forKey: "teamnum")
        j8.setValue("Y", forKey: "playername")
        self.joint.insert(j8, atIndex: 7)
        
        
        let j9 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j9.setValue(1, forKey: "teamnum")
        j9.setValue("X", forKey: "playername")
        self.joint.insert(j9, atIndex: 8)
        
        let j10 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j10.setValue(1, forKey: "teamnum")
        j10.setValue("W", forKey: "playername")
        self.joint.insert(j10, atIndex: 9)
        
        let j11 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j11.setValue(1, forKey: "teamnum")
        j11.setValue("V", forKey: "playername")
        self.joint.insert(j11, atIndex: 10)
        
        let j12 = NSManagedObject(entity: ent!,
            insertIntoManagedObjectContext:managedContext)
        j12.setValue(1, forKey: "teamnum")
        j12.setValue("U", forKey: "playername")
        self.joint.insert(j12, atIndex: 11)
        
        do {
            try managedContext.save()
        } catch _ {
        }
        
        
        }
    }
    
    
    
    func makeButtons() {
        newButton.addTarget(self, action: "newTeam:", forControlEvents: .TouchUpInside)
        newButton.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)
        newButton.setTitle("New", forState: .Normal)
        newButton.backgroundColor = UIColor.redColor()
        newButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view.addSubview(newButton)
    }
    
    
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tCell", forIndexPath: indexPath) as! TeamCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.nameLabel.text = teams[indexPath.row].valueForKey("name") as? String
        
        cell.useButton.tag = indexPath.row
        cell.useButton.addTarget(self, action: "openTeam:", forControlEvents: UIControlEvents.TouchUpInside)
        
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: "editTeam:", forControlEvents: UIControlEvents.TouchUpInside)
        
        cell.dButton.tag = indexPath.row
        cell.dButton.addTarget(self, action: "deleteTeam:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    func openTeam(sender: UIButton) {
        currentTeam = sender.tag
        performSegueWithIdentifier("openTeam", sender: nil)
    }
    
    func editTeam(sender: UIButton) {
        currentTeam = sender.tag
        performSegueWithIdentifier("editTeam", sender: nil)
    }
    
    func deleteTeam(sender: UIButton) {
        //CoreData stuff
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Team",
            inManagedObjectContext:
            managedContext)
        
        managedContext.deleteObject(teams[sender.tag])
        
        teams.removeAtIndex(sender.tag)
        

        
        
        for(var i=0; i<joint.count; i++) {
            if(joint[i].valueForKey("teamnum") as! Int == sender.tag) {
                managedContext.deleteObject(joint[i])
                joint.removeAtIndex(i)
                i = i - 1
            }
        }
        
        reduceTeamIDsByOne(sender.tag)
        reduceJointNumsByOne(sender.tag)
        reduceGameNumsByOne(sender.tag)
        
        teamTableView.reloadData()
        
        do {
            try managedContext.save()
        } catch _ {
        }
    }
    
    func reduceGameNumsByOne(id: Int) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchReq = NSFetchRequest(entityName:"Game")
        let err: NSError?
        var fetchedR = [NSManagedObject]()
        do {
            fetchedR = try managedContext.executeFetchRequest(fetchReq) as! [NSManagedObject]
        } catch let err as NSError {
            
            print("Fetch failed: \(err.localizedDescription)")
        }
        var games = fetchedR
        
        
        let fR = NSFetchRequest(entityName:"Player")
        let e: NSError?
        var fetchR = [NSManagedObject]()
        do {
            fetchR = try managedContext.executeFetchRequest(fR) as! [NSManagedObject]
        } catch let err as NSError {
            
            print("Fetch failed: \(err.localizedDescription)")
        }
        var players = fetchR
        
        
        
        for(var l=0; l<games.count; l++) {
            if(games[l].valueForKey("team") as! Int == id) {
                managedContext.deleteObject(games[l])
                games.removeAtIndex(l)
                
                
                for(var q=l; q<games.count; q++) {
                    games[q].setValue(games[q].valueForKey("id") as! Int - 1, forKey: "id")
                }
                
                for(var p=0; p<players.count; p++) {
                    if(players[p].valueForKey("game") as! Int == l) {
                        managedContext.deleteObject(players[p])
                        players.removeAtIndex(p)
                        p--
                    } else if(players[p].valueForKey("game") as! Int > l) {
                        players[p].setValue(players[p].valueForKey("game") as! Int - 1, forKey: "game")
                    }
                }
                
                
                l = l - 1
            } else if(games[l].valueForKey("team") as! Int > id) {
                games[l].setValue(games[l].valueForKey("team") as! Int - 1, forKey: "team")
            }
        }
    }
    
    func reduceTeamIDsByOne(id: Int) {
        for(var i=0; i<teams.count; i++) {
            let teamID = teams[i].valueForKey("id") as! Int
            if(teamID > id) {
                teams[i].setValue(teamID - 1, forKey: "id")
            }
        }
    }
    
    func reduceJointNumsByOne(id: Int) {
        for(var i=0; i<joint.count; i++) {
            let teamID = joint[i].valueForKey("teamnum") as! Int
            if(teamID > id) {
                joint[i].setValue(teamID - 1, forKey: "teamnum")
            }
        }
    }
    
    func newTeam(sender: UIButton) {
        let alert = UIAlertController(title: "Team Name", message: "", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            
        })
        
        alert.addAction(UIAlertAction(title: "Done", style: .Default, handler: { (action) -> Void in
            
            let newTeamNum = self.teams.count
            
            let textField = alert.textFields![0]
            //CoreData stuff
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity =  NSEntityDescription.entityForName("Team",
                inManagedObjectContext:
                managedContext)
            
            
            //creates new team object
            let teamObject = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext:managedContext)
            teamObject.setValue(newTeamNum, forKey: "id")
            teamObject.setValue(textField.text, forKey: "name")
            
            var error: NSError?
            do {
                try managedContext.save()
            } catch var error1 as NSError {
                error = error1
                print("Could not save \(error), \(error?.userInfo)")
            }
            
            self.teams.insert(teamObject, atIndex: self.teams.count)
            
            
            self.currentTeam = newTeamNum
            self.performSegueWithIdentifier("editTeam", sender: nil)
            
            do {
                try managedContext.save()
            } catch _ {
            }
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
        

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "openTeam") {
            let controller = segue.destinationViewController as! ViewController
            controller.team = currentTeam
        }
        
        if(segue.identifier == "editTeam") {
            let controller = segue.destinationViewController as! EditTeamViewController
            controller.team = currentTeam
            controller.teamName = teams[currentTeam].valueForKey("name") as! String
        }
    }
}