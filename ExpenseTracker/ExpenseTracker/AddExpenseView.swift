//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by M1 on 17.06.2024.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var date = Date()

    var body: some View {
        Form {
            Section(header: Text("Expense Details")) {
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                
                TextField("Category", text: $category)
                
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            
            Button(action: {
                addExpense()
            }) {
                Text("Save Expense")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Add Expense")
    }
    
    private func addExpense() {
        let newExpense = Expense(context: viewContext)
        newExpense.amount = Double(amount) ?? 0.0
        newExpense.category = category
        newExpense.date = date
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



