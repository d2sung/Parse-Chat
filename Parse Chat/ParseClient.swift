//
//  ParseClient.swift
//  Parse Chat
//
//  Created by Daniel Sung on 2/23/17.
//  Copyright © 2017 Daniel Sung. All rights reserved.
//

import Foundation
import Parse


class ParseClient{
    
    class func signUp(usrnm: String, pw: String, completionHandler:@escaping (_ succeeded: Bool, _ error: Error?) -> Void )  {
        let user = PFUser()
        user.username = usrnm
        user.password = pw
        
        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
               completionHandler(succeeded, error)
                // Show the errorString somewhere and let the user try again.
            }
    }
        
    
    
    class func login(usrnm: String, pw:String, completionHandler:@escaping (_ succeeded: Bool, _ error: Error?) -> Void) {
        
        PFUser.logInWithUsername(inBackground: usrnm, password:pw) {
            (user: PFUser?, error: Error?) -> Void in
            completionHandler((user != nil), error)
        }
        
    }
    
}








