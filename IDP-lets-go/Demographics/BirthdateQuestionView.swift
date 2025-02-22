////
////  BirthdateQuestionView.swift
////  IDP-lets-go
////
////  Created by Laura Corssac on 16.12.24.
////
//
//import SwiftUI
//
//struct BirthdateQuestionView: View {
//    
//    @Binding var birthYear: String
//    
//    private var years: [String] {
//        
//    }
//   
//    var body: some View {
//        DemographicQuestionView(
//            demographicQuestion: .birthdate
//        ) {
//            
//            Picker("Year", selection: $birthYear) {
//                Text("Select Year").tag("")
//                ForEach(years, id: \.self) { year in
//                    Text(year).tag(year)
//                }
//            }
//            .pickerStyle(WheelPickerStyle())
//            .frame(maxWidth: .infinity)
//            .frame(height: 150)
//        }
//    }
//}
//
//#Preview {
//    BirthdateQuestionView(birthYear: .constant(""))
//        .environmentObject(AppCoordinator())
//}
