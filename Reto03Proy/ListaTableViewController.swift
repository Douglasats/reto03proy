//
//  ListaTableViewController.swift
//  Reto03Proy
//
//  Created by Douglas Andreus Tafur Saldivar on 2/12/22.
//

import UIKit

class ListaTableViewController: UITableViewController {

    var tareas = [Tarea(titulo: "Lavar",
                        descripcion: "Lavar con ayudin",
                        prioridad: "baja",
                        responsable: "Limpiador",
                        area: "Limpieza",
                        turno: "mañana"
                       ),
                  Tarea(titulo: "Cocinar",
                        descripcion: "Cocinar Arroz con Pollo",
                        prioridad: "media",
                        responsable: "Cocinero",
                        area: "Cocina",
                        turno: "tarde"
                        ),
                  Tarea(titulo: "Arreglar Aire Acondicionado",
                        descripcion: "Arreglar avería de máquina de acondicionamiento",
                        prioridad: "alta",
                        responsable: "Técnico",
                        area: "Soport Técnico",
                        turno: "noche"
                        )
                ]
    
    @IBAction func agregarButton(_ sender: Any) {
        guard let formularioTableViewController = storyboard?.instantiateViewController(withIdentifier: "FormularioTableViewController") as? FormularioTableViewController else {return}
        let nav = UINavigationController(rootViewController: formularioTableViewController)
        present(nav, animated: true)
        formularioTableViewController.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension ListaTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as? CustomTableViewCell{
            let tarea = tareas[indexPath.row]
            cell.setup(tarea: tarea)
            return cell
        }else{
            return UITableViewCell()
        }

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
}

extension ListaTableViewController: FormularioTableViewControllerDelegate{
    func FormularioTableViewController(_ ViewController: FormularioTableViewController, didCreateTarea newTarea: Tarea) {
        tareas.append(newTarea)
        tableView.reloadData()
    }
}
    
extension ListaTableViewController {
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let tarea = tareas[indexPath.row]
            let indice = indexPath.row
            
            guard let detalleViewController = storyboard?.instantiateViewController(withIdentifier: "DetalleViewController") as? DetalleViewController else {return}
            
            detalleViewController.titulo = tarea.titulo
            detalleViewController.descripcion = tarea.descripcion
            detalleViewController.prioridad = tarea.prioridad
            detalleViewController.responsable = tarea.responsable
            detalleViewController.area = tarea.area
            detalleViewController.turno = tarea.turno
            detalleViewController.indice = indice
            print(indice)
            
            present(detalleViewController, animated: true)
            detalleViewController.delegate = self
        }
}

extension ListaTableViewController: DetalleViewControllerDelegate{
    func eliminarTarea(_ ViewController: DetalleViewController, indice: Int) {
        tareas.remove(at: indice)
        tableView.reloadData()
    }
}



