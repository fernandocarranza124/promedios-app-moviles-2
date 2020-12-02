//
//  alumnoViewController.swift
//  TableViewL
//
//  Created by Mac4 on 30/10/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class alumnoViewController: UIViewController {
    
    var nombre : String = ""
    var promedio = 0.0

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var promedioLabel: UILabel!
    
    @IBOutlet weak var Imagen: UIImageView!
    @IBOutlet weak var aproboLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreLabel.text = "Nombre: \(nombre)"
        promedioLabel.text = "Promedio: \(String(format: "%.1f",promedio))"
        
        if (promedio >= 70.0){
            
            aproboLabel.text = " Aprobado "
            aproboLabel.backgroundColor = UIColor.green
            
        }else{
            aproboLabel.text = "Reprobado"
            aproboLabel.backgroundColor = UIColor.red
        }

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
