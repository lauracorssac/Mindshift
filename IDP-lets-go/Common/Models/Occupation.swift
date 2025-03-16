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
    case architecture = "architecture"
    case arts = "arts"
    case business = "business"
    case constructionExtraction = "constructionExtraction"
    case design = "design"
    case education = "education"
    case engineers = "engineering"
    case entretainment = "entretainment"
    case farmingFishingForestry = "farmingFishingForestry"
    case foodService = "foodService"
    case healthcare = "healthcare"
    case informatics = "informatics"
    case homemakerParenting = "homemakerParenting"
    case maintenance = "maintenance"
    case management = "management"
    case math = "math"
    case military = "military"
    case production = "production"
    case protectiveService = "protectiveService"
    case repairInstallation = "repairInstallation"
    case sales = "sales"
    case sports = "sports"
    case science = "science"
    case serviceAndPersonalCare = "serviceAndPersonalCare"
    case socialService = "socialService"
    case transportation = "transportation"
    case unemployed = "unemployed"
    
    func displayName() -> String {
        switch self {
        case .administrativeSupport:
            return "Administrative Support"
        case .arts:
            return "Arts"
        case .architecture:
            return "Architecture"
        case .business:
            return "Business"
        case .constructionExtraction:
            return "Construction/Extraction"
        case .design:
            return "Design"
        case .education:
            return "Education"
        case .engineers:
            return "Engineering"
        case .entretainment:
            return "Entretainment"
        case .farmingFishingForestry:
            return "Farming/Fishing/Forestry"
        case .foodService:
            return "Food Service"
        case .healthcare:
            return "Healthcare"
        case .homemakerParenting:
            return "Homemaker/Parenting"
        case .informatics:
            return "Informatics"
        case .maintenance:
            return "Maintenance"
        case .management:
            return "Management"
        case .math:
            return "Math"
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
        case .sports:
            return "Sports"
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
