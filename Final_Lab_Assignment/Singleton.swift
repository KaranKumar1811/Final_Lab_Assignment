//
//  Singleton.swift
//  Final_Lab_Assignment
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 Karan. All rights reserved.
//

import Foundation
import CoreData
class Singleton : NSObject
{
private var productArray  = [Product]()
   
   private static var obj = Singleton()
   
   
   private override init() {
       
   }
   
   internal static func getInstance() -> Singleton
   {
       return obj
   }
   
    
    func createProduct()
    {
       let p1 = Product(id: 121, name: "Mobile", desc: "Iphone", price: 2000.0)
       
       let p2 = Product(id: 122, name: "Tab", desc: "Samsung", price: 2000.0)
       
       let p3 = Product(id: 123, name: "Charger", desc: "Oppo", price: 2000.0)
       
       let p4 = Product(id: 124, name: "Headphones", desc: "Iphone X", price: 2000.0)
       
       let p5 = Product(id: 125, name: "Ear pods", desc: "Iphone XR", price: 2000.0)
       
       let p6 = Product(id: 126, name: "powerBank", desc: "Iphone 11", price: 2000.0)
       
       let p7 = Product(id: 127, name: "lightning cabel", desc: "Iphone 11 Pro", price: 2000.0)
       
       let p8 = Product(id: 128, name: "laptop", desc: "Iphone 7", price: 2000.0)
       
       let p9 = Product(id: 129, name: "macbook", desc: "Iphone 6", price: 2000.0)
       
       let p10 = Product(id: 130, name: "mobile case", desc: "Iphone 8", price: 2000.0)
        
                     productArray.append(p1)
                     productArray.append(p2)
                     productArray.append(p3)
                     productArray.append(p4)
                     productArray.append(p5)
                     productArray.append(p6)
                     productArray.append(p7)
                     productArray.append(p8)
                     productArray.append(p9)
                     productArray.append(p10)
                                                                     
                                                                                     
    }
func returnProductArray() -> [Product]
      {
          return productArray
          }
    
    
}
    

