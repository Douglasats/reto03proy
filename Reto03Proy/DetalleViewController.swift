//
//  DetalleViewController.swift
//  Reto03Proy
//
//  Created by Douglas Andreus Tafur Saldivar on 2/12/22.
//

import UIKit

protocol DetalleViewControllerDelegate{
    func eliminarTarea(_ ViewController: DetalleViewController, indice: Int)
}

class DetalleViewController: UIViewController {

    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var prioridadLabel: UILabel!
    @IBOutlet weak var descripcionTextView: UITextView!
    @IBOutlet weak var responsableLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var turnoLabel: UILabel!
    
    var delegate: DetalleViewControllerDelegate?
    
    var titulo: String?
    var descripcion: String?
    var prioridad: String?
    var responsable: String?
    var area: String?
    var turno: String?
    var indice: Int = 0
    
    @IBAction func closeButton(_ sender: Any) {
        print(indice)
        dismiss(animated: true)
    }
    
    @IBAction func eliminarTareaButton(_ sender: Any) {
        let indice = indice
        delegate?.eliminarTarea(self, indice: indice)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        tituloLabel.text = titulo
        prioridadLabel.text = prioridad
        descripcionTextView.text = descripcion
        responsableLabel.text = responsable
        areaLabel.text = area
        turnoLabel.text = turno
        
        descripcionTextView.isEditable = false
        
        super.viewDidLoad()
    }
}
