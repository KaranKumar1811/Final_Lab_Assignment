//
//  FirstViewController.swift
//  Final_Lab_Assignment
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 Karan. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {
var productsArray : [Product]?
    
    var product : Product?
    

    @IBOutlet weak var descTxt1: UITextView!

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var idLbl: UILabel!
       @IBOutlet weak var priceLbl: UILabel!
    @IBAction func viewBtn(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
               
                     let newVC = sb.instantiateViewController(identifier: "viewvc") as! ViewController
                     
                     navigationController?.pushViewController(newVC, animated: true)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
             
              if defaults.bool(forKey: "bool1")
              {
                  productsArray?.removeAll()
              
                  self.loadCoreData()
                               nameLbl.text = productsArray![0].name
                                  idLbl.text = String(productsArray![0].id)
                                  descTxt1.text = productsArray![0].desc
                                  priceLbl.text = String(productsArray![0].price)
                               
                      
                clearCoreData()
                  
              }
              else
              {
                
                  let getdata = Singleton.getInstance()
                                getdata.createProduct()
                              productsArray = getdata.returnProductArray()
            

                            self.saveCoreData(array: productsArray!)
            
                  self.loadCoreData()
                              nameLbl.text = productsArray![0].name
                                               idLbl.text = String(productsArray![0].id)
                                               descTxt1.text = productsArray![0].desc
                                               priceLbl.text = String(productsArray![0].price)
                                            
                                            clearCoreData()
                 
                  defaults.set(true, forKey: "bool1")
              
                
                  
              }

        

        // Do any additional setup after loading the view.
    }
    
    
    func loadCoreData()
     {
         
         productsArray = [Product]()

         let appDelegate = UIApplication.shared.delegate as! AppDelegate
               
                let context = appDelegate.persistentContainer.viewContext
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
         do{
             let results = try context.fetch(fetchRequest)
             if results is [NSManagedObject]
             {
                 for result in results as! [NSManagedObject]
                 {
                     let id = result.value(forKey: "id") as! Int16
                     let name = result.value(forKey: "name") as! String
                     let desc = result.value(forKey: "desc") as! String
                     let price = result.value(forKey: "price") as! Float
                     
                    productsArray?.append(Product(id: id, name: name, desc: desc, price: price))
                     

                 }
             }
         } catch{
             print(error)
         }
        clearCoreData()
                       
         
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newvc = segue.destination as? ViewController
        {
            self.clearCoreData()
        }
    }
    
    func saveCoreData(array : [Product]){
           
           clearCoreData()
           
           // create an instance of app delegate
           
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           
            let context = appDelegate.persistentContainer.viewContext
      
           for product in array{
               
               let taskEntity = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)
              taskEntity.setValue(product.id, forKey: "id")
              taskEntity.setValue(product.name, forKey: "name")
              taskEntity.setValue(product.desc, forKey: "desc")
               //let timestamp = Date().currentTimeMillis();
              taskEntity.setValue(product.price, forKey: "price")
               
               do
               {
                    try context.save()
                   
               }catch
               {
                   print(error)
               }

           }
       }

       func clearCoreData ()
       {

                  let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        
                         let context = appDelegate.persistentContainer.viewContext
                  let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
           fetchRequest.returnsObjectsAsFaults = false
           do{
               let results = try context.fetch(fetchRequest)
               
               for managedObjects in results{
                   if let managedObjectsData = managedObjects as? NSManagedObject
                   {
                       context.delete(managedObjectsData)
                   }
               
               }
           }catch{
               print(error)
           }
       
       }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
