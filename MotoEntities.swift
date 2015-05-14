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
    
    
    
    // Construction d'une classe pour créer un objet dans la base de données
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, marque: String, model: String, cylindree: String, annee: String, kilometrage: String, imagemoto: NSData) -> MotoEntities {
        
        let newmoto = NSEntityDescription.insertNewObjectForEntityForName("MotoEntities", inManagedObjectContext: moc) as! MotoEntities
        
        newmoto.marquemoto = marque
        newmoto.modelmoto = model
        newmoto.cylindreemoto = cylindree
        newmoto.anneemoto = annee
        newmoto.kilometragemoto = kilometrage
        newmoto.imagemoto = imagemoto
  
       
        return newmoto
    }
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, marque: String, model: String, cylindree: String, annee: String, kilometrage: String) -> MotoEntities {
        
        let newmoto = NSEntityDescription.insertNewObjectForEntityForName("MotoEntities", inManagedObjectContext: moc) as! MotoEntities
        
        newmoto.marquemoto = marque
        newmoto.modelmoto = model
        newmoto.cylindreemoto = cylindree
        newmoto.anneemoto = annee
        newmoto.kilometragemoto = kilometrage
    
        
        
        return newmoto
    }

    
    
    
    
    
}
