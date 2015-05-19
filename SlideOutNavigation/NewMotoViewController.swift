//
//  NewMotoViewController.swift
//  SlideOutNavigation
//
//  Created by Macmini_Dagon on 13.05.15.
//  Copyright (c) 2015 James Frost. All rights reserved.
//

import UIKit
import CoreData

class NewMotoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var MarqueTextField: UITextField!
    @IBOutlet var ModelTextField: UITextField!
    @IBOutlet var CylindréeTextField: UITextField!
    @IBOutlet var KilometrageTextField: UITextField!
    @IBOutlet var AnneeTextField: UITextField!
    @IBOutlet var MotoImageView: UIImageView!
    
    
    var imagechangee = false
    
    //numero a transmettre
    var numerosegue:Int16 = 0
  
    
    
    
    //Declaration du MARK: managedObjectContext
    
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    

    
    
    @IBAction func SaveAction(sender: AnyObject){
        
        //compter le nombre de motos en base de données
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let contextmoto:NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "MotoEntities")
        request.returnsObjectsAsFaults = false;
        var results: NSArray = contextmoto.executeFetchRequest(request, error: nil)!
       
        var comptage = results.count + 1 as Int16
        numerosegue = comptage
        
        //Declaration du moc
        let moc = self.managedObjectContext
        
        
         //Ajout en base de données des champs saisis
         // On fera un traitement particulier si le gugus n'a pas mis d'image
         // Pour l'instant j'utilise un autre constructeur sans l'image à sauver
        if MotoImageView.image == nil {
            
            MotoEntities.createInManagedObjectContext(moc!, marque: MarqueTextField.text,model: ModelTextField.text,
                cylindree: CylindréeTextField.text,
                annee: AnneeTextField.text, kilometrage: KilometrageTextField.text, nombre: comptage)
            
                 moc?.save(nil)
            
        }
        else {
  
            let MotoimageData:NSData = UIImagePNGRepresentation(MotoImageView.image)
            
            MotoEntities.createInManagedObjectContext(moc!, marque: MarqueTextField.text,model: ModelTextField.text,
                cylindree: CylindréeTextField.text,
                annee: AnneeTextField.text, kilometrage: KilometrageTextField.text, imagemoto: MotoimageData, nombre: comptage)
            
            moc?.save(nil)
        
        }
       
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        //pour le clique sur la photo
        let tapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "chooseImage:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        MotoImageView.addGestureRecognizer(tapGestureRecognizer)
        MotoImageView.userInteractionEnabled = true
        
    }
    
    
    
    
    
    //Fonction presser
    func longPress(sender:UILongPressGestureRecognizer!) {
        
           if (sender.state == UIGestureRecognizerState.Ended) {
        println("Long press Ended");
         } else if (sender.state == UIGestureRecognizerState.Began) {
                 println("Long press detected.");
         }
    }
    
    //Pour choix image
    
    
    func chooseImage(recognizer:UITapGestureRecognizer){
      
        let imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        //Loguer si l'image a changé
        imagechangee = true
        
    }
    
    
    //Pour la taille de l'image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let pickedImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage!
        
        // small picture
        let smallPicture = scaleImageWith(pickedImage,
            
            // Taille de l'image actuelle
            newSize: CGSizeMake(343, 128))
        
        var sizeOfImageView:CGRect = MotoImageView.frame
        sizeOfImageView.size = smallPicture.size
        MotoImageView.frame = sizeOfImageView
        
        MotoImageView.image = smallPicture
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //Si le choix l'image a été annulé
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        //on dit que l'image n'a pas été changée
        imagechangee = false
    }
    
    
    
    func scaleImageWith(image:UIImage, newSize:CGSize)->UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imagechangee = true
        return newImage
        
    }
    
    //Fin du choix de l'image

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
// MARK: - Navigation Segue
    
    //Envoi de la nouvelle moto à la page principale via un objet segue
    override func prepareForSegue(segnumber: UIStoryboardSegue, sender: AnyObject!) {
        if (segnumber.identifier == "SegueNewMoto") {
            var segnumber = segnumber.destinationViewController as! CenterViewController;
      
            //Passer le numéro de la moto dans le CenterviewController
            
    segnumber.nombre1 = numerosegue
            
        }
    }
    
  
}
