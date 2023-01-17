//
//  SearchVC.swift
//  DLG_Test
//
//  Created by Achintha kahawalage on 2023-01-15.
//

import UIKit

class SearchVC: UIViewController {
    
    //    let vm = SearchVM()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textField = UITextField()
    let countryNm = UILabel()
    let titleLbl = UILabel()
    let flagStackView = UIStackView()
    let textFieldStackVw = UIStackView()
    let makeLbl = UILabel()
    let makeResult = UILabel()
    let detailLbl = UILabel()
    let detailResult = UILabel()
    let modelLbl = UILabel()
    let modelResultLbl = UILabel()
    let bodyTypeLbl = UILabel()
    let bodyTypeResult = UILabel()
    let engineLbl = UILabel()
    let engineResult = UILabel()
    let yearLbl = UILabel()
    let yearResult = UILabel()
    let gearLbl = UILabel()
    let gearResult = UILabel()
    let motLbl = UILabel()
    let motResult = UILabel()
    let successView = UIView()
    let failedStack = UIStackView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
        self.configSuccessView()
        
    }
    
    func setupUI(){
        navigationItem.title = "SEARCH TOOL"
        self.view.backgroundColor = UIColor(named: "black")
        
        titleLbl.designable(fullText: "WHAT'S YOUR VEHICLE REG?.", text: "WHAT'S YOUR VEHICLE REG", text2: "?", font: UIFont(name: "Oswald-Regular", size: 30)!, firstColor: UIColor(named: "white")!)
        titleLbl.numberOfLines = 2
        self.view.addSubview(titleLbl)
        
        
        let image = UIImage(named: "gbFlag")
        let flagView = UIImageView(image: image!)
        flagView.contentMode = .scaleAspectFit
        flagView.frame = CGRect(x: 0, y: 0, width: 18, height: 20)
        self.view.addSubview(flagView)
        self.view.bringSubviewToFront(flagView)
        
        
        countryNm.designable(fullText: "GB", text: "GB", text2: "", font: UIFont(name: "Oswald-Regular", size: 15)!, firstColor: UIColor(named: "yellow")!)
        self.view.addSubview(countryNm)
        
        flagStackView.backgroundColor = UIColor(named: "blue")
        flagStackView.axis  = NSLayoutConstraint.Axis.vertical
        flagStackView.distribution  = UIStackView.Distribution.fill
        flagStackView.alignment = UIStackView.Alignment.center
        flagStackView.spacing = 0
        flagStackView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        flagStackView.addArrangedSubview(flagView)
        flagStackView.addArrangedSubview(countryNm)
        
        textField.placeholder = "ENTER REG"
        textField.backgroundColor = UIColor(named: "white")
        self.view.addSubview(textField)
        
        let goBtn = UIButton()
        goBtn.designable(title: "GO")
        goBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        goBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(goBtn)
        
        textFieldStackVw.axis = NSLayoutConstraint.Axis.horizontal
        textFieldStackVw.backgroundColor = .green
        textFieldStackVw.distribution  = UIStackView.Distribution.fill
        textFieldStackVw.alignment = UIStackView.Alignment.center
        textFieldStackVw.spacing = 0
        
        textFieldStackVw.addArrangedSubview(flagStackView)
        textFieldStackVw.addArrangedSubview(textField)
        textFieldStackVw.addArrangedSubview(goBtn)
        self.view.addSubview(textFieldStackVw)
        
        let margins = view.layoutMarginsGuide
        titleLbl.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 70).isActive = true
        titleLbl.topAnchor.constraint(equalTo: margins.topAnchor, constant: 60).isActive = true
        titleLbl.translatesAutoresizingMaskIntoConstraints = false;
        
        textFieldStackVw.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        textFieldStackVw.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textFieldStackVw.translatesAutoresizingMaskIntoConstraints = false;
        flagStackView.heightAnchor.constraint(equalTo: textFieldStackVw.heightAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: textFieldStackVw.heightAnchor).isActive = true
        
        setupScrollView()
        
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        //        vm.getVehicleDetails(registration: textField.text ?? "") { success, message in
        //            if success {
        //                DispatchQueue.main.async {
        //                    self.configSuccessView()
        //                    print(success)
        //                }
        //            } else {
        //                DispatchQueue.main.async {
        //                    self.configFailedView()
        //                }
        //            }
        //        }
    }
    
    
    func setupScrollView() {
        let margins = view.layoutMarginsGuide
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        configureContainerView()
    }
    
    func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(titleLbl)
        scrollStackViewContainer.addArrangedSubview(textFieldStackVw)
        scrollStackViewContainer.addArrangedSubview(successView)
        scrollStackViewContainer.addArrangedSubview(failedStack)
    }
    
    func configSuccessView(){
        
        successView.backgroundColor = UIColor(named: "darkGray")
        successView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        successView.translatesAutoresizingMaskIntoConstraints = false;
        
        
        view.addSubview(successView)
        let margins = view.layoutMarginsGuide
        
        successView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        successView.leadingAnchor.constraint(equalTo: flagStackView.leadingAnchor, constant: 20).isActive = true
        successView.topAnchor.constraint(equalTo: flagStackView.topAnchor, constant: 60).isActive = true
        successView.translatesAutoresizingMaskIntoConstraints = false;
        
        makeLbl.resultDescription(text: "Make")
        makeResult.result(text: "KIA")

        modelLbl.resultDescription(text: "Model")
        modelResultLbl.result(text: "Picanto")
        
        detailLbl.resultDescription(text: "Details")
        detailResult.result(text: "125GT-line5d")
        
        bodyTypeLbl.resultDescription(text: "BODY TYPE")
        bodyTypeResult.result(text: "HatchBack")
        

        engineLbl.resultDescription(text: "Engine")
        engineResult.result(text: "1.25L")
        
        yearLbl.resultDescription(text: "YEAR")
        yearResult.result(text: "2017")
        
        gearLbl.resultDescription(text: "GEAR")
        gearResult.result(text: "Manual")
        
        motLbl.resultDescription(text: "MOT")
        motResult.result(text: "Valid Until")
        

        let hStackView = UIStackView()
        hStackView.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView.distribution  = UIStackView.Distribution.equalSpacing
//
        hStackView.addArrangedSubview(makeLbl)
        hStackView.addArrangedSubview(modelLbl)


        let hStackView2 = UIStackView()
        hStackView2.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView2.distribution  = UIStackView.Distribution.equalSpacing
//
        hStackView2.addArrangedSubview(makeResult)
        hStackView2.addArrangedSubview(modelResultLbl)
        

        let hStackView3 = UIStackView()
        hStackView3.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView3.distribution  = UIStackView.Distribution.equalSpacing
//
        hStackView3.addArrangedSubview(detailLbl)
        hStackView3.addArrangedSubview(bodyTypeLbl)
        
        let hStackView4 = UIStackView()
        hStackView4.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView4.distribution  = UIStackView.Distribution.equalSpacing
//
        hStackView4.addArrangedSubview(detailResult)
        hStackView4.addArrangedSubview(bodyTypeResult)
        
        let hStackView5 = UIStackView()
        hStackView5.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView5.distribution  = UIStackView.Distribution.equalSpacing
//
        hStackView5.addArrangedSubview(engineLbl)
        hStackView5.addArrangedSubview(yearLbl)
        
        let hStackView6 = UIStackView()
        hStackView6.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView6.distribution  = UIStackView.Distribution.equalSpacing
//
        hStackView6.addArrangedSubview(engineResult)
        hStackView6.addArrangedSubview(yearResult)
        
        let hStackView7 = UIStackView()
        hStackView7.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView7.distribution  = UIStackView.Distribution.equalSpacing
//
        hStackView7.addArrangedSubview(gearLbl)
        hStackView7.addArrangedSubview(motLbl)
        
        let hStackView8 = UIStackView()
        hStackView8.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView8.distribution  = UIStackView.Distribution.equalSpacing
//
        hStackView8.addArrangedSubview(gearResult)
        hStackView8.addArrangedSubview(motResult)


//        hStackView.addArrangedSubview(modelLbl)

        let vStackView = UIStackView()
        vStackView.axis  = NSLayoutConstraint.Axis.vertical
        vStackView.distribution  = UIStackView.Distribution.equalSpacing
        vStackView.spacing = 10

        
        vStackView.addArrangedSubviews([hStackView,hStackView2,hStackView3,hStackView4,hStackView5,hStackView6,hStackView7,hStackView8])
        

//        hStackView2.translatesAutoresizingMaskIntoConstraints = false
//        hStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.translatesAutoresizingMaskIntoConstraints = false


//        self.successView.addSubview(vStackView)
        self.successView.addSubview(vStackView)
//        self.successView.addSubview(stackView)
        

        

        
    }
    
    
    func configFailedView(){
        
        let errorLbl = UILabel()
        errorLbl.text = "Uh-oh! We Couldn't find a vehicle with that registration"
        errorLbl.numberOfLines = 2
        errorLbl.textColor = .white
        let errorHint = UILabel()
        errorHint.text = "Try Searching 'XXYYZZZ'..."
        errorHint.textColor = .white
        
        failedStack.axis  = NSLayoutConstraint.Axis.vertical
        failedStack.spacing = 30
        
        failedStack.addArrangedSubview(errorLbl)
        failedStack.addArrangedSubview(errorHint)
        
        failedStack.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
}


