//
//  ContentView.swift
//  MealGenerator
//
//  Created by Snehal Patil on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mealGenerator = MealGenerator()
    var actionButton: some View {
        Button("Get Random Meal") {
            mealGenerator.fetchRandomMeal()
        }.foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(16)
        .onAppear {
            mealGenerator.fetchRandomMeal()
        }
    }
    
    var body: some View {
        ScrollView {
            
            
            VStack {
                actionButton
                if let name = mealGenerator.currentMeal?.name {
                    Text(name)
                        .font(.largeTitle)
                    
                }
                AsyncImageView(urlString: $mealGenerator.currentImageUrlString)
                if let ingredients = mealGenerator.currentMeal?.ingredients {
                    HStack{
                        Text("Ingredients")
                            .font(.title)
                        Spacer()
                        
                    }
                    
                    ForEach(ingredients, id:\.self){ ingredient in
                        HStack {
                            Text(ingredient.name + " - " + ingredient.measure)
                            Spacer()
                        }
                    }
                    Spacer()
                    
                    if let instructions = mealGenerator.currentMeal?.instructions {
                        HStack {
                            Text("Instructions")
                                .font(.title)
                            Spacer()
                        }
                        
                        Text(instructions)
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
