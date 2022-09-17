//
//  ViewController.swift
//  AsyncExampleSnapKit
//
//  Created by 오동규 on 2022/09/17.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let imageView = UIImageView()
    let downloadBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        // Do any additional setup after loading the view.
    }

    private func initView() {
        self.makePresentView()
        self.makeDownloadBtn()
    }
}

extension ViewController {
    
    private func makePresentView() {
        self.view.addSubview(self.imageView)
        
        self.imageView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(300)
            make.height.equalTo(150)
            make.centerX.equalTo(self.view)
            make.top.equalTo(view.snp.top).offset(100)
        }
    }
    
    private func makeDownloadBtn() {
        self.view.addSubview(self.downloadBtn)
        
        self.setButtonStyle()
        
        self.downloadBtn.addTarget(self, action: #selector(didTappedDownloadBtn(_:)), for: .touchUpInside)
        
        self.downloadBtn.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.imageView)
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
        }
    }
    
    
    @objc
    private func didTappedDownloadBtn(_ sender: UIButton) {
        
        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/LARGE_elevation.jpg/1600px-LARGE_elevation.jpg?20060312070100")!
        
        OperationQueue().addOperation {
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image: UIImage = UIImage(data: imageData)!
            
            OperationQueue.main.addOperation  {
                self.imageView.image = image
            }
        }
    
    }
    
    private func setButtonStyle() {
        self.downloadBtn.setTitle("Download", for: .normal)
        self.downloadBtn.setTitleColor(.black, for: .normal)
        self.downloadBtn.backgroundColor = .yellow
    }
    
    
}
