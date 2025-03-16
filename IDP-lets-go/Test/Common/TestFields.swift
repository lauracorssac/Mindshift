//
//  TestFields.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 13.01.25.
//
import Foundation
struct TestFields {
    
    static let maleQuestions: [String] = ["Ben", "Paul", "Daniel", "John", "Jeffrey"]
    static let femaleQuestions: [String] = ["Rebecca", "Michelle", "Emily", "Julia", "Anna"]
    static let careerQuestions: [String] = [ "Career", "Corporation", "Salary", "Office", "Professional", "Management", "Business"]
    static let familyQuestions: [String] = ["Wedding", "Marriage", "Parents", "Relatives", "Family", "Home", "Children"]
    
    static let categories: [[String]] = [
        ["Family", "Career"],
        ["Male", "Female"],
        ["Male or\nFamily", "Female or\nCareer"],
        ["Male or\nFamily", "Female or\nCareer"],
        ["Career", "Family"],
        ["Career or\nMale", "Family or\nFemale"],
        ["Career or\nMale", "Family or\nFemale"]
    ]
    
    
    static func questions(for category: String) -> [String] {
        var result = [String]()
        
        if category.contains("Male") {
            result.append(contentsOf: TestFields.maleQuestions)
        }
        if category.contains("Female") {
            result.append(contentsOf: TestFields.femaleQuestions)
        }
        if category.contains("Career") {
            result.append(contentsOf: TestFields.careerQuestions)
        }
        if category.contains("Family") {
            result.append(contentsOf: TestFields.familyQuestions)
        }
        
        return result
    }
    
    static func pickRandomCategoryAndQuestion(categories: [String]) -> (Option, String) {
        if let selectedCategory = [Option.left, Option.right].randomElement() {
            
            let randomCategory = selectedCategory
            let matchingQuestions: [String]
            
            switch selectedCategory {
            case .left:
                matchingQuestions = questions(for: categories[0])
            case .right:
                matchingQuestions = questions(for: categories[1])
            }
            
            
            if let selectedQuestion = matchingQuestions.randomElement() {
                return (randomCategory, selectedQuestion)
            }
            
            return (.right, "")
        }
        
        return (.right,"")
    }
}
