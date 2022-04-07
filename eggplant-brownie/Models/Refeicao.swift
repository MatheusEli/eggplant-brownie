import Foundation

class Refeicao{
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    init(nome: String, felicidade: Int){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double{
        var total = 0.0
        
        for item in itens{
            total += item.calorias
        }
        
        return total
    }
}
