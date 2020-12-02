//
//  inicioViewController.swift
//  TableViewL
//
//  Created by Mac4 on 30/10/20.
//  Copyright © 2020 Mac4. All rights reserved.
//

import UIKit

class inicioViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var recibirAlumno : String?
    var promedio = 70.0
    @IBOutlet weak var promedioLabel: UILabel!
    @IBOutlet weak var nombreAlumnoLabel: UILabel!
    @IBOutlet weak var elegirImagenButton: UIButton!
    
    @IBOutlet weak var guardarCButton: UIButton!
    
    @IBOutlet weak var imagenPerfil: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreAlumnoLabel.text = recibirAlumno

        promedioLabel.text = "Promedio: \(promedio) puntos"
        
    }
    
    @IBAction func guardarCalificacion(_ sender: UIButton) {
        performSegue(withIdentifier: "enviarnp", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "enviarnp"){
            let des = segue.destination as! alumnoViewController
            des.nombre = recibirAlumno ?? ""
            des.promedio = promedio ?? 0.0
            des.Imagen = imagenPerfil
            
        }
    }
    
    @IBAction func elegirImagen(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func cambiarPromedio(_ sender: UISlider) {
        promedio = Double(sender.value)
        promedioLabel.text = "Promedio: \(String(format: "%.1f",promedio)) puntos"
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagen = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage
        imagenPerfil.image = imagen
        picker.dismiss(animated: true, completion: nil)
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
