//
//  ViewController.swift
//  AdivinaElNumero
//
//  Created by MacBook Air  on 23/04/20.
//  Copyright © 2020 MacBook Air . All rights reserved.
// Thelma Rangel

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numeroLabel: UILabel!
    
    @IBOutlet weak var okBoton: UIButton!
    
    @IBOutlet weak var volverAjugar: UIButton!
    
    var miNumeroAleatorio = Int.random(in: 1..<10)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        okBoton.layer.cornerRadius = 20
        print(miNumeroAleatorio)
        volverAjugar.layer.cornerRadius = 20
        
    }
    
    @IBAction func miStepper(_ sender: UIStepper) {
        numeroLabel.text = String(Int(sender.value))
        
    }
    
     var i = 0
    
    @IBAction func okAccion(_ sender: UIButton) {
       
            if numeroLabel.text == String(miNumeroAleatorio){
                print("Ok adivinaste")
            }else{
                print("NO ADIVINASTE")
               i += 1
            }
 
  
        print("Intento \(i)")
        
        if i == 3{
            let alert = UIAlertController(title: "Upps", message: "Se te acabaron los intentos", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            self.view.backgroundColor = .red
            
        }
        else if  numeroLabel.text == String(miNumeroAleatorio)
        {
            let alert3 = UIAlertController(title: "Adivinaste", message: "You are the winner 🥳", preferredStyle: .alert)
            let okAction3 = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert3.addAction(okAction3)
            self.present(alert3, animated: true, completion: nil)
          
            self.view.backgroundColor = .green
            
            
            //aqui gira sólo a 180º
            
            UIView.animate(withDuration: 0.8) { () -> Void in
                 self.numeroLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }
 
           //aqui gira de 180º a su posicion original
            UIView.animate(withDuration: 0.5, delay: 0.45, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
                 self.numeroLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0)
            }, completion: nil)
            print("El ángulo es:")
            print(CGFloat.pi * 2.0)
           
        }else
        {
            let num = Int(String(numeroLabel.text!))
            let pistaGrande = "Es más grande"
            let pistaPequeño = "Es más pequeño"
            var pista : String
            if num! > miNumeroAleatorio{
                pista = pistaPequeño
            }else{
                pista = pistaGrande
            }
            
            let alert2 = UIAlertController(title: "Intento # \(i)", message: "Pista: \(pista) ", preferredStyle: .alert)
            let okAction2 = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert2.addAction(okAction2)
            self.present(alert2, animated: true, completion: nil)
            
            
        }
        
        
    }
    
    
    @IBAction func volverAjugar(_ sender: UIButton) {
        
        numeroLabel.text = "?"
        self.view.backgroundColor = .white
        miNumeroAleatorio = Int.random(in: 1..<10)
        print("nuevo numero aleatorio \(miNumeroAleatorio)")
        i = 0
        
    }
    


}

