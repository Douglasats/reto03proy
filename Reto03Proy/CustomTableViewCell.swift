//
//  CustomTableViewCell.swift
//  Reto03Proy
//
//  Created by Douglas Andreus Tafur Saldivar on 2/12/22.
//

import UIKit


class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var descripcionTextView: UITextView!
    
    @IBOutlet weak var prioridadLabel: UILabel!
    
    
    func setup(tarea: Tarea){
        tituloLabel.text = tarea.titulo
        descripcionTextView.text = tarea.descripcion
        descripcionTextView.isEditable = false
        prioridadLabel.text = tarea.prioridad
    }
    
}
