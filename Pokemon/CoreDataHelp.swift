//
//  CoreDataHelp.swift
//  Pokemon
//
//  Created by the Luckiest on 6/13/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import UIKit
import CoreData

func addAllPokemon () {
    createPokemon(name: "Mew", imageName: "mew")
    createPokemon(name: "Meowth", imageName: "meowth")
    createPokemon(name: "Abra", imageName: "abra")
    createPokemon(name: "Bullbasaur", imageName: "bullbasaur")
    createPokemon(name: "Caterpie", imageName: "caterpie")
    createPokemon(name: "Candy", imageName: "candy")
    createPokemon(name: "Eevee", imageName: "eevee")
    createPokemon(name: "Mankey", imageName: "mankey")
    createPokemon(name: "Rattata", imageName: "rattata")
    createPokemon(name: "Snorlax", imageName: "snorlax")
    createPokemon(name: "Squirtle", imageName: "squirtle")
    createPokemon(name: "Zobat", imageName: "zubat")
    createPokemon(name: "Pikachu", imageName: "pikachu-2")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
}

func createPokemon (name : String, imageName : String) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let pokemon = Pokemon(context: context)
    pokemon.name = name
    pokemon.imageName = imageName
}

func getAllPokemons () -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
        let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        if pokemons.count == 0 {
            addAllPokemon()
            return getAllPokemons()
        }
        return pokemons
    } catch {
        
    }
    return []
}

func getAllCaughtPokemons () -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetch = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    fetch.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    
    do {
        let pokemons = try context.fetch(fetch) 
        return pokemons
    } catch {
        
    }
    return []
}

func getAllUncaughtPokemons () -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetch = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    fetch.predicate = NSPredicate(format: "caught == %@", false as CVarArg)
    
    do {
        let pokemons = try context.fetch(fetch)
        return pokemons
    } catch {
        
    }
    return []
}
