//
//  SearchVC.swift
//  DLG_Test
//
//  Created by Achintha kahawalage on 2023-01-15.
//

import UIKit

class SearchVC: UIViewController {
    
    let vm = SearchVM()
    
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
    let failedView = UIView()
    let errorLbl = UILabel()
    let errorHintLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        navigationItem.title = String.Search
        self.view.backgroundColor = UIColor(named: "black")
        
        titleLbl.designable(fullText: String.WhatsYourVehicleReg, text: String.WhatsYourVehicleReg, text2: "?", font: UIFont(name: "Oswald-Regular", size: 30)!, firstColor: UIColor(named: "white")!)
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
        flagStackView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        flagStackView.addArrangedSubview(flagView)
        flagStackView.addArrangedSubview(countryNm)
        
        textField.placeholder = String.TextFieldPlaceHolder
        textField.backgroundColor = UIColor(named: "white")
        self.view.addSubview(textField)
        
        let spaceView = UIView()
        spaceView.backgroundColor = UIColor(named: "black")
        spaceView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        let goBtn = UIButton()
        goBtn.designable(title: String.GoButton)
        goBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        goBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(goBtn)
        
        textFieldStackVw.axis = NSLayoutConstraint.Axis.horizontal
        textFieldStackVw.distribution  = UIStackView.Distribution.fill
        textFieldStackVw.spacing = 0
        
