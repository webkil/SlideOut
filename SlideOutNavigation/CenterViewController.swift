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
  
  //champ pour afficher la moto sélectionnée
    var marque:String!
    var modele: String!
    var cylindree: String!
    var kilometrage: String!
    var annee: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let motos = loadMoto()
        
        if motos.count == 0 {
            let nv = self.storyboard!.instantiateViewControllerWithIdentifier("NewMotoView") as! NewMotoViewController
            self.navigationController!.pushViewController(nv, animated: true)
        } else {
        
            var motoAffiche : MotoEntities  = motos[0] as! MotoEntities
            marqueLabel.text = motoAffiche.marquemoto
            modelLabel.text = motoAffiche.modelmoto
            cylindreeLabel.text = motoAffiche.cylindreemoto
            kilometrageLabel.text = motoAffiche.kilometragemoto
            anneeLabel.text = motoAffiche.anneemoto
        
        }
        
        
        
    }
    
    
    func loadMoto() -> [NSManagedObject] {
        let managedObjectContext =
        (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext
        
        
        let fetchRequest = NSFetchRequest(entityName:"MotoEntities")
        
        var error: NSError?
        
        let fetchedResults =
        managedObjectContext!.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        
        return fetchedResults!
        
    }
    
    
    
    
    
    
   
  // MARK: Button menu actions
  
  @IBAction func BarreTapped(sender: AnyObject) {
    delegate?.toggleLeftPanel?()
  }
    
    
  
}


extension CenterViewController: SidePanelViewControllerDelegate {
    func menuSelected(menu: Menu) {
        motoImage.image = menu.image
        marqueLabel.text = menu.title
        modelLabel.text = menu.creator
        
        delegate?.collapseSidePanels?()
    }
}
