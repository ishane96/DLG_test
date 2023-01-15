//
//  ViewController.swift
//  DLG_Test
//
//  Created by Achintha kahawalage on 2023-01-11.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        
        navigationItem.title = "NEW FEATURE"
        self.view.backgroundColor = UIColor(named: "black")
        
        let titleLbl = UILabel()
        titleLbl.designable(fullText: "MAKING CARS EASY.", text: "MAKING CARS EASY", text2: ".", font: UIFont(name: "Oswald-Regular", size: 30)!, firstColor: UIColor(named: "white")!)
        
        let descriptionLbl = UILabel()
        descriptionLbl.text = "We've got a brilliant new vehicle search feature.. why not give it a try!"
        descriptionLbl.designable(fullText: descriptionLbl.text!, text: descriptionLbl.text!, text2: "", font: UIFont(name: "Roboto-Light", size: 18)!, firstColor: UIColor(named: "white")!)
        descriptionLbl.numberOfLines = 2
        
        let tryButton = UIButton()
        tryButton.designable(title: "TRY IT OUT")
        tryButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        let stackView = UIStackView()
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

