//
//  BirthdateQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

struct BirthdateQuestionView: View {
    
    @Binding var birthDate: Birthdate
    @State var month: String = ""
    @State var year: String = ""
    
    private let months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ]
    
    private var years: [String] {
        let currentYear = Calendar.current.component(.year, from: Date())
        let years = Array((currentYear - 100)...(currentYear - 18)).reversed()
        return years.map { "\($0)" }
    }
    
    init(birthDate: Binding<Birthdate>) {
        self._birthDate = birthDate
        
        let bdayValue = birthDate.wrappedValue
        
        self._month = State(initialValue: bdayValue.month)
        self._year = State(initialValue: bdayValue.year)
        
    }
   
    var body: some View {
        DemographicQuestionView(
            demographicQuestion: .birthdate
        ) {
            HStack {
                Picker(
                    "Month",
                    selection: $month) {
                        Text("Select Month").tag("")
                        ForEach(months, id: \.self) { month in
                            Text(month).tag(month)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(maxWidth: .infinity)
    
                Picker("Year", selection: $year) {
                    Text("Select Year").tag("")
                    ForEach(years, id: \.self) { year in
                        Text(year).tag(year)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: .infinity)
                
            }
            .frame(height: 150)
            .onChange(of: month) { _, newValue in
                self.birthDate.month = newValue
            }
            .onChange(of: year) { _, newValue in
                self.birthDate.year = newValue
            }
        }
    }
}

#Preview {
    BirthdateQuestionView(birthDate: .constant(Birthdate()))
        .environmentObject(AppCoordinator())
}
