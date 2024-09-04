import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let CORE_URL: String = "https://data.fixer.io/api"
    
    var currencyResponseList = [CurrencyResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("HomeViewController")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        
        let parameters = ["access_key": "d4eff189c2b2ab7c468eb9c2ef16eec2"]
        var urlComponents = URLComponents(string: CORE_URL + "/latest")!
        
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents.url else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response status code")
                return
            }
            
            if let data = data {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Data in string: \(dataString)")
                }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let response: Response = try jsonDecoder.decode(Response.self, from: data)
                    
                    print("IS RESPONSE SUCCESS? \(response.success)")
                    
                    // Rastgele değişim oranları ekleme
                    self.currencyResponseList.removeAll()
                    for (currencyName, value) in response.rates {
                        let randomRate = self.randomChangeRate()
                        let element = CurrencyResponse(currencyName: currencyName, value: value, changeRate: randomRate)
                        self.currencyResponseList.append(element)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let errorInParsing {
                    print("Error in parsing: \(errorInParsing.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
    
    func randomChangeRate() -> Double {
        return Double.random(in: -1.0...1.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyResponseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell

        let currency = currencyResponseList[indexPath.row]
        cell.iconLabel.text = currency.currencyName
        cell.fromLabel.text = currency.currencyName
        cell.toLabel.text = "EUR"

        let formattedValue = String(format: "%.2f", currency.value)
        cell.priceLabel.text = formattedValue

        
        let formattedChangeRate = String(format: "%.2f%%", abs(currency.changeRate) )
        cell.changeRateLabel.text = formattedChangeRate

        
        if currency.changeRate >= 0 {
            cell.changeRateLabel.textColor = .green
        } else {
            cell.changeRateLabel.textColor = .orange
        }

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

