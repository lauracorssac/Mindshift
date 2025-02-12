//
//  Profession.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 05.02.25.
//

import Foundation

enum Occupation: String, CaseIterable, Identifiable {
    
    var id: String {
        self.rawValue
    }
    
    case administrativeSupport = "administrativeSupport"
    case artsDesignEntertainmentSports = "artsDesignEntertainmentSports"
    case business = "business"
    case computerMath = "computerMath"
    case constructionExtraction = "constructionExtraction"
    case education = "education"
    case engineersArchitects = "engineersArchitects"
    case farmingFishingForestry = "farmingFishingForestry"
    case foodService = "foodService"
    case healthcare = "healthcare"
    case homemakerParenting = "homemakerParenting"
    case maintenance = "maintenance"
    case management = "management"
    case military = "military"
    case production = "production"
    case protectiveService = "protectiveService"
    case repairInstallation = "repairInstallation"
    case sales = "sales"
    case science = "science"
    case serviceAndPersonalCare = "serviceAndPersonalCare"
    case socialService = "socialService"
    case transportation = "transportation"
    case unemployed = "unemployed"
    
    func displayName() -> String {
        switch self {
        case .administrativeSupport:
            return "Administrative Support"
        case .artsDesignEntertainmentSports:
            return "Arts/Design/Entertainment/Sports"
        case .business:
            return "Business"
        case .computerMath:
            return "Computer/Math"
        case .constructionExtraction:
            return "Construction/Extraction"
        case .education:
            return "Education"
        case .engineersArchitects:
            return "Engineers/Architects"
        case .farmingFishingForestry:
            return "Farming, Fishing, Forestry"
        case .foodService:
            return "Food Service"
        case .healthcare:
            return "Healthcare"
        case .homemakerParenting:
            return "Homemaker or Parenting"
        case .maintenance:
            return "Maintenance"
        case .management:
            return "Management"
        case .military:
            return "Military"
        case .production:
            return "Production"
        case .protectiveService:
            return "Protective Service"
        case .repairInstallation:
            return "Repair/Installation"
        case .sales:
            return "Sales"
        case .science:
            return "Science"
        case .serviceAndPersonalCare:
            return "Service and Personal Care"
        case .socialService:
            return "Social Service"
        case .transportation:
            return "Transportation"
        case .unemployed:
            return "Unemployed"
        }
    }
}
