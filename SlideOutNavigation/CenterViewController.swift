//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import CoreData

@objc
protocol CenterViewControllerDelegate {
  optional func toggleLeftPanel()
  optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
  
    @IBOutlet var marqueLabel: UILabel!
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var cylindreeLabel: UILabel!
    @IBOutlet var kilometrageLabel: UILabel!
    
    @IBOutlet var anneeLabel: UILabel!
    @IBOutlet var motoImage: UIImageView!
    
  var delegate: CenterViewControllerDelegate?
  
  //champ pour nouvelle moto
    var marque:String!
    var modele: String!
    var cylindree: String!
    var kilometrage: String!
    var annee: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
         //terminé recherche du premier enregistrement
        

        
    }
    
    
    
    
    
    
    
    
    
   
  // MARK: Button menu actions
  
  @IBAction func kittiesTapped(sender: AnyObject) {
    delegate?.toggleLeftPanel?()
  }
    

  
}