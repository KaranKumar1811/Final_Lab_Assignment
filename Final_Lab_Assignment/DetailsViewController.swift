//
//  DetailsViewController.swift
//  Final_Lab_Assignment
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 Karan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var product : Product?

        @IBOutlet weak var descTxt: UITextView!
        @IBOutlet weak var nameLbl: UILabel!
        @IBOutlet weak var idLbl: UILabel!
        @IBOutlet weak var priceLbl: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            nameLbl.text = product!.name
            
            descTxt.text = product!.desc
            
            idLbl.text = String(product!.id)

            priceLbl.text = " \(product!.price)"
            
            

            // Do any additional setup after loading the view.
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
