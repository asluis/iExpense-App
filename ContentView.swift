//
//  ContentView.swift
//  iExpense App
//
//  Created by Luis Alvarez on 12/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.expenseList){ item in
                    VStack{
                        Text("TEst")
                    }
                }
            }
            .navigationTitle(Text("iExpense"))
            .navigationBarItems(leading: EditButton(), trailing:
                
                Button(action: {
                    // Actions
                }){
                    Image(systemName: "plus")
                        .padding(5)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
