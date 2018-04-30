//
//  Category.swift
//  iOS Craigslist
//
//  Created by Vincent Ninh DO on 4/13/18.
//  Copyright © 2018 Vincent Ninh DO. All rights reserved.
//

import Foundation
import UIKit

var categoryDict: [String: [String]] = [:]

var categoryArray: [String] = []

class Category {

    static func loadData() {
        
        do {
            if let url = Bundle.main.url(forResource: "craigslistData", withExtension: "json") {
                let jsonData = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                if let dataDict = json as? [String: Any] {
                    // json is a dictionary
                    categoryDict = dataDict as! [String: [String]]
                    categoryArray = categoryDict.keys.sorted()
                } else if let _ = json as? [Any] {
                    // json is an array
                } else {
                    print("JSON is invalid")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
//        do {
//            if let path = Bundle.main.path(forResource: "craigslistData", ofType: "json") {
//                let jsonData = NSData(contentsOfFile: path) // jsonData is NSData object
//                let json = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
//                if let dataDict = json as? [String:AnyObject] {
//                    //
//                } else if let dataArray = json as? [Any] {
//                    //
//                } else {
//                    print("JSON is invalid")
//                }
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
        
//        if let path = Bundle.main.path(forResource: "craigslist", ofType: "json")
//        {
//            if let jsonData = NSData(contentsOfFile: path) {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! [String:AnyObject]
//                    // Do something with dictionary json here
//                } catch {
//                    NSLog("Could not load Pokemon array")
//                }
//
//            }
//        }
        
    }
}
