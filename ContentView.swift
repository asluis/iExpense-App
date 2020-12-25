//
//  ContentView.swift
//  iExpense App
//
//  Created by Luis Alvarez on 12/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    @State var showNewExpenseView = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.expenseList){ item in
                    VStack(alignment: .leading){
                        HStack{
                            Text(item.name)
                                .font(.headline)
                            Spacer()
                            Text(String(format: "%.2f", item.price))
                                .font(.headline)
                        }
                        Spacer()
                        Text(item.type)
                    }
                }.onDelete(perform: deleteOffSet)
            }
            .navigationTitle(Text("iExpense"))
            .navigationBarItems(leading: EditButton(), trailing:
                
                Button(action: {
                    showNewExpenseView = true
                }){
                    Image(systemName: "plus")
                        .padding(5)
                }
            )
            .sheet(isPresented: $showNewExpenseView){
                AddExpense_UI(expenses: expenses)
            }
        }
    }
    

    
    func deleteOffSet(at offset: IndexSet){
        self.expenses.expenseList.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
