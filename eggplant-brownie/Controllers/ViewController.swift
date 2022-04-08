import UIKit

protocol ViewControllerDelegate{
    func add(_ refeicao: Refeicao)
}
class ViewController: UIViewController {

    var delegate: ViewControllerDelegate?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var nomeTextField: UITextField?
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }

        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
}

