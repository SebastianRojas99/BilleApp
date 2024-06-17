//
//  CurrencyVM.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

import Foundation
import Observation

@Observable
class CurrencyVM{
    
    
    var currencyList:[Currency] = []
    let url = "https://api.coingecko.com/api/v3/exchange_rates"
    
    init(){
        getCurrencies()
    }
    
    func getCurrencies(){
        guard let url = URL(string: url) else{return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(CoinGeckoResponse.self, from: data)
                DispatchQueue.main.async {
                    self.currencyList =  Array(response.rates.values)
                }
            } catch {
                print("Error decoding JSON")
            }
        }.resume()
        
    }
    
    
}
