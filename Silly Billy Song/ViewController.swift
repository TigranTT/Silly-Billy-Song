//
//  ViewController.swift
//  Silly Billy Song
//
//  Created by Tigran Tshorokhyan on 2/20/17.
//  Copyright © 2017 Tigran Tshorokhyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text == "" {
            lyricsView.text = ["Please",
            "Enter Your Name ⬆️",
            "🤓 🤓"].joined(separator: "\n")
        } else {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


func shortNameFromName(_ name: String) -> String {
    var name = name.lowercased()
    name.characters.removeFirst()
    return name
}



func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName )
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>❗️",
    "Banana Fana Fo F<SHORT_NAME>❗️",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>❗️",
    "😜 😜"].joined(separator: "\n")

