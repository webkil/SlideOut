//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by webkiller on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import CoreData

@objc
protocol SidePanelViewControllerDelegate {
    func menuSelected(motos: MotoEntities)
}

class SidePanelViewController: UIViewController {
  
    @IBOutlet var marqueProfilLabel: UILabel!
    @IBOutlet var modelProfilLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var profilImage: UIImageView!
    
    var delegate: SidePanelViewControllerDelegate?
  
    let motos:[NSManagedObject] = []
    
  struct TableView {
    struct CellIdentifiers {
      static let MenuCell = "MenuCell"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let motos = loadMoto() as[NSManagedObject]
    
    tableView.reloadData()
    
    let indexPathDefault = NSIndexPath(forRow: 0, inSection: 0)
    tableView.selectRowAtIndexPath(indexPathDefault , animated: true,  scrollPosition: UITableViewScrollPosition.None)
    
    let selectedDefaultMoto : MotoEntities = motos[0] as! MotoEntities
    
    profilImage.image = selectedDefaultMoto.imagemoto as! UIImage
    marqueProfilLabel.text = selectedDefaultMoto.marquemoto
    modelProfilLabel.text = selectedDefaultMoto.modelmoto
    
    profilImage.layer.masksToBounds = true
    profilImage.layer.borderColor = UIColor.whiteColor().CGColor
    profilImage.layer.cornerRadius = profilImage.frame.size.height/2
    
    profilImage.layer.borderWidth = 2
    profilImage.frame.origin.x = 20
    
  }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2//motos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.MenuCell, forIndexPath: indexPath) as! MenuCell
        cell.configureForMenu(motos[indexPath.row] as! MotoEntities)
        return cell
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

  
}



// MARK: Table View Data Source

//extension SidePanelViewController: UITableViewDataSource {
//  
//    
//}

// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    let selectedMoto:MotoEntities = motos[indexPath.row] as! MotoEntities
    //profilImage.image = selectedMoto.imagemoto as! UIImage

    marqueProfilLabel.text = selectedMoto.marquemoto
    modelProfilLabel.text = selectedMoto.modelmoto
    
    delegate?.menuSelected(selectedMoto)
    
  }
  
}

class MenuCell: UITableViewCell {
  
  @IBOutlet var imageMotoView: UIImageView!
  @IBOutlet var marqueMotoLabel: UILabel!
  @IBOutlet var modeleMotoLabel: UILabel!
  
    
    func configureForMenu(test: MotoEntities) {
    imageMotoView.image = test.imagemoto as! UIImage
    marqueMotoLabel.text = test.marquemoto
    modeleMotoLabel.text = test.modelmoto
      
//    imageMotoView.layer.cornerRadius = imageMotoView.layer.frame.size.width/2
//    imageMotoView.layer.masksToBounds = true
//    imageMotoView.layer.borderWidth = 1.0
//    imageMotoView.layer.borderColor = UIColor.whiteColor().CGColor
//    
  }
  
}