

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let defaults = UserDefaults.standard
    var alumnos = ["Fernando"]
    var alsel : String?

    @IBOutlet weak var tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.register(UINib(nibName: "alumnoCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        if let algs = defaults.array(forKey: "alumnosProgra") as? [String] {
            alumnos = algs
        }
        
        
        
        tabla.dataSource = self
        tabla.delegate = self
        
    }
    
    //MARK: - METODOS DEL TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let objCelda = UITableViewCell(style: .default, reuseIdentifier: "celda")
        let oCelda = tabla.dequeueReusableCell(withIdentifier: "celda") as! alumnoCell
        oCelda.alumnoLabel.text = alumnos[indexPath.row]
        //objCelda.textLabel?.text = alumnos[indexPath.row]
        
        return oCelda
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alumnos.remove(at: indexPath.row)
            guardarAlumnosDefaults()
            tabla.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        alsel = alumnos[indexPath.row]
        performSegue(withIdentifier: "enviarNombre", sender: alsel)
        
    }
    func guardarAlumnosDefaults(){
        defaults.set(alumnos, forKey: "alumnosProgra")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviarNombre" {
            let destino = segue.destination as! inicioViewController
            destino.recibirAlumno = alsel
        }
    }

    @IBAction func addAlumnoButton(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "agregar nuevo", message: "Ingresa un nuevo alumno", preferredStyle: .alert)
        
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            print("usuario agregado")
            self.alumnos.append(textField.text!)
                self.guardarAlumnosDefaults()
            
            
                self.tabla.reloadData()
        
        }
        let actionCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alert.addAction(actionAceptar)
        alert.addAction(actionCancelar)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Nombre del alumno: "
            textField = alertTextField
            
        }
        present(alert, animated: true, completion: nil)
    }
}

