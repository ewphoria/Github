//
//  UserModel.swift
//  GoPlayBook
//
//  Created by myMac on 28/04/18.
//  Copyright © 2018 Love. All rights reserved.
//

import Foundation

class UserModel: NSObject, NSCoding {
    
    let firstName: String?
    let lastName: String?
    let email: String?
    let id: String?
    var profilePicture: String?
    let userType: String?
    
    init (dictionary: [String: Any]) {
        self.firstName = dictionary["first_name"] as? String
        self.lastName = dictionary["last_name"] as? String
        self.email = dictionary["email"] as? String
        self.id = dictionary["id"] as? String
        self.profilePicture = ""
        self.userType = dictionary["user_type"] as? String
        if let pictureDict = dictionary["picture"] as? [String: Any] {
            if let dataDict = pictureDict["data"] as? [String: Any] {
                self.profilePicture = dataDict["url"] as? String
                return
            }
        } else {
            
            let imageUrl = dictionary["picture"] as? String
            
            if let url = imageUrl {
                self.profilePicture = url
            }
            
        }
    }
    
    init (firstName: String?, lastName: String?, email: String?, id: String?, profilePicture: String?, user : String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.id = id
        self.profilePicture = profilePicture
        self.userType = user
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let firstName = aDecoder.decodeObject(forKey: "first_name") as! String
        let lastName = aDecoder.decodeObject(forKey: "last_name") as? String
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let picture = aDecoder.decodeObject(forKey: "picture") as? String
        let email = aDecoder.decodeObject(forKey: "email") as? String
        let userType = aDecoder.decodeObject(forKey: "user_type") as! String
        
        self.init(firstName: firstName, lastName: lastName, email: email, id: id, profilePicture: picture, user: userType)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "first_name")
        aCoder.encode(lastName, forKey: "last_name")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(profilePicture, forKey: "picture")
        aCoder.encode(userType, forKey: "user_type")
    }
    
    public static func getUserFromLocalStorage() -> UserModel? {
        
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.object(forKey: "user") as! Data
        let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! UserModel
        
        if let idIntegerValue = decodedUser.id?.count {
            
            if idIntegerValue > 0 {
                return decodedUser
            }
        }
        
        return nil
    }
    
    public static func saveUserToLocalStorage(user: UserModel) -> Void {
        
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: user)
        userDefaults.set(encodedData, forKey: "user")
        userDefaults.synchronize()
    }
    
    public static func removeUser() -> Void {
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "user")
    }
}

extension UserModel {
    
    struct Keys {
        
        static let firstName = "first_name"
        static let lastName = "last_name"
        static let email = "email"
        static let userId  = "id"
        static let picture = "picture"
        static let userType = "user_type"
    }
    
}
