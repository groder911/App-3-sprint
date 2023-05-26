import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet  private weak var uploadViewHistiory: UITextView!
    @IBOutlet  private weak var clearButton: UIButton!
    @IBOutlet  private weak var minusButton: UIButton!
    @IBOutlet  private weak var plusButton: UIButton!
    @IBOutlet  private weak var countLabel: UILabel!
    
    var scope: Int = 0
    var history: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countLabel.text = "0"
        uploadViewHistiory.text = "История изменений:"
    }
    
    private func updateCurrentDateTime() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: currentDate)
    }
    
    private func UpdateCountLabel() {
        countLabel.text = "Значение счетчика: \(scope)"
    }
    
    @IBAction private func clearButton(_ sender: Any) {
        scope = 0
        UpdateCountLabel()
        history.append( "\(updateCurrentDateTime()):значение сброшено")
        uploadViewHistiory.text = "\(history)"
        uploadViewHistiory.text = history.joined(separator: "\n")
    }
    
    @IBAction private func minusButton(_ sender: Any) {
        scope -= 1
        if scope < 0 { scope = 0
            history.append( "\(updateCurrentDateTime()):попытка уменьшить значение счётчика ниже 0")
            uploadViewHistiory.text = "\(history)"
            uploadViewHistiory.text = history.joined(separator: "\n")}
        else {
            UpdateCountLabel()
            history.append( "\(updateCurrentDateTime()): значение изменено на -1")
            uploadViewHistiory.text = "\(history)"
            uploadViewHistiory.text = history.joined(separator: "\n")}
    }
    
    @IBAction private func plusButton(_ sender: Any) {
        scope += 1
        UpdateCountLabel()
        history.append( "\(updateCurrentDateTime()):значение изменено на +1")
        uploadViewHistiory.text = "\(history)"
        uploadViewHistiory.text = history.joined(separator: "\n")
    }
}


