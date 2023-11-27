import UIKit

class CircleView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    let cloudTop = CloudTopView()
    let cloudBottom = CloudBottomView()
    
    let star = UIImageView()
    
    var moom = UIImageView(image: UIImage(named: "circulo"))
    let imageView = UIImageView(image: UIImage(named: "placaCalc"))
    
    var options = ["Área (S)","Circunferência (C)", "Diâmetro (d)", "Raio (r)"]
    
    var textField:UITextField!
    let textFieldNumb = UITextField()
    
    var unusedOptionsLabels: [UILabel] = []
    var resultLabels: [UILabel] = []
    
    init(){
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "backgroundColor")
        
        addSubview()
        
        startAnimation()
       configureConstraints()
        pickerView()
        label()
        btnCalc()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(cloudTop)
        addSubview(cloudBottom)
        addSubview(moom)
        addSubview(imageView)
        addSubview(star)
    }
    
    func label() {
        textFieldNumb.placeholder = "Digite o Valor"
        
        textFieldNumb.translatesAutoresizingMaskIntoConstraints = false
        textFieldNumb.backgroundColor = UIColor(named: "backgroundColor")
        textFieldNumb.layer.borderWidth = 1
        textFieldNumb.layer.borderColor = UIColor.white.cgColor
        textFieldNumb.translatesAutoresizingMaskIntoConstraints = false
        textFieldNumb.layer.cornerRadius = 5
        textFieldNumb.textAlignment = .center
        textFieldNumb.textColor = .white
        textFieldNumb.font = .rounded(ofSize: 17, weight: .semibold)
        textFieldNumb.keyboardType = .decimalPad
        textFieldNumb.delegate = self
        textFieldNumb.keyboardAppearance = .dark
        let color = UIColor.lightText
        let placeholder = textFieldNumb.placeholder ?? ""
        textFieldNumb.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        addSubview(textFieldNumb)
        
        textFieldNumb.inputAccessoryView = createToolbarNumber()
        
        addSubview(textFieldNumb)
        
        NSLayoutConstraint.activate([
            textFieldNumb.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            textFieldNumb.centerYAnchor.constraint(equalTo: centerYAnchor,  constant: 10),
            textFieldNumb.widthAnchor.constraint(equalToConstant: 125),
            textFieldNumb.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func createToolbarNumber() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = .white
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Concluído", style: .done, target: self, action: #selector(doneButtonTappedNumber))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }
    
    @objc func commaButtonTapped() {
        if let text = textFieldNumb.text, !text.contains(",") {
            textFieldNumb.text = text + ","
        }
    }
    
    @objc func doneButtonTappedNumber() {
        textFieldNumb.resignFirstResponder()
    }
    
    func pickerView() {
        textField = UITextField()
        textField.placeholder = "Escolha a Entrada"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "backgroundColor")
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 5
        textField.textAlignment = .center
        textField.font = .rounded(ofSize: 17, weight: .semibold)
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        let color = UIColor.lightText
        let placeholder = textField.placeholder ?? ""
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor,  constant: 10),
            textField.widthAnchor.constraint(equalToConstant: 175),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        for index in 0..<3 {
            let label = UILabel()
            label.textAlignment = .center
            label.font = .rounded(ofSize: 17, weight: .semibold)
            label.textColor = .white
            label.backgroundColor = UIColor(named: "backgroundColor")
            label.layer.borderWidth = 2
            label.layer.borderColor = UIColor.white.cgColor
            label.layer.cornerRadius = 5
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = ""
            addSubview(label)
            unusedOptionsLabels.append(label)
            
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -65),
                label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: CGFloat(index * 50) + 90),
                label.widthAnchor.constraint(equalToConstant: 175),
                label.heightAnchor.constraint(equalToConstant: 40)
            ])
            
            let resultLabel = UILabel()
            resultLabel.textAlignment = .center
            resultLabel.font = .rounded(ofSize: 17, weight: .semibold)
            resultLabel.textColor = .white
            
            resultLabel.layer.borderWidth = 2
            resultLabel.layer.borderColor = UIColor.white.cgColor
            resultLabel.layer.cornerRadius = 5
            resultLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(resultLabel)
            resultLabels.append(resultLabel)
            
            NSLayoutConstraint.activate([
                resultLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: CGFloat(index * 50) + 90),
                resultLabel.widthAnchor.constraint(equalToConstant: 125),
                resultLabel.heightAnchor.constraint(equalToConstant: 40),
                resultLabel.leadingAnchor.constraint(equalTo: unusedOptionsLabels[index].trailingAnchor, constant: 10)
            ])
            
        }
        
        let picker = UIPickerView()
        picker.sizeToFit()
        picker.delegate = self
        picker.dataSource = self
        textField.inputView = picker
        textField.inputAccessoryView = createToolbar()
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = .white
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Concluído", style: .done, target: self, action: #selector(doneButtonTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }
    
    @objc func doneButtonTapped() {
        textField.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .rounded(ofSize: 18, weight: .semibold)
        label.text = options[row]
        return label
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = options[row]
        
        switch textField.text {
        case "Raio (r)":
            moom.image = UIImage(named: "raio")
        case "Diâmetro (d)":
            moom.image = UIImage(named: "diametro")
        case "Área (S)":
            moom.image = UIImage(named: "area")
        default:
            moom.image = UIImage(named: "circunf")
        }
      
            clearResultLabels()
            
        updateUnusedOptionsLabels(selectedOption: textField.text ?? "")
    }
    func updateUnusedOptionsLabels(selectedOption: String) {
        let unusedOptions = options.filter { $0 != selectedOption }
        
        for index in 0..<min(unusedOptions.count, unusedOptionsLabels.count) {
            unusedOptionsLabels[index].text = unusedOptions[index]
        }
        
        for index in unusedOptions.count..<unusedOptionsLabels.count {
            unusedOptionsLabels[index].text = nil
            resultLabels[index].text = ""
        }
    }
    
    func clearResultLabels() {
        for label in resultLabels {
            label.text = ""
        }
        textFieldNumb.text = ""
    }
    
    func btnCalc(){
        let calcularButton = UIButton(type: .system)
        calcularButton.setTitle("Calcular", for: .normal)
        calcularButton.titleLabel?.font = .rounded(ofSize: 19, weight: .bold)
        calcularButton.setTitleColor(UIColor(named: "backgroundColor"), for: .normal)
        calcularButton.backgroundColor = .white
        calcularButton.layer.cornerRadius = 8
        
        calcularButton.addTarget(self, action: #selector(calcularButtonTapped), for: .touchUpInside)
        
        addSubview(calcularButton)
        
        calcularButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calcularButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calcularButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 270),
            calcularButton.widthAnchor.constraint(equalToConstant: 185),
            calcularButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    @objc func calcularButtonTapped() {
        guard let selectedOption = textField.text else {
            return
        }

        var valorRaio: Double = 0
        var valorCircunferencia: Double = 0
        var valorDiametro: Double = 0
        var valorArea: Double = 0

        switch selectedOption {
        case "Raio (r)":
            valorRaio = Double(textFieldNumb.text ?? "") ?? 0
        case "Diâmetro (d)":
            valorDiametro = Double(textFieldNumb.text ?? "") ?? 0
        case "Área (S)":
            valorArea = Double(textFieldNumb.text ?? "") ?? 0
        case "Circunferência (C)":
            valorCircunferencia = Double(textFieldNumb.text ?? "") ?? 0
        default:
            print("Opção não reconhecida")
        }

        let calculo = Calculation(valorRaio: valorRaio, valorCircunferencia: valorCircunferencia, valorDiametro: valorDiametro, valorArea: valorArea)

        var resultados: (Double, Double, Double) = (0, 0, 0)

        switch selectedOption {
        case "Raio (r)":
            let area = calculo.calculoArea()
            let circunferencia = calculo.calculoCircunferencia()
            let diametro = calculo.calculoDiametro()
            resultados = (area, circunferencia, diametro)
        case "Diâmetro (d)":
            let area = calculo.calculoArea()
            let circunferencia = calculo.calculoCircunferencia()
            let raio = calculo.calculoRaio()
            resultados = (raio, circunferencia, area)
        case "Área (S)":
            let circunferencia = calculo.calculoCircunferencia()
            let diametro = calculo.calculoDiametro()
            let raio = calculo.calculoRaio()
            resultados = (circunferencia, diametro, raio)
        case "Circunferência (C)":
            let area = calculo.calculoArea()
            let diametro = calculo.calculoDiametro()
            let raio = calculo.calculoRaio()
            resultados = (area, diametro, raio)
        default:
            print("Opção não reconhecida")
        }

        resultLabels[0].text = String(format: "%.2f", resultados.0).replacingOccurrences(of: ".00", with: "")
        resultLabels[1].text = String(format: "%.2f", resultados.1).replacingOccurrences(of: ".00", with: "")
        resultLabels[2].text = String(format: "%.2f", resultados.2).replacingOccurrences(of: ".00", with: "")
    }
    
    func configureAnimation() {
        var animationImages: [UIImage] = []
        for i in 1...3 {
            if let image = UIImage(named: "estrelas\(i)") {
                animationImages.append(image)
            }
        }
        star.animationImages = animationImages
        star.animationDuration = 1.0
        star.animationRepeatCount = 0
        star.contentMode = .scaleAspectFit
    }

    private func startAnimation() {
        configureAnimation()
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.star.startAnimating()
        }, completion: nil)
    }
  
    private func configureConstraints() {
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        star.translatesAutoresizingMaskIntoConstraints = false
        cloudBottom.translatesAutoresizingMaskIntoConstraints = false
        moom.translatesAutoresizingMaskIntoConstraints = false
        cloudTop.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cloudTop.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudTop.topAnchor.constraint(equalTo: topAnchor, constant: 115),
            
            cloudBottom.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudBottom.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            
            moom.centerXAnchor.constraint(equalTo: centerXAnchor),
            moom.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -180),
            
            imageView.topAnchor.constraint(equalTo: moom.bottomAnchor, constant: -30),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            
            star.topAnchor.constraint(equalTo: topAnchor),
            star.leadingAnchor.constraint(equalTo: leadingAnchor),
            star.trailingAnchor.constraint(equalTo: trailingAnchor),
            star.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
}
