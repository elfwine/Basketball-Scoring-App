//
//  EditTeamViewController.swift
//  scorer
//
//  Created by Jacob Kohn on 12/11/15.
//  Copyright © 2015 Jacob Kohn. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EditTeamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var playerTable: UITableView!
    @IBOutlet weak var teamNameLabel: UILabel!
    var team = Int()
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addPlayerButton: UIButton!
    var players = [String]()
    var joint = [NSManagedObject]()
    var allPlayers = [NSManagedObject]()
    var teamName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:"Joint")
        let error: NSError?
        var fetchedResults = [NSManagedObject]()
        do {
            fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
        } catch let error as NSError {
            print("Fetch failed: \(error.localizedDescription)")
        }
        joint = fetchedResults
        
        
        let fetchReq = NSFetchRequest(entityName:"Player")
        let e: NSError?
        var fetchedR = [NSManagedObject]()
        do {
            fetchedR = try managedContext.executeFetchRequest(fetchReq) as! [NSManagedObject]
        } catch let e as NSError {
            print("Fetch failed: \(e.localizedDescription)")
        }
        allPlayers = fetchedR
        
        
        
        for(var i=0; i<joint.count; i++) {
            if(joint[i].valueForKey("teamnum") as! Int == team) {
                players.append(joint[i].valueForKey("playername") as! String)
            }
        }
        
        playerTable.dataSource = self
        
        configButtons()
    }
    
    func configButtons() {
        
        teamNameLabel.text! = teamName
        addPlayerButton.addTarget(self, action: "addPlayer:", forControlEvents: UIControlEvents.TouchUpInside)
        backButton.addTarget(self, action: "back:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addPlayer(sender: UIButton) {
        print("!")
        let alert = UIAlertController(title: "New Player", message: "Enter the Player's Name", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            
        })
        
        alert.addAction(UIAlertAction(title: "Done", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0]
            //CoreData stuff
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity =  NSEntityDescription.entityForName("Joint",
                inManagedObjectContext:
                managedContext)
            
            let jointObject = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext:managedContext)
            jointObject.setValue(self.team, forKey: "teamnum")
            jointObject.setValue(textField.text!, forKey: "playername")
        
            self.joint.insert(jointObject, atIndex: self.joint.count)
            
            self.players.insert(textField.text!, atIndex: self.players.count)
            
            self.playerTable.reloadData()
            
            
            
            do {
                try managedContext.save()
            } catch _ {
            }
            
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func back(sender: UIButton) {
        performSegueWithIdentifier("returnToTeams", sender: nil)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pCell", forIndexPath: indexPath) as! PlayerCell
        cell.playerNameCell.text! = players[indexPath.row]
        
        cell.editNameButton.tag = indexPath.row
        cell.editNameButton.addTarget(self, action: "editName:", forControlEvents: UIControlEvents.TouchUpInside)
        
        cell.deletePlayerButton.tag = indexPath.row
        cell.deletePlayerButton.addTarget(self, action: "deletePlayer:", forControlEvents: UIControlEvents.TouchUpInside)
        return cell
    }
    
    
    func editName(sender: UIButton) {
        let alert = UIAlertController(title: "Rename Player", message: "", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = self.players[sender.tag]
        })
        
        alert.addAction(UIAlertAction(title: "Rename", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0]
            //CoreData stuff
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity =  NSEntityDescription.entityForName("Joint",
                inManagedObjectContext:
                managedContext)
            
            
            print(self.joint[sender.tag].valueForKey("playername") as! String)
            
            for(var i=0; i<self.joint.count; i++) {
                if(self.joint[i].valueForKey("playername") as! String == self.players[sender.tag]) {
                    if(self.joint[i].valueForKey("teamnum") as! Int == self.team) {
                        self.joint[i].setValue(textField.text, forKey: "playername")
                    }
                }
            }
            
            
            for(var l=0; l<self.allPlayers.count; l++) {
                if(self.allPlayers[l].valueForKey("name") as! String == self.players[sender.tag]) {
                    self.allPlayers[l].setValue(textField.text, forKey:"name")
                }
            }
            
            
            self.players[sender.tag] = textField.text!
            
            
            
            do {
                try managedContext.save()
            } catch _ {
            }
            
            self.playerTable.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in })
        
        self.presentViewController(alert, animated: true, completion: nil)
        

    }
    
    func deletePlayer(sender: UIButton) {
        //CoreData stuff
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Joint",
            inManagedObjectContext:
            managedContext)
        
        managedContext.deleteObject(joint[sender.tag])
        
        joint.removeAtIndex(sender.tag)
        
        players.removeAtIndex(sender.tag)
        
        do {
            try managedContext.save()
        } catch _ {
        }
        
        let ip = NSIndexPath(forRow: sender.tag, inSection: 0)
        
        playerTable.deleteRowsAtIndexPaths([ip], withRowAnimation: UITableViewRowAnimation.Fade)
        
        playerTable.reloadData()
        
        for(var i=0; i<players.count; i++) {
            print(players[i])
        }
        
        for(var i=0; i<players.count; i++) {
            print(joint[i].valueForKey("playername"))
        }
        
    }
    
}