//
//  MotoEntities.swift
//  SlideOutNavigation
//
//  Created by Macmini_Dagon on 13.05.15.
//  Copyright (c) 2015 James Frost. All rights reserved.
//

import Foundation
import CoreData

class MotoEntities: NSManagedObject {

    @NSManaged var marquemoto: String
    @NSManaged var modelmoto: String
    @NSManaged var cylindreemoto: String
    @NSManaged var anneemoto: String
    @NSManaged var kilometragemoto: String
    @NSManaged var imagemoto: NSData
    @NSManaged var nombre: Int16

   
    
    
    
    // Construction d'une classe pour créer un objet dans la base de données
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, marque: String, model: String, cylindree: String, annee: String, kilometrage: String, imagemoto: NSData, nombre: Int16) -> MotoEntities {
        
        let newmoto = NSEntityDescription.insertNewObjectForEntityForName("MotoEntities", inManagedObjectContext: moc) as! MotoEntities
        
        newmoto.marquemoto = marque
        newmoto.modelmoto = model
        newmoto.cylindreemoto = cylindree
        newmoto.anneemoto = annee
        newmoto.kilometragemoto = kilometrage
        newmoto.imagemoto = imagemoto
        newmoto.nombre = nombre

        return newmoto
    
        
    }
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, marque: String, model: String, cylindree: String, annee: String, kilometrage: String, nombre: Int16) -> MotoEntities {
        
        let newmoto = NSEntityDescription.insertNewObjectForEntityForName("MotoEntities", inManagedObjectContext: moc) as! MotoEntities
        
        newmoto.marquemoto = marque
        newmoto.modelmoto = model
        newmoto.cylindreemoto = cylindree
        newmoto.anneemoto = annee
        newmoto.kilometragemoto = kilometrage
        newmoto.nombre = nombre
        
        
        return newmoto
        
        
    }

    
    
    
    
    
}
