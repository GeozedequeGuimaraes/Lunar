
import Foundation
import UIKit

class Calculation {
    var raio: Double
    var circunferencia: Double
    var diametro: Double
    var area: Double

    init(valorRaio: Double, valorCircunferencia: Double, valorDiametro: Double, valorArea: Double) {
        raio = valorRaio
        circunferencia = valorCircunferencia
        diametro = valorDiametro
        area = valorArea
    }

    func calculoCircunferencia() -> Double {
        if raio != 0 {
            return 2 * Double.pi * raio
        } else if area != 0 {
            return 2 * Double.pi * sqrt(area / Double.pi)
        } else if diametro != 0 {
            return Double.pi * diametro
        } else {
            return circunferencia
        }
    }

    func calculoDiametro() -> Double {
        if raio != 0 {
            return 2 * raio
        } else if area != 0 {
            return 2 * sqrt(area / Double.pi)
        } else if circunferencia != 0 {
            return circunferencia / Double.pi
        } else {
            return diametro
        }
    }

    func calculoArea() -> Double {
        if raio != 0 {
            return Double.pi * raio * raio
        } else if circunferencia != 0 {
            return pow(circunferencia / (2 * Double.pi), 2) * Double.pi
        } else if diametro != 0 {
            return Double.pi * pow(diametro / 2, 2)
        } else {
            return area
        }
    }

    func calculoRaio() -> Double {
        if area != 0 {
            return sqrt(area / Double.pi)
        } else if circunferencia != 0 {
            return circunferencia / (2 * Double.pi)
        } else if diametro != 0 {
            return diametro / 2
        } else {
            return raio
        }
    }
}
