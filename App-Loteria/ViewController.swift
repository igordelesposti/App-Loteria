//
//  ViewController.swift
//  Loteria
//
//  Created by Igor Delesposti on 19/03/21.
//

import UIKit

enum GameType: String {
  case megasena = "Mega-Sena"
  case quina = "Quina"
}

//operador personalizado
//total - quantidade de jogos
//universe - quantidade de números
infix operator >-<
func >-< (total: Int, universe: Int) -> [Int] {
  var result: [Int] = []
  while result.count < total {
    let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
    if !result.contains(randomNumber){
      result.append(randomNumber)
    }
  }
  //ordem crescente .sorted()
  return result.sorted()
}

class ViewController: UIViewController {
  @IBOutlet weak var lbGameType: UILabel!
  @IBOutlet weak var scGameType: UISegmentedControl!
  @IBOutlet var balls: [UIButton]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showNumbers(for: .megasena)
    // Do any additional setup after loading the view.
  }
  
  //mostre os números para um gameType
  func showNumbers(for type: GameType){
    lbGameType.text = type.rawValue
    var game: [Int] = []
    switch type {
      case .megasena:
        //6 bolinhas do intervalo de 60 numeros
        game = 6>-<60
        balls.last!.isHidden = false
      case .quina:
        game = 5>-<80
        balls.last!.isHidden = true
    }
    //Precisamos de um índice, para pegar a bola correspondente e trocar o rótulo dela, para isso usamos o enumerated() ele devolve uma tupla de chave e valor
    for (index, game) in game.enumerated(){
      balls[index].setTitle("\(game)", for: .normal)
    }
  }
  
  @IBAction func generateGame() {
    //o segmento de controle (botão mega-sena ou quina) é um array acessado pelo index 0,1 por isso usamos a propriedade .selectedSegmentIndex
    switch scGameType.selectedSegmentIndex {
      case 0:
        showNumbers(for: .megasena)
      default:
        showNumbers(for: .quina)
    }
  }

}

//UTILIZANDO O STACKVIEW ELA REORGANIZA OS DEMAIS QUANDO SAI UM ELEMENTO NA ESTILIZAÇÃO DAS BOLINHAS

