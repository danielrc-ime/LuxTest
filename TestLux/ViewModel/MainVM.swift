//
//  MainVM.swift
//  TestLux
//
//  Created by Yonusa iOS on 04/04/22.
//

import Foundation

protocol MainVMDelegate {
    func refreshData()
    func errorInMainVM(error: Error)
}

class MainVM {
    
    var delegate: MainVMDelegate?
    
    private var itemServices: ItemServices!
    
    var itemsModel: [ItemsModel] = [] {
        didSet {
            delegate?.refreshData()
        }
    }
    
    func getData(fileName: String) {
        //Obteniendo datos de Servicio
        itemServices = ItemServices(fileName: fileName)
        itemServices.getItems { itemsModel, error in
            if error == nil {
                self.itemsModel = itemsModel
            } else {
                self.delegate?.errorInMainVM(error: error!)
            }
        }
    
    }
    
}
