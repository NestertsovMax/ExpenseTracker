//
//  ExpenseListView.swift
//  ExpenseTracker
//
//  Created by M1 on 17.06.2024.
//

import SwiftUI
import CoreData

struct ExpenseListView: View {
    @FetchRequest(
        entity: Expense.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Expense.date, ascending: false)]
    ) var expenses: FetchedResults<Expense>
    
    var body: some View {
        List {
            if expenses.isEmpty {
                Text("No expenses recorded.")
                    .foregroundColor(.gray)
            } else {
                ForEach(expenses) { expense in
                    VStack(alignment: .leading) {
                        Text(expense.category ?? "Unknown Category")
                            .font(.headline)
                        Text("Amount: \(expense.amount, specifier: "%.2f")")
                        Text("Date: \(expense.date ?? Date(), formatter: dateFormatter)")
                    }
                }
            }
        }
        .navigationTitle("Expense List")
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


