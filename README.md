<div align="center">

# Lunar

### Calculadora geometrica iOS com tema lunar, animacoes fluidas e personagem interativa -- construida com UIKit e Coordinator Pattern

[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![UIKit](https://img.shields.io/badge/UIKit-0D96F6?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/documentation/uikit)
[![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)

</div>

---

## Demo

<div align="center">

<img src="Screenshots/demo.gif" width="300" alt="Demo do app">

</div>

---

## Sobre o Projeto

**Lunar** e um aplicativo iOS educativo de geometria com uma identidade visual imersiva inspirada no espaco. O app apresenta a Lunar, uma personagem animada que guia o usuario no calculo de propriedades do circulo -- raio, diametro, circunferencia e area -- a partir de qualquer valor conhecido. Toda a interface foi construida programaticamente com UIKit, sem storyboards, utilizando Auto Layout e animacoes customizadas.

---

## Funcionalidades

- **Personagem animada** -- Lunar com animacao frame-by-frame (8 sprites) e efeito flutuante
- **Calculadora de circulo** -- calcula raio, diametro, circunferencia e area a partir de qualquer valor
- **Picker de propriedades** -- selecione qual valor inserir e os demais sao calculados automaticamente
- **Animacoes de nuvens** -- camadas de nuvens superiores e inferiores com bounce continuo
- **Animacao de estrelas** -- fundo estelar animado na tela de calculo
- **Diagrama interativo** -- lua com representacao visual de raio, diametro e area
- **Interface programatica** -- 100% construida com ViewCode e Auto Layout, sem storyboards

---

## Tecnologias

- **Swift** -- linguagem principal do desenvolvimento
- **UIKit** -- construcao de toda a interface programaticamente
- **Auto Layout** -- constraints programaticas para layout responsivo
- **UIView.animate** -- animacoes fluidas e recursivas para nuvens e personagem
- **UIPickerView** -- seletor de propriedades geometricas
- **Coordinator Pattern** -- navegacao desacoplada entre telas
- **ViewCode** -- interface sem storyboards, 100% em codigo

---

## Arquitetura

O projeto utiliza o padrao **Coordinator** para gerenciar a navegacao e uma separacao clara entre View e Controller.

```
Luna/
├── Application/
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Sources/
│   ├── Circle/
│   │   ├── Calculation.swift        ← modelo de calculo
│   │   ├── CircleView.swift         ← interface da calculadora
│   │   └── CircleViewController.swift
│   ├── CloudView/
│   │   ├── CloudBottomView.swift    ← nuvens inferiores animadas
│   │   └── CloudTopView.swift       ← nuvens superiores animadas
│   ├── Coordinator/
│   │   ├── Coordinator.swift        ← protocolo base
│   │   └── MainCoordinator.swift    ← navegacao entre telas
│   ├── Extensions/
│   │   └── UIFont+Rounded.swift     ← SF Rounded font
│   └── Intro/
│       ├── Controller/
│       │   └── IntroViewController.swift
│       └── View/
│           ├── IntroView.swift      ← tela inicial com menu
│           └── LunaView.swift       ← personagem animada
└── Resources/
    └── Assets.xcassets/             ← sprites, nuvens, diagramas
```

---

## Como Executar

1. Clone o repositorio

```bash
git clone https://github.com/GeozedequeGuimaraes/Lunar.git
```

2. Abra o arquivo `Luna.xcodeproj` no Xcode

3. Selecione um simulador ou dispositivo fisico (iOS 17+)

4. Execute o projeto com `Cmd + R`

---

## Contexto

Projeto desenvolvido no **Apple Developer Academy** -- CIn-UFPE (Recife, PE, Brasil).

---

## Screenshots

<div align="center">

| Tela Inicial | Calculadora |
|:---:|:---:|
| <img src="Screenshots/intro.png" width="280"> | <img src="Screenshots/calculator.png" width="280"> |

</div>

---

## Autor

<div align="center">

**Geozedeque Guimaraes**
Estudante de Ciencia da Computacao -- CIn-UFPE

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/GeozedequeGuimaraes)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/geozedeque-guimaraes)

</div>
