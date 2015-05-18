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
    @IBAction func fetchbutton(sender: AnyObject) {
        
         let fetchRequest = NSFetchRequest(entityName: "MotoEntities")
    
    
    
    
    
    
    
    }
    
  var delegate: CenterViewControllerDelegate?
  
  //champ pour nouvelle moto
    var marque:String!
    
    
    
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
            error: &error) as? [MotoEntities]
        

        if fetchedResults?.count == 0 {
            let nv = self.storyboard!.instantiateViewControllerWithIdentifier("NewMotoView") as! NewMotoViewController
            
            self.navigationController!.pushViewController(nv, animated: true)
 
            
            
        }
         //terminé recherche du premier enregistrement
        println(fetchedResults?.count)

        
    }
    
    
    
    
    
    
    
    
    
   
  // MARK: Button menu actions
  
  @IBAction func BarreTapped(sender: AnyObject) {
    delegate?.toggleLeftPanel?()
    println("ici")
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
