//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create your instance variables here
    
 
    @IBOutlet weak var billOrSteveFactLabel: UILabel!
    
    @IBOutlet weak var factCounterLabel: UILabel!
    
    @IBOutlet weak var steveButtonOutlet: UIButton!
    
    @IBOutlet weak var billButtonOutlet: UIButton!
    
    
    
    let steveJobs = [
        "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
        "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
        "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
        "He was a pescetarian, meaning he ate no meat except for fish."]
    
    
    let billGates = [
        "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
        "He scored 1590 (out of 1600) on his SATs.",
        "His foundation spends more on global health each year than the United Nation's World Health Organization.",
        "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
        "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
    
    var bsDictionary: [String: [String]] = [:]
    
    var correctPerson: String = ""
    var currentFact = ""
    var currentPerson = ""
    var counter = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        createFacts()
    }
   
    
    func createFacts() {
        bsDictionary.updateValue(steveJobs, forKey: "Steve Jobs")
        bsDictionary.updateValue(billGates, forKey: "Bill Gates")
        
    }
    
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    
    func randomPerson() -> String {
        
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
        
    }
    

    func getRandomFact() -> (String, String) {
    
        
        let innovator = randomPerson() //returns a string -> "B" or "S"
            print(innovator)
        
        if let innovatorFacts = bsDictionary[innovator] { //new var = array of "B"or"S"
            
            let randomFact = randomNumberFromZeroTo(number: innovatorFacts.count)   // enumerates *array* and generates rand num from it
            
            let oneFact = innovatorFacts[randomFact]
            
            return(innovator, oneFact)
            
        } else {
            
            return ("nothing is here", "move on")
        }
        
        
    
    }
    
    
    func showFact() {
        
        let answer = getRandomFact()
        let name = answer.0
        let fact = answer.1
        
        currentPerson = name
        currentFact = fact
        
            billOrSteveFactLabel.text = fact
        
    }
    
    
    
    @IBAction func pickSteveButton(_ sender: UIButton) {
        print("i pick steve")
        
        if currentPerson == "Steve Jobs" {
            print("You're right! It's Steve!")
            counter += 1
            factCounterLabel.text = ("\(counter)")
            
        }else{
            print("Sorry, it's not Steve.")
        }
        

                showFact()
    }
    
    
    @IBAction func pickBillButton(_ sender: UIButton) {
        
        print("i pick bill")
        
        if currentPerson == "Bill Gates" {
            print("You're right! It's Bill")
            counter += 1
            factCounterLabel.text = ("\(counter)")
        }else{
            print("Sorry, it's not Bill.")
        }
        
        
                showFact()

    }


}











    
















