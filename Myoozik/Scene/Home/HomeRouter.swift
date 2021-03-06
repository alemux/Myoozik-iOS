//
//  HomeRouter.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 04/04/18.
//  Copyright (c) 2018 Mussini SAS. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol HomeRoutingLogic
{
    func routeToEvento(segue: UIStoryboardSegue?)
    func routeToVetrina(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing
{
  var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing
{

  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?
  
  // MARK: Routing
  
    func routeToEvento(segue: UIStoryboardSegue?){
    if let segue = segue {
        let destinationVC = segue.destination as! EventoDetailViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToEventoDetail(source: dataStore!, destination: &destinationDS)
    } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "EventoDetailViewController") as! EventoDetailViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToEventoDetail(source: dataStore!, destination: &destinationDS)
        navigateToEventoDetail(source: viewController!, destination: destinationVC)
    }
    }
    func routeToVetrina(segue: UIStoryboardSegue?){
        if let segue = segue {
            let destinationVC = segue.destination as! VetrinaViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToVetrina(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "VetrinaViewController") as! VetrinaViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToVetrina(source: dataStore!, destination: &destinationDS)
            navigateToVetrina(source: viewController!, destination: destinationVC)
        }
    }

  // MARK: Navigation
  
    func navigateToEventoDetail(source: HomeViewController, destination: EventoDetailViewController) {
    source.show(destination, sender: nil)
    }
    
    func navigateToVetrina(source: HomeViewController, destination: VetrinaViewController) {
        source.show(destination, sender: nil)
    }
  
  // MARK: Passing data
  
    func passDataToEventoDetail(source: HomeDataStore, destination: inout EventoDetailDataStore) {
        let token = viewController?.selected_evento_token
        
        print("Token12: \(token)");
        
        destination.token = token
    }
    func passDataToVetrina(source: HomeDataStore, destination: inout VetrinaDataStore) {
    }
}
