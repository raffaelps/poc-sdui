//
//  ViewController.swift
//  POC-SDUI
//
//  Created by Raffael Patricio de Souza on 11/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private var homeResponse: HomeResponse = HomeResponse()
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = SparkleButtonModel(title: "Titulo do botao", backgroundColor: .red)

        let sparkleButton = Components.SparkleButton.makeSparkleButton()
        sparkleButton.update(model)
        sparkleButton.onEvent { event in
            switch event {
            case .tap:
                debugPrint("Tap SparkleButton")
                break
            }
        }
        
        let sparkleButtonView = sparkleButton.view
        view.addSubview(sparkleButtonView)
        
        sparkleButtonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0).isActive = true
        sparkleButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        decodeModel()
    }
    
    private func decodeModel() {
        homeResponse = Bundle.main.decode(HomeResponse.self, from: "data.json")
        
        homeResponse.widgets.forEach { (widget) in
            let cell = widget.inflateUITableViewCell()
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell.reuseIdentifier ?? "")
        }
        
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeResponse.widgets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let widget = homeResponse.widgets[indexPath.row]
        let widgetCell = widget.inflateUITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: widgetCell.reuseIdentifier ?? "", for: indexPath)
        return cell
    }
    
}

