//
//  NewRecipeForm.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct NewRecipeForm: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var nextIngredient: String = ""
    @State var nextInstruction: String = ""
    @State var ingredients: [String] = []
    @State var instructions: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Recipe Name:")) {
                        TextField("Recipe Name", text: $name)
                    }
                    
                    Section(header: FormHeader(text: "Ingredients:",
                                               list: $ingredients,
                                               content: $nextIngredient)) {
                        List {
                            TextField("Ingredient " + String(ingredients.count + 1),
                                      text: $nextIngredient)
                            ForEach(ingredients, id: \.self) { ingredient in
                                Text(ingredient)
                            }
                            .onDelete(perform: { indexSet in
                                deleteElement(at: indexSet, list: $ingredients)
                            })
                        }
                    }
                    
                    Section(header: FormHeader(text: "Instructions:",
                                               list: $instructions,
                                               content: $nextInstruction)) {
                        List {
                            TextField("Instruciton " + String(instructions.count + 1), text: $nextInstruction)
                            ForEach(instructions, id: \.self) { instruction in
                                Text(instruction)
                            }
                            .onDelete(perform: { indexSet in
                                deleteElement(at: indexSet, list: $instructions)
                            })
                        }
                    }
                    
                    Section(header: Text("Add a photo")) {
                        
                    }
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarItems(
                leading: Button("Cancel") { self.presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    self.saveEntry()
                                })
        }
    }
    
    func saveEntry() {
        let recipe = Recipe()
        recipe.id = UUID()
        recipe.name = name
        recipe.image = nil
        recipe.ingredients = ingredients
        recipe.instructions = instructions
        // save to managedobjectcontext
    }
    
    
    // Should delete element and fix all other elements in the list
    // TODO: Fix the .dropFirst to make it drop the numbers at the start
    // TODO: Make dropFirst optional and only apply to instructions
    func deleteElement(at offsets: IndexSet, list: Binding<[String]>) {
        list.wrappedValue.remove(atOffsets: offsets)
        
        for index in 0...list.wrappedValue.count - 1 {
            list.wrappedValue[index] = String(index + 1) + ". " + String(list.wrappedValue[index].dropFirst(3))
        }
    }
}

struct NewRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeForm()
    }
}
