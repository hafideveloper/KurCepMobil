//
//  ViewController.swift
//  KurCepMobil
//
//  Created by Apple on 28.08.2024.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("HomeViewController")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        
        let parameters = ["access_key":"d4eff189c2b2ab7c468eb9c2ef16eec2"]
        var urlComponents = URLComponents(string: "https://data.fixer.io/api/latest")!
        
        urlComponents.queryItems = parameters.map{URLQueryItem(name:
            $0.key, value: $0.value)
        }
            
            guard let url = urlComponents.url else {
                print("invalid url")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error
                 in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Invalid response status code not 200")
                return
            }
                if let data = data {
                    if let dataString = String(data: data, encoding: .utf8) {
                        print("Data is in string: \(dataString)")
                    }
                }
                //print("data: \(data)")
                
            }
        task.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for:indexPath) as!
            MyTableViewCell
        
        cell.imageView?.image = nil
        //cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        //cell.imageView?.frame.size = CGSize (width: 10, height: 10)
        //cell.imageView?.clipsToBounds = true
        cell.imageView?.image = currencyList[indexPath.row].currencyIcon
        //cell.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        
            cell.fromLabel.text = currencyList[indexPath.row].currencyName
            cell.toLabel.text = "TRY"
            cell.changeRateLabel.text = String(currencyList[indexPath.row].changeRate)
            cell.priceLabel.text = String(currencyList[indexPath.row].price)
        
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
            return cell
        }
        
    /*
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
     */
    
}

