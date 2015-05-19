//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by David on 03/08/2014.
//  Copyright (c) 2014 David. All rights reserved.
//

import UIKit
import CoreData

@objc
protocol CenterViewControllerDelegate {
  optional func toggleLeftPanel()
  optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
  
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var marqueLabel: UILabel!
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var cylindreeLabel: UILabel!
    @IBOutlet var kilometrageLabel: UILabel!
    @IBOutlet var retourinfoLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    @IBOutlet var anneeLabel: UILabel!
    @IBOutlet var motoImage: UIImageView!
 
    var nombre1:Int16 = 0
    
 
    
    
    @IBAction func cleanButton(sender: AnyObject) {
        //Nettoyer la base de données
      
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
<<<<<<< HEAD
        let motos  = loadMoto() as [NSManagedObject]
=======
        let contextmoto:NSManagedObjectContext = appDel.managedObjectContext!
>>>>>>> origin/master
        
            let modelURL = NSBundle.mainBundle().URLForResource("SlideOutNavigation", withExtension: "momd")
        
            let mom = NSManagedObjectModel(contentsOfURL: modelURL!)
            
            for entityName in mom!.entitiesByName.keys {
                let fr = NSFetchRequest(entityName: "MotoEntities")
                var results: NSArray = contextmoto.executeFetchRequest(fr, error: nil)!

                for mo in results {
                    contextmoto.deleteObject(mo as! NSManagedObject)
                }
            }
            
            contextmoto.save(nil)
            retourinfoLabel.text = "Base nettoyée!"
            modelLabel.text = ""
            marqueLabel.text = ""
            cylindreeLabel.text = ""
            kilometrageLabel.text = ""
            anneeLabel.text = ""

        
           }
    
    
    @IBAction func fetchbutton(sender: AnyObject) {

        
        //Pour rechercher une moto précise
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let contextmoto:NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "MotoEntities")
        
        request.returnsObjectsAsFaults = false;
       
        

        //Recherche par Nom
        request.predicate = NSPredicate(format: "marquemoto = %@", searchTextField.text)
        
      
        var results: NSArray = contextmoto.executeFetchRequest(request, error: nil)!
       
        //pour une boucle lorsqu'on a plusieurs résultats
        // for resultat in results {
        
        if results.count == 1  {

            var motoItem = results[0] as! MotoEntities
                modelLabel.text = motoItem.modelmoto
                marqueLabel.text = motoItem.marquemoto
                cylindreeLabel.text = motoItem.cylindreemoto
                kilometrageLabel.text = motoItem.kilometragemoto
                anneeLabel.text = motoItem.anneemoto
            
            //convertir int to String
            let nombretostring : Int16 = motoItem.nombre
            var myString = String(nombretostring)
            numberLabel.text = myString
            
            //remettre à vide l'info texte
                retourinfoLabel.text = ""
            
            retourinfoLabel.text = "Trouvé \(results.count) résultat(s) avec la recherche. "
            
        }
            
        else    {
      
            
            retourinfoLabel.text = "Trouvé \(results.count) résultat(s) avec la recherche. "
                }
       
      //  }
        
    }
    
  var delegate: CenterViewControllerDelegate?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        var motos = [MotoEntities].self
        
        
        
        //Pour savoir si c'est le premier enregistrement dans la base
        let managedObjectContext =
        (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext

        let fetchRequest = NSFetchRequest(entityName:"MotoEntities")
 
        var error: NSError?
        
        let fetchedResults =
        managedObjectContext!.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        

        if fetchedResults?.count == 0 {
            let nv = self.storyboard!.instantiateViewControllerWithIdentifier("NewMotoView") as! NewMotoViewController
            
            self.navigationController!.pushViewController(nv, animated: true)
       

        }
        
        if nombre1 > 0 {

            
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let contextmoto:NSManagedObjectContext = appDel.managedObjectContext!
            
            let request = NSFetchRequest(entityName: "MotoEntities")
            
            request.returnsObjectsAsFaults = false;
            
            
            request.predicate = NSPredicate(format: "nombre = %d", nombre1)

            var results: NSArray = contextmoto.executeFetchRequest(request, error: nil)!

            
                var motoItem = results[0] as! MotoEntities
                modelLabel.text = motoItem.modelmoto
                marqueLabel.text = motoItem.marquemoto
                cylindreeLabel.text = motoItem.cylindreemoto
                kilometrageLabel.text = motoItem.kilometragemoto
                anneeLabel.text = motoItem.anneemoto
                
                //convertir int to String
                let nombretostring : Int16 = motoItem.nombre
                var myString = String(nombretostring)
                numberLabel.text = myString
                
                //remettre à vide l'info texte
                retourinfoLabel.text = ""
                
                retourinfoLabel.text = "Trouvé \(results.count) résultat(s) avec la recherche. "

        
        }
        
        
         //terminé recherche du premier enregistrement
        println(fetchedResults?.count)

        
    }
    

    
    
   
  // MARK: Button menu actions
  
  @IBAction func BarreTapped(sender: AnyObject) {
    delegate?.toggleLeftPanel?()
   
  }
    
    
  
}


extension CenterViewController: SidePanelViewControllerDelegate {
<<<<<<< HEAD
    func menuSelected(motos: MotoEntities) {
        motoImage.image = motos.imagemoto as! UIImage
        marqueLabel.text = motos.marquemoto
        modelLabel.text = motos.modelmoto
=======
    func menuSelected(menu: Menu) {
        motoImage.image = menu.image
        marqueLabel.text = menu.title
        modelLabel.text = menu.creator
>>>>>>> origin/master
        
        delegate?.collapseSidePanels?()
    }
    
}
