//
//  ViewController.swift
//  Final_Lab_Assignment
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 Karan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    
   var productsArray : [Product]?
    var productArray : [Product]?
    
     var isSearch = false
     var searchArray : [Product]?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableProducts: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableProducts.delegate = self
        tableProducts.dataSource = self
        searchBar.delegate = self
      
        let defaults = UserDefaults.standard
        productArray?.removeAll()
        productsArray?.removeAll()
        defaults.set(false, forKey: "bool")
        if defaults.bool(forKey: "bool")
        {
            productsArray?.removeAll()
            productArray?.removeAll()
            self.clearCoreData()
            self.loadCoreData()
                         
                   tableProducts.reloadData()
            
        }
        else
        {
            let getdata = Singleton.getInstance()
                          getdata.createProduct()
                        productsArray = getdata.returnProductArray()
         
                      self.saveCoreData(array: productsArray!)
            productArray?.removeAll()

            self.loadCoreData()
                        
                  tableProducts.reloadData()
            defaults.set(true, forKey: "bool")
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productArray?.removeAll()
        productsArray?.removeAll()
        loadCoreData()
        tableProducts.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch
        {
        return searchArray!.count
        }
        else
        {
            return productArray!.count

        }
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productcell", for: indexPath) as! ProductTableViewCell
        
        if isSearch
        {
        let currproduct = searchArray![indexPath.row]
        cell.lbl1.text = currproduct.name
        cell.lbl2.text = String(" \(currproduct.price)")
            
        }
        else
        {
            let currproduct = productArray![indexPath.row]
            cell.lbl1.text = currproduct.name
            cell.lbl2.text = String(" \(currproduct.price)")
        }
        
    
        
                  
                   return cell
           
       }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
              let newVC = sb.instantiateViewController(identifier: "detailVC") as! DetailsViewController
        if isSearch{
            
            let currtask = searchArray![indexPath.row]
            newVC.product = currtask
            
        }
        else{
            let currtask = productArray![indexPath.row]
            newVC.product = currtask
            
        }
        
              
              navigationController?.pushViewController(newVC, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
       {
        let filtered = productArray!.filter { $0.name.lowercased().contains(searchText.lowercased())}
                   
           if filtered.count>0
           {
            //tasks = []
               searchArray = filtered;
               isSearch = true;
           }
           else
           {
            searchArray = self.productArray
               isSearch = false;
           }
           self.tableProducts.reloadData();
       }
       
       func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
       {
           return true;
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
     
     func loadCoreData()
     {
         
        //clearCoreData()
         productArray = [Product]()

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
                     
                    productArray?.append(Product(id: id, name: name, desc: desc, price: price))
                     

                 }
             }
         } catch{
             print(error)
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

}

