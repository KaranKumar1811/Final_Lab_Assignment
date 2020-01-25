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
    
    private var productArray  = [Products]()
    private static var object = Singleton()

    private override init() {
        
    }
    
    internal static func getInstance() -> Singleton
    {
        return object
    }
    
    
   
    
    func addProduct(product: Products)
    {
        productArray.append(product)
    }
    
    func returnProductArray() -> [Products] {
        return productArray
    }
    
    func returnProductObj() -> Products?
    {
        for product in productArray
        {
            return product
        }
        return nil
        
    }
    func returnCount() -> Int
    {
        return productArray.count
    }
    
    
    func createProduct()
    {
       
       let p1 = Products(ProductName: "iphone", Product_Description: "max pro", Product_Price: 1000, Product_Id: 1)
        let p2 = Products(ProductName: "samsung", Product_Description: "s10", Product_Price: 1000, Product_Id: 2)
       let p3 = Products(ProductName: "mi", Product_Description: "max", Product_Price: 1000, Product_Id: 3)
        let p4 = Products(ProductName: "kabs", Product_Description: "bsf pro", Product_Price: 1000, Product_Id: 4)
        let p5 = Products(ProductName: "bddsa", Product_Description: "mart", Product_Price: 1000, Product_Id: 5)
        let p6 = Products(ProductName: "fsgf", Product_Description: "magdfgx pro", Product_Price: 1000, Product_Id: 6)
        let p7 = Products(ProductName: "opdgj", Product_Description: "dgj pro", Product_Price: 1000, Product_Id: 7)
        let p8 = Products(ProductName: "bdisug", Product_Description: "maxgadfspro", Product_Price: 1000, Product_Id: 8)
       let p9 = Products(ProductName: "shfi", Product_Description: "majsdfihsix pro", Product_Price: 1000, Product_Id: 9)
        let p10 = Products(ProductName: "dghi", Product_Description: "mbgjoax pro", Product_Price: 1000, Product_Id: 10)
        
       addProduct(product: p1)
        addProduct(product: p2)
               addProduct(product: p3)
                      addProduct(product: p4)
                             addProduct(product: p5)
                                    addProduct(product: p6)
                                           addProduct(product: p7)
                                                  addProduct(product: p8)
                                                         addProduct(product: p9)
                                                                addProduct(product: p10)
                                                                     
                                                                                     
    }
    
    
    
    
}
