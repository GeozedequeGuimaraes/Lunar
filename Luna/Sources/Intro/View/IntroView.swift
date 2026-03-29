import UIKit

class IntroView: UIView {
    let lunaView = LunaView()
    let cloudTop = CloudTopView()
    let cloudBottom = CloudBottomView()
    weak var delegate: IntroViewDelegate?
    
    // MARK: - Properties
    private let imageView = UIImageView()
    private let label = UILabel()
    private let button1 = UIButton(type: .system)
    private let button2 = UIButton(type: .system)
    private let button3 = UIButton(type: .system)
    
    weak var controller: IntroViewController?
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        setupViews()
        
        addSubview()
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func addSubview() {
        addSubview(cloudTop)
        addSubview(lunaView)
        addSubview(imageView)
        addSubview(label)
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        addSubview(cloudBottom)
    }
    
    private func setupViews() {
        imageView.image = UIImage(named: "placa")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        
        label.attributedText = addLetterSpacing("OLÁ! SOU A LUNAR \n O QUE VAMOS CALCULAR HOJE?", letterSpacing: 0.5)
        label.textColor = .white
        label.font = .rounded(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        
        button1.setTitle("Círculo", for: .normal)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.backgroundColor = UIColor(named: "backgroundColor")
        button1.layer.cornerRadius = 5
        button1.titleLabel?.font = .rounded(ofSize: 18, weight: .semibold)
      
        button2.setTitle("Esfera", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.backgroundColor = UIColor(named: "backgroundColor")
        button2.layer.cornerRadius = 5
        button2.titleLabel?.font = .rounded(ofSize: 18, weight: .semibold)
    
        button3.setTitle("Semi Esfera", for: .normal)
        button3.setTitleColor(UIColor.white, for: .normal)
        button3.backgroundColor = UIColor(named: "backgroundColor")
        button3.layer.cornerRadius = 5
        button3.titleLabel?.font = .rounded(ofSize: 18, weight: .semibold)
          
        addBorder(button1)
        addBorder(button2)
        addBorder(button3)
        
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    
    }
    
    func addLetterSpacing(_ text: String, letterSpacing: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.kern, value: letterSpacing, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
    
    private func addBorder(_ button: UIButton) {
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(named: "colorBorder")?.cgColor
    }
    // MARK: - Action Handling
    
    @objc func buttonTapped(_ sender: UIButton) {
        delegate?.buttonPressed(sender)
    }
  
    // MARK: - Layout Constraints
    
    private func configureConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        lunaView.translatesAutoresizingMaskIntoConstraints = false
        cloudTop.translatesAutoresizingMaskIntoConstraints = false
        cloudBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            lunaView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 66),
            cloudBottom.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudBottom.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            
            cloudTop.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudTop.topAnchor.constraint(equalTo: topAnchor, constant: 115),
            
            lunaView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lunaView.topAnchor.constraint(equalTo: cloudTop.bottomAnchor, constant: 300),
            
            label.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 66),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            button1.centerXAnchor.constraint(equalTo: centerXAnchor),
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25),
            button1.widthAnchor.constraint(equalToConstant: 280),
            button1.heightAnchor.constraint(equalToConstant: 45),
            
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 25),
            button2.widthAnchor.constraint(equalToConstant: 280),
            button2.heightAnchor.constraint(equalToConstant: 45),
            
            button3.centerXAnchor.constraint(equalTo: centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 25),
            button3.widthAnchor.constraint(equalToConstant: 280),
            button3.heightAnchor.constraint(equalToConstant: 45),
            
            imageView.topAnchor.constraint(equalTo: lunaView.bottomAnchor, constant: -100),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 392),
            imageView.heightAnchor.constraint(equalToConstant: 399),
        ])
    }
}


