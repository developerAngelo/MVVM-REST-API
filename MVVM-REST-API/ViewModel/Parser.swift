//
//  Parser.swift
//  MVVM-REST-API
//
//  Created by Ruthlyn Huet on 4/5/21.
//

import Foundation

struct Parser {
    
    func parse(completion: @escaping ([Contact]) -> ()){
        
        let url = "https://api.androidhive.info/contacts/"
        
        guard let urlApi = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: urlApi){ (data, response, error) in
            
            if let error = error{
                print("handle error: \(error.localizedDescription)")
            }
            
            guard let response = response  as? HTTPURLResponse else{
                print("Hnadle empty response")
                return
            }
            
            print("Response Code : \(response.statusCode)")
            
            guard let data = data else{ return }
            
            
            do{
                let result = try JSONDecoder().decode(UserModel.self, from: data)
                completion(result.contacts)
                print(result)
            }catch let error{
                print("Error = \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
}
