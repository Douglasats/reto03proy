//
//  FormularioTableViewController.swift
//  Reto03Proy
//
//  Created by Douglas Andreus Tafur Saldivar on 2/12/22.
//

import UIKit

protocol FormularioTableViewControllerDelegate{
    func FormularioTableViewController(_ ViewController: FormularioTableViewController, didCreateTarea newTarea: Tarea)
}

class FormularioTableViewController: UITableViewController {

    
    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var prioridadTextField: UITextField!
    @IBOutlet weak var responsableTextField: UITextField!
    @IBOutlet weak var areaTextField: UITextField!
    @IBOutlet weak var turnoTextField: UITextField!
    
    var delegate: FormularioTableViewControllerDelegate?
    
    @IBAction func saveButton(_ sender: Any) {
        let tituloTf = tituloTextField.text
        let descripcionTf = descripcionTextField.text
        let prioridadTf = prioridadTextField.text
        let responsableTf = responsableTextField.text
        let areaTf = areaTextField.text
        let turnoTf = turnoTextField.text
        
        guard let titulo = tituloTf, !titulo.isEmpty else {return}
        guard let descripcion = descripcionTf, !descripcion.isEmpty else {return}
        guard let prioridad = prioridadTf, !prioridad.isEmpty else {return}
        guard let responsable = responsableTf, !responsable.isEmpty else {return}
        guard let area = areaTf, !area.isEmpty else {return}
        guard let turno = turnoTf, !turno.isEmpty else {return}
        
        let newTarea = Tarea(titulo: titulo, descripcion: descripcion, prioridad: prioridad, responsable: responsable, area: area, turno: turno)
        
        delegate?.FormularioTableViewController(self, didCreateTarea: newTarea)
        
        dismiss(animated: true)
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
