import UIKit

class CloudTopView: UIView {
    let cloudTopOne = UIImageView(image: UIImage(named: "cima1"))
    let cloudTopTow = UIImageView(image: UIImage(named: "cima2"))
    let cloudTopThree = UIImageView(image: UIImage(named: "cima3"))
    
    init(controller: IntroViewController? = nil) {
        super.init(frame: .zero)
        addSubview(cloudTopOne)
        addSubview(cloudTopTow)
        addSubview(cloudTopThree)
        configureConstraints()
        startAnimation()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateCloudTopOne() {
            UIView.animate(withDuration: 1.7, animations: {
                self.cloudTopOne.center.y += 10
            }) { _ in
                UIView.animate(withDuration: 1.7, animations: {
                    self.cloudTopOne.center.y -= 10
                }) { _ in
                    self.animateCloudTopOne()
                }
            }
        }
        
        func animateCloudTopTow() {
            UIView.animate(withDuration: 1.7, animations: {
                self.cloudTopTow.center.y -= 5
            }) { _ in
                UIView.animate(withDuration: 1.7, animations: {
                    self.cloudTopTow.center.y += 5
                }) { _ in
                    self.animateCloudTopTow()
                }
            }
        }
        
        func animateCloudTopThree() {
            UIView.animate(withDuration: 1.7, animations: {
                self.cloudTopThree.center.y += 8
            }) { _ in
                UIView.animate(withDuration: 1.7, animations: {
                    self.cloudTopThree.center.y -= 8
                }) { _ in
                    self.animateCloudTopThree()
                }
            }
            
        }
    
    func startAnimation() {
        animateCloudTopOne()
        animateCloudTopTow()
        animateCloudTopThree()
        
        cloudTopOne.startAnimating()
        cloudTopTow.startAnimating()
        cloudTopThree.startAnimating()
    }

    func configureConstraints() {
        cloudTopOne.translatesAutoresizingMaskIntoConstraints = false
        cloudTopTow.translatesAutoresizingMaskIntoConstraints = false
        cloudTopThree.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            cloudTopOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudTopOne.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            cloudTopTow.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudTopTow.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -57),
            cloudTopThree.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudTopThree.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70),
        ])
    }
    

}

