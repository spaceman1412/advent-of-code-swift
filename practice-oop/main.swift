//
//  main.swift
//  practice-oop
//
//  Created by H470-088 on 24/10/24.
//

import Foundation

let filePath = "/Users/chaileasevn/Downloads/input.txt"

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


