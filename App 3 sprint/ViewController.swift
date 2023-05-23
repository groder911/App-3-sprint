
import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var TextViewHistiory: UITextView!
    @IBOutlet weak var ClearButton: UIButton!
    @IBOutlet weak var MinusButton: UIButton!
    @IBOutlet weak var PlusButton: UIButton!
    @IBOutlet weak var CountLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CountLabel.text = "0"
        TextViewHistiory.text = "История изменений:"
    }
    
    var scope: Int = 0
    var history: [String] = []
    var date: String = ""
    
    private func DateTime() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: currentDate)
    }
    
    private func UpdateCountLabel() {
        CountLabel.text = "Значение счетчика: \(scope)"
    }
    
    @IBAction func ClearButton(_ sender: Any) {
        scope = 0
        UpdateCountLabel()
        history.append( "\(DateTime()):значение сброшено")
        TextViewHistiory.text = "\(history)"
        
    }
    @IBAction func MinusButton(_ sender: Any) {
        scope -= 1
        if scope < 0 { scope = 0
            history.append( "\(DateTime()):попытка уменьшить значение счётчика ниже 0")
            TextViewHistiory.text = "\(history)"}
        else {
            UpdateCountLabel()
            history.append( "\(DateTime()): значение изменено на -1")
            TextViewHistiory.text = "\(history)"}
        
    }
    @IBAction func PlusButton(_ sender: Any) {
        scope += 1
        UpdateCountLabel()
        history.append( "\(DateTime()):значение изменено на +1")
        TextViewHistiory.text = "\(history)"
    }
    
}
//commit

