//
//  ViewController.swift
//  FlattenDictionaries
//
//  Created by Noshaid Ali on 12/04/2020.
//  Copyright © 2020 Noshaid Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dict: [String: Any] = [
            "Key1": "1",
            "Key2": [
                "a": "2",
                "b": "3",
                "c": [
                    "d": "3",
                    "e": [
                        "": "1"
                    ]
                ]
            ]
        
        ]
        print(flattenDictionary(dict: dict))
    }
    
    func flattenDictionary(dict: Dictionary<String, Any>) -> Dictionary<String, Any> {
      // your code goes here
      var flatDictionary = [String: Any]()
      if dict.count == 0 {
        return flatDictionary
      } else {
        makeDict(dict: dict, inputkey: "", flatDictionary: &flatDictionary)
      }
      return flatDictionary
    }

    func makeDict(dict: Dictionary<String, Any>, inputkey: String, flatDictionary: inout Dictionary<String, Any>) {
        for (key, value) in dict {
            if value is Dictionary<String, Any> {
            if !key.isEmpty && inputkey != "" {
                makeDict(dict: value as! Dictionary<String, Any>, inputkey: "\(inputkey).\(key)", flatDictionary: &flatDictionary)
            } else {
                makeDict(dict: value as! Dictionary<String, Any>, inputkey: key, flatDictionary: &flatDictionary)
            }
          } else {
            if !key.isEmpty && inputkey != "" {
              flatDictionary["\(inputkey).\(key)"] = value
            } else {
                if inputkey != "" {
                    flatDictionary[inputkey] = value
                } else {
                    flatDictionary[key] = value
                }
            }
          }
        }
    }




}

