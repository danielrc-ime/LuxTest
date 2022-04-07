//
//  ItemServices.swift
//  TestLux
//
//  Created by Yonusa iOS on 04/04/22.
//

import Foundation

struct ItemServices {
    
    private var data: Data?
    
    init(fileName: String) {
        self.data = loadJSONData(filename: fileName)
    }
    
    private func loadJSONData(filename: String) -> Data? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
    
    func getItems(completion: @escaping ([ItemsModel], Error?) -> Void){
        let json = data
        
        debugPrint(String(decoding: json!, as: UTF8.self))
        
        //Serializar data
        do {
            let decoder = JSONDecoder()
            let itemsModel: [ItemsModel] = try decoder.decode([ItemsModel].self, from: json!)
            completion(itemsModel, nil)
            
        } catch let error {
            debugPrint("Error en \(#function) = \(error)")
            completion([], error)
        }
    }
    
}
