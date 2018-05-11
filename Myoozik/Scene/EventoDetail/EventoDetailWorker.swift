//
//  EventoDetailWorker.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 24/04/18.
//  Copyright (c) 2018 Mussini SAS. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class EventoDetailWorker
{
  func fetchEventDetail(token: String, completionHandler: @escaping (EventoDetail.FetchEventoDetail.Response?) -> Void)
  {
    var params: [[String: Any]] = [["token": "lat","value":"\(token)"]]
    
    NetworkManager.shared.restCall(method: "POST", end_point: MyoozikAPIEndpoint.getEvent().url()!, params: params, files: []){ (result) -> Void in
        print("result");
        
        do {
            
            if let json = result as? Data{
                let decoder = JSONDecoder()
                let eventoDetailModel = try decoder.decode(EventoDetail.FetchEventoDetail.Response.self, from: json)
                print(eventoDetailModel)
                
                completionHandler(eventoDetailModel)
            }
            
        } catch let err {
            print("Err", err)
        }
        
    }
  }
}
