//
//  main.swift
//  Abstract Factory
//
//  Created by Никита Строков on 25.04.2020.
//  Copyright © 2020 Никита Строков. All rights reserved.
//

import Foundation

protocol Button {
    var size: CGRect? {set get}
    func pushButton()
}

class ButtonIphone: Button {
    var size: CGRect?
    func pushButton() {
        print ("Push iPhone button!")
    }
}
class ButtonIpad: Button {
    var size: CGRect?
    func pushButton() {
        print("Push iPad button!")
    }
}

protocol Image {
    var size: CGRect? {set get}
    func pushOnImage()
}

class ImageIphone: Image {
    var size: CGRect?
    func pushOnImage() {
        print("Push on iPhone image")
    }
}
class ImageIpad: Image {
    var size: CGRect?
    func pushOnImage() {
        print("Push in iPad image")
    }
}

protocol TextView {
    var size: CGRect? {set get}
    func didEnterText()
}
class TextViewIphone: TextView {
    var size: CGRect?
    func didEnterText() {
        print("Enter text on iPhone")
    }
}
class TextViewIpad: TextView {
    var size: CGRect?
    func didEnterText() {
        print("Enter text on iPad")
    }
}

protocol AbstractFactory {
    func createButton() -> Button
    func createImage() -> Image
    func createTextView() -> TextView
}


class iPhoneFactory: AbstractFactory {
    func createImage() -> Image {
        return ImageIphone()
    }
    func createButton() -> Button {
        return ButtonIphone()
    }
    func createTextView() -> TextView {
        return TextViewIphone()
    }
}

class iPadFactory: AbstractFactory {
    func createImage() -> Image {
        return ImageIpad()
    }
    func createTextView() -> TextView {
        return TextViewIpad()
    }
    func createButton() -> Button {
        return ButtonIpad()
    }
}

var button: Button?
var image: Image?
var textView: TextView?

var factory: AbstractFactory?

if (true) {
   factory = iPhoneFactory()
} else {
    factory = iPadFactory()
}

button = factory!.createButton()
image = factory!.createImage()
textView = factory!.createTextView()
