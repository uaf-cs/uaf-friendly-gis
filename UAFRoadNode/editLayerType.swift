//
//  editLayerType.swift
//  
//
//  Created by Nami Kim on 4/17/20.
//

import UIKit

var layerNameArray = ["Layer1", "Layer2", "Layer3"]
var myIndex = 0

class editLayerType: UIViewController {
    
    
    var searchedLayer = [String]()
    var searching = false
    @IBOutlet weak var layerSearch: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layerSearch.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension editLayerType: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedLayer.count
        } else {
            return layerNameArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LayerName")
        if searching {
            cell?.textLabel?.text = searchedLayer[indexPath.row]
        } else {
            cell?.textLabel?.text = layerNameArray[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "editLayerSegue", sender: self)
    }
    
    
}

extension editLayerType: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedLayer = layerNameArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}