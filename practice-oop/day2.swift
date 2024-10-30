//
//  day2.swift
//  practice-oop
//
//  Created by H470-088 on 29/10/24.
//

import Foundation


enum NumColor: String {
    case green
    case blue
    case red
}

struct Day2 {
    var filePath: String
    
    init(path filePath: String) {
        self.filePath = filePath
    }
    
    func solve() -> Int? {
        // Rule of max cubes
        let GREEN = 13
        let RED = 12
        let BLUE = 14
        
        
        var sumId = 0
        // Format of string to split
        // Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        do {
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            let arrayOfText = contents.split(separator: "\n")
            
            for text in arrayOfText {
                var gameId: Int?
                var maxGreen: Int = -1
                var maxRed: Int = -1
                var maxBlue: Int = -1
                let textSplitTitle = text.split(separator: ":")
                
                
                // Split for gameId
                // Split for gameId currently wrong because it only take one character
                if let gameIdString = textSplitTitle.first {
                    let splitTitleGame = gameIdString.split(separator: " ")
                    if let idNumberString = splitTitleGame.last {
                        //Convert to number
                        if let id = Int(idNumberString) {
                            gameId = id
                        }
                    }
                }
                
                // Split for cubs calculate
                if let stringGame = textSplitTitle.last {
                    // Dot here for set
                    let trimmingText = stringGame.trimmingCharacters(in: .whitespaces)
                    let splitTurn = trimmingText.split(separator: ";")
                    
                    for turn in splitTurn {
                        let colorStringArr = turn.split(separator: ",")
                        for colorString in colorStringArr {
                            let trimmingColorString = colorString.trimmingCharacters(in: .whitespaces)
                            
                            // Handle color string
                            let valueSplitColor = trimmingColorString.split(separator: " ") // The value follow by array ["number","color"]
                            
                            if let numberString = valueSplitColor.first, let color = valueSplitColor.last {
                                // Convert number to int
                                if let number = Int(numberString) {
                                    var stringColor = String(color)
                                    switch(stringColor) {
                                    case NumColor.green.rawValue:
                                        if number > maxGreen {
                                            maxGreen = number
                                        }
                                    case NumColor.blue.rawValue:
                                        if number > maxBlue {
                                            maxBlue = number
                                        }
                                    case NumColor.red.rawValue:
                                        if number > maxRed {
                                            maxRed = number
                                        }
                                    default:
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                // Check if that game valid with the rule or not
                if maxRed <= RED && maxBlue <= BLUE && maxGreen <= GREEN {
                    if let game = gameId {
                        print(game, maxRed, maxGreen, maxBlue)
                        sumId = sumId + game
                    }
                }
            }
           print(sumId)
        }
        
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        return nil
    }
}


