//
//  NetworkManager.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 04/04/18.
//  Copyright © 2018 Diarly. All rights reserved.
//


import Foundation
import Alamofire

class NetworkManager{
    
    static let shared: NetworkManager = NetworkManager()
    
    func restCall(method: String, end_point: String, params: [[String: Any]] , files: [[String: Any]], withCompletionHandler:@escaping (_ result: Any?) -> Void){
        
        if Reachability.isConnectedToNetwork() {
            
            var url = "\(end_point)";
            
            var httpMethod  = HTTPMethod.get
            if(method == "POST"){
                httpMethod = HTTPMethod.post
            }
            
            
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    
                    for f in files {
                        print("File: \(f)");
                        multipartFormData.append((f["data"]! as! Data), withName: "\(f["name"]!)", fileName: "\(f["name"]!).\(f["ext"]!)", mimeType: "");
                        //multipartFormData.app
                    }
                    
                    for p in params {
                        //multipartFormData.append((p["value"]! as! Data), withName: "\(p["name"])", fileName: "photo\(p).jpeg", mimeType: "image/jpeg");
                        multipartFormData.append("\(p["value"]!)".data(using: String.Encoding.utf8, allowLossyConversion: false)!,withName: "\(p["name"]!)")
                    }
                    
                    
                    
                    /*
                     multipartFormData.append("\(self.include.accessToken())".data(using: String.Encoding.utf8, allowLossyConversion: false)!,withName: "accesstoken")
                     multipartFormData.append("\(reportType)".data(using: String.Encoding.utf8, allowLossyConversion: false)! ,withName: "type")
                     multipartFormData.append("\(reportName)".data(using: String.Encoding.utf8, allowLossyConversion: false)! ,withName: "nome")
                     multipartFormData.append("\(reportSurname)".data(using: String.Encoding.utf8, allowLossyConversion: false)! ,withName: "cognome")
                     multipartFormData.append("\(reportEmail)".data(using: String.Encoding.utf8, allowLossyConversion: false)! ,withName: "email")
                     multipartFormData.append("\(reportTitle)".data(using: String.Encoding.utf8, allowLossyConversion: false)!,withName: "titolo")
                     multipartFormData.append("\(reportText)".data(using: String.Encoding.utf8, allowLossyConversion: false)!,withName: "testo")
                     */
                    
            },to: url,
              method: httpMethod,
              /*headers:["Accept":"application/json","Content-Type":"application/x-www-form-urlencoded","Authorization":" Bearer \(accessToken())"],*/
                encodingCompletion: { encodingResult in
                    
                    
                    
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            do {
                                
                                /*let responseString =  String(data: response.data!, encoding: String.Encoding.utf8) as String!
                                print("end_point: \(url)");
                                print("Json: \(responseString)");
                                let json = try JSONSerialization.jsonObject(with: response.data!)
                                */
                                    withCompletionHandler(response.data!)

                                /*if var jsonResult = (json as? [String: Any]) {
                                    print("1d");
                                    
                                    if let json_response = json as? [String: Any] {
                                        if let json_error = json_response["error"] as? [String: Any] {
                                            
                                            if json_error["code"] as! String == "10" {
                                                /*self.refreshAccessToken(){ (result) -> Void in
                                                 
                                                 print("Refresh done");
                                                 
                                                 if(result){
                                                 print("Call to \(end_point) with method \(method)")
                                                 print("Params: \(params)");
                                                 print("Files: \(files)");
                                                 self.restCall(method: method, end_point: end_point, params: params, files: files){ (result) -> Void in
                                                 
                                                 }
                                                 }
                                                 }*/
                                            }else if json_error["code"] as! String == "250" {
                                                
                                                let nc = NotificationCenter.default
                                                nc.post(name: NSNotification.Name(rawValue: "notConfirmed"), object: nil)
                                                
                                            }
                                            
                                        }else{
                                            withCompletionHandler(jsonResult)
                                        }
                                    }
                                    
                                }else if var jsonResult = (json as? [[String: Any]]){
                                    print("2d");
                                    withCompletionHandler(jsonResult)
                                }else{
                                    print("0d");
                                    withCompletionHandler(nil)
                                }*/
                            } catch {
                                print("Error deserializing JSON: \(error)")
                                withCompletionHandler(nil)
                            }
                            
                        }
                        
                    case .failure(let error):
                        print(error)
                        withCompletionHandler(nil)
                    }
            })
        }else{
            withCompletionHandler(nil)
        }
        
    }
}
