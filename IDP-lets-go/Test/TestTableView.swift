//
//  TestTableView.swift
//  IDP-lets-go
//
//  Created by Umay Bozkurt on 08.01.25.
//

import SwiftUI
struct TableView: View {
    var body: some View {
        VStack {
            Text("Category | Items")
                .bold()
            Text("Male     | Jeffrey, Ben, Paul")
            Text("Female   | Rebecca, Michelle")
            Text("Family   | Relatives")
            Text("Career   | Salary")
        }
        .padding()
        .border(Color.gray, width: 1)
    }
}

struct TestTableView: View {
    let categories = [
           ("Category", "Items"),
           ("Male", "Jeffrey, Ben, Paul"),
           ("Female", "Rebecca, Michelle"),
           ("Family", "Relatives"),
           ("Career", "Salary")
       ]
    
    var body: some View {
        VStack {
            Text("You will use left and right buttons to categorize item.")
                .multilineTextAlignment(.center)
                .padding()
            VStack{
                ForEach(categories, id: \.0) { category, items in
                    HStack {
                        Text(category)
                            .fontWeight(category == "Category" ? .bold : .regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 4)
                        
                        Divider()
                        
                        Text(items)
                            .fontWeight(category == "Category" ? .bold : .regular)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 4)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
        
            Text("There are seven parts. The instructions will change for each part. Pay attention!")
                .multilineTextAlignment(.center)
                .padding()
                .bold()
            Button("Continue") {
                //buttonPressed()
            }.buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }
}
#Preview {
    TestTableView()
        .environmentObject(AppCoordinator())
}
