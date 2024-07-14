//
//  CurrencyVM.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

import Foundation
import Observation
import Alamofire

@Observable
class CurrencyVM{
    
    
    var currencyList:[Currency] = []
    var errorFlag:Bool = false
    let url = "https://api.coingecko.com/api/v3/exchange_rates"
    
    
    init(){
        currenciesWithAlamofire()
    }
    
    
    func currenciesWithAlamofire(){
        AF
            .request(url,method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: CoinGeckoResponse.self){ response in
                
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.currencyList = Array(data.rates.values)
                    }
                case .failure(let error):
                    print("Error al obtener los datos: \(error)")
                    self.errorFlag = true
                }
            }
        
        
    }
    
    func dolarValue() -> Double {
        if let dolarCurrency = currencyList.first(where: { $0.name == "US Dollar" }) {
            return dolarCurrency.value
        } else {
            return 0
        }
    }
    
    
}
