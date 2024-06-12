//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by M1 on 10.06.2024.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var amount = ""
    @State private var category = ""
    @State private var date = Date()

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                TextField("Category", text: $category)
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            .navigationBarTitle("Add Expense")
            .navigationBarItems(trailing:
                                    Button("Save") {
                                        if let amount = Double(self.amount) {
                                            CoreDataManager.shared.saveExpense(name: self.name, amount: amount, category: self.category, date: self.date)
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                                    }

            )
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
