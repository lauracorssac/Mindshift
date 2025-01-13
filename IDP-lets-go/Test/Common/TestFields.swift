//
//  TestFields.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 13.01.25.
//
import Foundation
struct TestFields {
    static let categories: [String] = ["Family", "Career", "Male", "Female", "Male or Family", "Female or Career", "Male or Career", "Female or Family"]
    static let maleQuestions: [String] = ["Ben", "Paul", "Daniel", "John", "Jeffrey"]
    static let femaleQuestions: [String] = ["Rebecca", "Michelle", "Emily", "Julia", "Anna"]
    static let careerQuestions: [String] = [ "Career", "Corporation", "Salary", "Office", "Professional", "Management", "Business"]
    static let familyQuestions: [String] = ["Wedding", "Marriage", "Parents", "Relatives", "Family", "Home", "Children"]
    
    static let partOneCategories: [String] = ["Family", "Career"]
    static let partTwoCategories: [String] = ["Male", "Female"]
    static let partThreeCategories: [String] = ["Male or Family", "Female or Career"]
    static let partFourCategories: [String] = ["Male or Family", "Female or Career"]
    static let partFiveCategories: [String] = ["Career", "Family"]
    static let partSixCategories: [String] = ["Career or Male", "Family or Female"]
    static let partSevenCategories: [String] = ["Career or Male", "Family or Female"]
    
    
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
    
    static func pickRandomCategoryAndQuestion(selectedCategory1: String, selectedCategory2: String) -> (String, String) {
        if let selectedCategory = [selectedCategory1, selectedCategory2].randomElement() {
            let randomCategory = selectedCategory
            let matchingQuestions = questions(for: selectedCategory)
            
            if let selectedQuestion = matchingQuestions.randomElement() {
                let randomQuestion = selectedQuestion
                return (randomCategory, selectedQuestion)
            }
            
            return ("", "")
        }
        
        return ("","")
    }
}
