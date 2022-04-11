import UIKit

protocol AdicionaRefeicaoDelegate{
    func add(_ refeicao: Refeicao)
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        celula.textLabel?.text = itens[indexPath.row].nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else{
            return
        }
        
        
        if celula.accessoryType == .none{
            
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
            
        }else{
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(where: { $0.nome == item.nome }){
                itensSelecionados.remove(at: position)
                
                for itemSelecionado in itensSelecionados{
                    print(itemSelecionado.nome)
                }
            }
        }

    }
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    //var itens: [String] = ["Molho de tomate", "Queijo", "Molho apimentado", "Manjericão"]
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),
                         Item(nome: "Queijo", calorias: 80.0),
                         Item(nome: "Molho apimentado", calorias: 50.0),
                         Item(nome: "Manjericão", calorias: 20.0)
                        ]
    var itensSelecionados: Array<Item> = []
    
    // MARK: - IBOutlets
    
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var nomeTextField: UITextField?
    
    //MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }

        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
}

