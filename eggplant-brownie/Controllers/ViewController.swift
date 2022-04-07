//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Matheus Eli on 05/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var nomeTextField: UITextField?
    @IBAction func adicionar(_ sender: Any) {
        
//        if let nomeDaRefeicao = nomeTextField?.text,
//            let felicidadeDaRefeicao = felicidadeTextField?.text{
//
//            let nome = nomeDaRefeicao
//
//            if let felicidade = Int(felicidadeDaRefeicao){
//
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//
//                print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
//
//            }else{
//                print("Erro ao tentar criar a refeição!")
//            }
//        }
        
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }

        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        
    }
}

