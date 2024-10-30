//
//  day1.swift
//  practice-oop
//
//  Created by H470-088 on 25/10/24.
//

import Foundation


struct Day1 {
    var filePath: String
    
    init(path filePath: String) {
        self.filePath = filePath
    }
    
    func part1() -> Int? {
        do {
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            let arrayOfText = contents.split(separator: "\n")
            var sum = 0
            
            for text in arrayOfText {
                var charNumArr: [Int] = [0,0]
                var firstCharPosition = text.count
                var lastCharPosition = -1
                
                for (offset,char) in text.enumerated()  {
                    if let num = char.wholeNumberValue {
                        if firstCharPosition > offset {
                            firstCharPosition = offset
                            charNumArr[0] = num
                        }
                        
                        if lastCharPosition < offset {
                            lastCharPosition = offset
                            charNumArr[1] = num
                        }
                    }
                    if offset == text.count - 1 && charNumArr.count == 2 {
                        let textNumSum = (charNumArr[0]*10)+charNumArr[1]
                        sum = sum + textNumSum
                        break
                    }
                }
            }
            
            return (sum)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        return nil
    }


    func part2() -> Int? {
        // We should use dictonary instead of enum
        // In Swift we can't access enum variable with string

        let stringNumber: [String: Int] = [
            "one": 1,
            "two": 2,
            "three": 3,
            "four": 4,
            "five": 5,
            "six": 6,
            "seven": 7,
            "eight": 8,
            "nine": 9
        ]
        
        let stringNumberArr = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        
        do {
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            // Text line here
            let arrayOfText = contents.split(separator: "\n")
            var sum = 0
            
            for text in arrayOfText {
                var arrayOfNum: [Int] = []
                var currentIndex = text.startIndex
                
                while(currentIndex < text.endIndex) {
                    // So i compare for two situation one is number one is string number
                    for numberWord in stringNumberArr {
                        if text[currentIndex...].hasPrefix(numberWord) {
                            if let number = stringNumber[numberWord] {
                                arrayOfNum.append(number)
                            }
                        }
                    }
                    
                    if let intValue = text[currentIndex].wholeNumberValue {
                        arrayOfNum.append(intValue)
                    }
                    currentIndex = text.index(currentIndex, offsetBy: 1)
                }
                
                if let first = arrayOfNum.first,let last = arrayOfNum.last  {
                    print(first, last)
                    let currentSum = first * 10 + last
                    sum = sum + currentSum
                }
            }
            print(sum)
            
        }
        
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
        return nil
    }
}

