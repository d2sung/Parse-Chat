//
//  ChatViewController.swift
//  Parse Chat
//
//  Created by Daniel Sung on 2/23/17.
//  Copyright © 2017 Daniel Sung. All rights reserved.
//

import UIKit
import Parse
class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatTextField: UITextField!
    
    var messages = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
         Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttClicked(_ sender: Any) {
        let Chat = PFObject(className:"Message")
        Chat["text"] = chatTextField.text!
        // Chat["user"] = "Sim and Daniel"
        Chat.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                print ("Success")
                self.chatTextField.text = ""
            } else {
                print ("Error")
            }
        }
    }
    
    func onTimer() {
        
        let query = PFQuery(className:"Message")
        
        
        query.order(byDescending: "createdAt")
        
        query.findObjectsInBackground{
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    self.messages = objects
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!._userInfo)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "message", for: indexPath) as! messageTableViewCell
        
        cell.message = messages[indexPath.row]["text"] as! String
        
        /*
        if (messages[indexPath.row]["user"] != nil) {
            let user = messages[indexPath.row]["user"] as! PFUser
        
            
            user.fetchInBackground(block: { (userObj, error) in
                if let user = userObj as? PFUser{
                    print(user.username)
                    cell.user = user.username 
                }
            })
 
            
        }
        else {
            cell.user = "none"
        }
        */
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
