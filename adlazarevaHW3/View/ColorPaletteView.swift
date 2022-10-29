//
//  ColorPaletteView.swift
//  adlazarevaHW3
//
//  Created by Настя Лазарева on 28.10.2022.
//

import Foundation
import UIKit


extension UIColor{
    
    func getComponents() -> [CGFloat] {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return [red, green, blue, alpha]
        }
    
    
    var redComponent: CGFloat{
        let components = getComponents();
        return components[0]
    }
    
    var greenComponent: CGFloat{
        let components = getComponents();
        return components[1]
    }
    
    var blueComponent: CGFloat{
        let components = getComponents();
        return components[2]
    }
    var alphaComponent: CGFloat{
        let components = getComponents();
        return components[3]
    }
    
}



final class ColorPaletteView: UIControl{
    
    var delegate : ColorChangeProtocol?
    
    private let stackView = UIStackView()
    private(set) var chosenColor : UIColor = .systemGray
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let redControl = ColorSliderView(colorName: "R", value:
        Float(chosenColor.redComponent))
        let greenControl = ColorSliderView(colorName: "G", value:
        Float(chosenColor.greenComponent))
        let blueControl = ColorSliderView(colorName: "B", value:
        Float(chosenColor.blueComponent))
                redControl.tag = 0
                greenControl.tag = 1
                blueControl.tag = 2
        
                stackView.axis = .vertical
                stackView.distribution = .equalSpacing
                stackView.addArrangedSubview(redControl)
                stackView.addArrangedSubview(greenControl)
                stackView.addArrangedSubview(blueControl)
                stackView.backgroundColor = .white
                stackView.layer.cornerRadius = 12
        
        [redControl, greenControl, blueControl].forEach { $0.addTarget(self, action: #selector(sliderMoved(slider:)),
        for: .touchDragInside)
                }
        
                addSubview(stackView)
       
        stackView.pin(to: self)
                
    }
    
    @objc
    func sliderMoved(slider: ColorSliderView) {
        switch slider.tag {
        case 0:
            self.chosenColor = UIColor(
                red: CGFloat(slider.value),
                green: chosenColor.greenComponent,
                blue: chosenColor.blueComponent,
                alpha: chosenColor.alphaComponent
            )
        case 1:
            self.chosenColor = UIColor(
                red: chosenColor.redComponent,
                green: CGFloat(slider.value),
                blue: chosenColor.blueComponent,
                alpha: chosenColor.alphaComponent
            )
        default:
            self.chosenColor = UIColor(
                red: chosenColor.redComponent,
                green: chosenColor.greenComponent,
                blue: CGFloat(slider.value),
                alpha: chosenColor.alphaComponent
            )
            
        }
        sendActions(for: .touchDragInside)
        delegate?.changeColor(chosenColor)
        //stackView.backgroundColor = chosenColor
    }
}

extension ColorPaletteView{
       final class ColorSliderView:UIControl{
        
        private let slider = UISlider()
        private let colorLabel = UILabel()
        
        private(set) var value: Float
        
        init(colorName: String, value: Float) {
            self.value = value
            super.init(frame: .zero)
            
            slider.value = value
            colorLabel.text = colorName
            setupView()
            slider.addTarget(self, action: #selector(sliderMoved(_:)), for: .touchDragInside)
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
            
        private func setupView() {
            let stackView = UIStackView(arrangedSubviews:
        [colorLabel, slider])
            stackView.axis = .horizontal
            stackView.spacing = 8
            
            addSubview(stackView)
            stackView.pin(to: self, [.left: 12, .top: 12, .right: 12, .bottom: 12])
        }
        
        @objc
        func sliderMoved(_ slider: UISlider) {
            self.value = slider.value
            sendActions(for: .touchDragInside)
            
        }
        
        
    }
}
