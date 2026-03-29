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

        cloudTopOne.contentMode = .scaleAspectFill
        cloudTopTow.contentMode = .scaleAspectFill
        cloudTopThree.contentMode = .scaleAspectFill
        cloudTopOne.clipsToBounds = true
        cloudTopTow.clipsToBounds = true
        cloudTopThree.clipsToBounds = true

        NSLayoutConstraint.activate([
            cloudTopThree.leadingAnchor.constraint(equalTo: leadingAnchor),
            cloudTopThree.trailingAnchor.constraint(equalTo: trailingAnchor),
            cloudTopThree.topAnchor.constraint(equalTo: topAnchor),
            cloudTopThree.heightAnchor.constraint(equalToConstant: 60),

            cloudTopTow.leadingAnchor.constraint(equalTo: leadingAnchor),
            cloudTopTow.trailingAnchor.constraint(equalTo: trailingAnchor),
            cloudTopTow.topAnchor.constraint(equalTo: cloudTopThree.bottomAnchor, constant: -20),
            cloudTopTow.heightAnchor.constraint(equalToConstant: 60),

            cloudTopOne.leadingAnchor.constraint(equalTo: leadingAnchor),
            cloudTopOne.trailingAnchor.constraint(equalTo: trailingAnchor),
            cloudTopOne.topAnchor.constraint(equalTo: cloudTopTow.bottomAnchor, constant: -20),
            cloudTopOne.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    

}

