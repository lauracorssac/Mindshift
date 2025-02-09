//
//  DemographicsWrapperView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 02.02.25.
//

import SwiftUI

struct DemographicsWrapperView: View {
    
    let questions: [DemographicQuestion] = [.gender, .birthdate, .race,.educationBackground, .profession]
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @State private var currentStep: Int = 0
    @State private var currentProgress: Int = 1
    @State private var ended = false
    @State private var userState: User = UserModel.user
    
    var totalSteps: Int {
        questions.count
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            StepProgressView(
                currentStep: currentProgress,
                totalSteps: totalSteps + 1
            )
            .frame(height: 30)
            .padding(.top, 16)
            .scaleEffect(ended ? 1.1 : 1.0)
            
            
            Spacer()
            
            buildMiddleView(for: questions[currentStep])
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .leading)
                ))
            
            Button("Submit") {
                buttonPressed()
            }.buttonStyle(
                RoundedButtonStyle(
                    fixedWidth: 100,
                    fixedHeight: nil,
                    isDisabled: isButtonDisabled(for: questions[currentStep])
                )
            )
            .padding(.bottom, 16)
            .disabled(isButtonDisabled(for: questions[currentStep]))
            
            
        }.toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Button(action: {
                    currentStep -= 1
                    currentProgress -= 1
                }, label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.mainBlue)
                }).opacity(currentStep == 0 ? 0 : 1)
            })
        }
    }
        
    
    private func isButtonDisabled(for step: DemographicQuestion) -> Bool {
        
        switch step {
            
        case .race:
            return userState.race.isEmpty
        case .birthdate:
            return userState.birthdate.isEmpty
        case .gender:
            return userState.gender.isEmpty
        case .educationBackground:
            return userState.education.isEmpty
        case .mmock:
            return true
        case .profession:
            return userState.profession.isEmpty
        }
        
    }
    
    
    private func buttonPressed() {
        
        if currentStep + 1 < totalSteps {
            withAnimation(Animation.easeInOut, {
                currentProgress += 1
                currentStep += 1
            })
        } else {
            withAnimation(Animation.spring(dampingFraction: 0.1), {
                currentProgress += 1
                ended = true
            })
            
            withAnimation(Animation.easeIn.delay(1.0).speed(1)) {
                ended = false
            }
            
            // TODO: move this from view
            Task {
                let result = await Requests.shared.saveUser()
                switch result {
                case .success:
                    coordinator.pushNext(to: .demographics)
                case .error:
                    // TODO: treat
                    print("error saving data")
                }
            }
        }
    
    }
    
    @ViewBuilder
    private func buildMiddleView(for step: DemographicQuestion) -> some View {
        
        switch(step) {
            
        case .birthdate:
            BirthdateQuestionView(
                birthDate: .init(
                    get: { userState.birthdate },
                    set: { birthdate in
                        userState.birthdate = birthdate
                    }))
            
        case .race:
            
            StringPickerView(
                value: .init(
                    get: { userState.race },
                    set: { race in
                        userState.race = race
                    }),
                demographicQuestion: step
            )
            
            
        case .gender:
            StringPickerView(
                value: .init(
                    get: { userState.gender },
                    set: { gender in
                        userState.gender = gender
                    }),
                demographicQuestion: step
            )
            
            
        case .profession:
            StringPickerView(
                value: .init(
                    get: { userState.profession },
                    set: { profession in
                        userState.profession = profession
                    }),
                demographicQuestion: step
            )
            
        case .educationBackground:
            StringPickerView(
                value: .init(
                    get: { userState.education },
                    set: { education in userState.education = education }
                ),
                demographicQuestion: step
            )
        case .mmock:
            Text("Mock")
            
        }
        
    }
}



#Preview {
    NavigationStack {
        DemographicsWrapperView()
            .environmentObject(AppCoordinator())
    }
}
