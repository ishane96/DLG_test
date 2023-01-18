//
//  ViewController.swift
//  DLG_Test
//
//  Created by Achintha kahawalage on 2023-01-11.
//

import UIKit

class HomeVC: UIViewController {
    
    let tryButton = UIButton()
    let titleLbl = UILabel()
    let descriptionLbl = UILabel()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        
        navigationItem.title = String.NewFeature
        self.view.backgroundColor = UIColor(named: "black")
        
        titleLbl.designable(fullText: String.makingCarsEasy, text: "MAKING CARS EASY", text2: ".", font: UIFont(name: "Oswald-Regular", size: 30)!, firstColor: UIColor(named: "white")!)
        
        descriptionLbl.text = String.WeGotBrilliant
        descriptionLbl.designable(fullText: descriptionLbl.text!, text: descriptionLbl.text!, text2: "", font: UIFont(name: "Roboto-Light", size: 18)!, firstColor: UIColor(named: "white")!)
        descriptionLbl.numberOfLines = 2
        
        tryButton.designable(title: String.TryButton)
        tryButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 30
        
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(descriptionLbl)
        stackView.addArrangedSubview(tryButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(stackView)
        
        //Constraints
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        let margins = view.layoutMarginsGuide
        stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 30).isActive = true
        tryButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let vc = SearchVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

