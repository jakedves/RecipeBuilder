//
//  IngredientsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients: [Ingredient]
    var headerSize = CGFloat(20)
    
    init(_ ingredients: [Ingredient]) {
        self.ingredients = ingredients
    }
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10, height: 0)
            VStack(alignment: .leading) {
                Text("Ingredients: ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: headerSize))
                ForEach(ingredients, id: \.self) { ingredient in
                    Spacer().frame(height: 5)
                    HStack {
                        Text("   •").bold()
                        Text(ingredient.toString()).font(.body)
                    }
                    
                }
            }
            Spacer()
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(
            [Ingredient("Garlic", Quantity(20, "g")),
             Ingredient("Cheese", Quantity(40, "g"))])
    }
}

struct Bulleted {
    var content: String
    
    init(_ content: String) {
        self.content = "    • " + content
    }
}