        textFieldStackVw.addArrangedSubview(flagStackView)
        textFieldStackVw.addArrangedSubview(textField)
        textFieldStackVw.addArrangedSubview(spaceView)
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
        addBackButton()
    }
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc func backAction(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonAction(sender: UIButton!) {
        getVehicle()
    }
    
    func getVehicle(){
        vm.getVehicleDetails(registration: textField.text ?? "") {[weak self] success, message in
            guard let self = self else {return}
            if success {
                DispatchQueue.main.async {
                    self.successView.removeFromSuperview()
                    self.failedStack.removeFromSuperview()
                    self.configSuccessView()
                }
            } else {
                DispatchQueue.main.async {
                    self.failedStack.removeFromSuperview()
                    self.successView.removeFromSuperview()
                    self.configFailedView()
                }
            }
        }
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
    }
    
    func configSuccessView(){
        let greenView = UIView()
        greenView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        greenView.backgroundColor = UIColor(named: "green")
        
        successView.backgroundColor = UIColor(named: "darkGray")
        successView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        successView.translatesAutoresizingMaskIntoConstraints = false;
        
        view.addSubview(successView)
        
        let margins = view.layoutMarginsGuide
        successView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        successView.leadingAnchor.constraint(equalTo: flagStackView.leadingAnchor).isActive = true
        successView.topAnchor.constraint(equalTo: flagStackView.topAnchor, constant: 60).isActive = true
        successView.translatesAutoresizingMaskIntoConstraints = false;
        
        makeLbl.resultDescription(text: String.Make)
        makeResult.result(text: vm.vehicle?.make ?? "N/A")
        
        modelLbl.resultDescription(text: String.Model)
        modelResultLbl.result(text: vm.vehicle?.model ?? String.NA)
        
        detailLbl.resultDescription(text: String.Details)
        detailResult.result(text: vm.vehicle?.details ?? String.NA)
        
        bodyTypeLbl.resultDescription(text: String.BodyType)
        bodyTypeResult.result(text:  vm.vehicle?.bodyType ?? String.NA)
        
        engineLbl.resultDescription(text: String.Engine)
        engineResult.result(text: vm.vehicle?.engine ?? String.NA)
        
        yearLbl.resultDescription(text: String.Year)
        yearResult.result(text: vm.vehicle?.year ?? String.NA)
        
        gearLbl.resultDescription(text: String.Gear)
        gearResult.result(text: vm.vehicle?.gearbox ?? String.NA)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.Date_withOutDash.rawValue
        let date = dateFormatter.date(from: vm.vehicle?.motExpiry ?? String.NA)
        dateFormatter.dateFormat = DateFormat.Date_WithDash_dMy.rawValue
        let resultString = dateFormatter.string(from: date!)
        motLbl.resultDescription(text: String.Mot)
        motResult.designable(fullText: "Valid Until \(String(describing: resultString))", text: "Valid Until \(String(describing: resultString))", text2: "", font:  UIFont(name: "Roboto-Light", size: 14)!, firstColor: UIColor(named: "green")!)
        
        let hStackView = UIStackView()
        hStackView.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView.distribution  = UIStackView.Distribution.fillEqually
        
        hStackView.addArrangedSubview(makeLbl)
        hStackView.addArrangedSubview(modelLbl)
        
        let hStackView2 = UIStackView()
        hStackView2.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView2.distribution  = UIStackView.Distribution.fillEqually
        
        hStackView2.addArrangedSubview(makeResult)
        hStackView2.addArrangedSubview(modelResultLbl)
        
        let hStackView3 = UIStackView()
        hStackView3.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView3.distribution  = UIStackView.Distribution.fillEqually
        
        hStackView3.addArrangedSubview(detailLbl)
        hStackView3.addArrangedSubview(bodyTypeLbl)
        
        let hStackView4 = UIStackView()
        hStackView4.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView4.distribution  = UIStackView.Distribution.fillEqually
        
        hStackView4.addArrangedSubview(detailResult)
        hStackView4.addArrangedSubview(bodyTypeResult)
        
        let hStackView5 = UIStackView()
        hStackView5.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView5.distribution  = UIStackView.Distribution.fillEqually
        
        hStackView5.addArrangedSubview(engineLbl)
        hStackView5.addArrangedSubview(yearLbl)
        
        let hStackView6 = UIStackView()
        hStackView6.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView6.distribution  = UIStackView.Distribution.fillEqually
        
        hStackView6.addArrangedSubview(engineResult)
        hStackView6.addArrangedSubview(yearResult)
        
        let hStackView7 = UIStackView()
        hStackView7.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView7.distribution  = UIStackView.Distribution.fillEqually
        
        hStackView7.addArrangedSubview(gearLbl)
        hStackView7.addArrangedSubview(motLbl)
        
        let hStackView8 = UIStackView()
        hStackView8.axis  = NSLayoutConstraint.Axis.horizontal
        hStackView8.distribution  = UIStackView.Distribution.fillEqually
        
        hStackView8.addArrangedSubview(gearResult)
        hStackView8.addArrangedSubview(motResult)
        
        let vStackView = UIStackView()
        vStackView.axis  = NSLayoutConstraint.Axis.vertical
        vStackView.distribution  = UIStackView.Distribution.equalSpacing
        vStackView.spacing = 10
        
        vStackView.addArrangedSubviews([hStackView,hStackView2,hStackView3,hStackView4,hStackView5,hStackView6,hStackView7,hStackView8])
        successView.addSubview(greenView)
        self.successView.addSubview(vStackView)
        
        let margins2 = view.layoutMarginsGuide
        vStackView.centerXAnchor.constraint(equalTo: margins2.centerXAnchor).isActive = true
        vStackView.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 20).isActive = true
        vStackView.topAnchor.constraint(equalTo: successView.topAnchor, constant: 20).isActive = true
        greenView.widthAnchor.constraint(equalTo: successView.widthAnchor).isActive = true
        greenView.translatesAutoresizingMaskIntoConstraints = false;
        
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configFailedView(){
        
        errorLbl.text = String.ErrorMsg
        errorLbl.numberOfLines = 2
        errorLbl.textColor = .white
        errorLbl.textAlignment = .center
        
        errorHintLbl.text = String.ErrorHint
        errorHintLbl.textColor = .white
        errorHintLbl.textAlignment = .center
        failedStack.axis  = NSLayoutConstraint.Axis.vertical
        failedStack.spacing = 30
        
        failedStack.addArrangedSubview(errorLbl)
        failedStack.addArrangedSubview(errorHintLbl)
        
        self.scrollStackViewContainer.addSubview(failedStack)
        
        let margins = view.layoutMarginsGuide
        failedStack.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        failedStack.topAnchor.constraint(equalTo: flagStackView.topAnchor, constant: 80).isActive = true
        failedStack.leadingAnchor.constraint(equalTo: flagStackView.leadingAnchor, constant: 20).isActive = true
        failedStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
