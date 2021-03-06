//
//  HomeViewController.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 04/04/18.
//  Copyright (c) 2018 Mussini SAS. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http:/varean-swift.com
//

import UIKit
import Hero

protocol HomeDisplayLogic: class
{
    func displayData(viewModel: Home.FetchHome.ViewModel)
    func showEvento(index: Int)
    func showEvidenza(index: Int)
    func showVetrina(index: Int)
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    let homeTableView = HomeTableView()

    var eventi: [Home.evento] = []
    var evidenza: [Home.evidenza] = []
    var vetrina: [Home.vetrinaband] = []
    
    var selected_evento_token: String?
    
    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
  
  // MARK: Setup
  
    private func setup()
    {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
  // MARK: Routing
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
  // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        self.homeTableView.delegateTo(view: self).addTo(view: self.view).setPosition(top: 0, left: 0).setCenter(of: self.view).setBackground(color: defaultDarkGray)
        self.homeTableView.separatorStyle = .none
        self.view.setBackground(color: defaultDarkGray)
        
    }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
    func fetchData() {
        let request = Home.FetchHome.Request(lat: 2, lon: 2)
        interactor?.fetchData(request: request)
    }
  
    func displayData(viewModel: Home.FetchHome.ViewModel) {
        //nameTextField.text = viewModel.name
        print("Display data test: \(viewModel)");
        
        self.eventi = viewModel.eventi
        self.evidenza = viewModel.evidenza
        self.vetrina = viewModel.vetrinaband
        
        self.homeTableView.reloadData()
        
    }
    
    func showEvento(index: Int) {
        self.selected_evento_token = self.eventi[index].token
        self.performSegue(withIdentifier: "EventoDetail", sender: self)
    }
    
    func showEvidenza(index: Int) {
        self.selected_evento_token = self.evidenza[index].token
        self.performSegue(withIdentifier: "EventoDetail", sender: self)
    }
  
    func showVetrina(index: Int) {
        self.selected_evento_token = self.vetrina[index].token
        self.performSegue(withIdentifier: "Vetrina", sender: self)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + self.eventi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var index = indexPath.row
        if index == 0{
            if let cell = tableView.dequeueReusableCell(withIdentifier: self.homeTableView.vetrinaCellName, for: indexPath) as? VetrinaTableCell {
                
                //cell.contentView.superview?.clipsToBounds = false
                cell.vetrina = self.vetrina
                
                cell.layoutIfNeeded()
                cell.delegate = self

                return cell
            }
        } else if index == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: self.homeTableView.evidenzaCellName, for: indexPath) as? EvidenzaTableCell {
                
                
                //cell.contentView.superview?.clipsToBounds = false
                
                cell.evidenza = self.evidenza

                
                cell.layoutIfNeeded()
                cell.delegate = self
                
                return cell
            }
            
        } else if index > 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: self.homeTableView.eventoCellName, for: indexPath) as? EventoTableCell {
                
                
                //cell.contentView.superview?.clipsToBounds = false
                let eventoIndex = self.eventi.count - 2
                cell.evento = self.eventi[eventoIndex]
                
                cell.layoutIfNeeded()
                
                return cell
            }
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if index > 1 {
            self.showEvento(index: index)
        }
    }
}

