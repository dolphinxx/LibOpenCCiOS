//
//  ViewController.swift
//  Example
//
//  Created by Dolphin on 2022/6/15.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var inputTextView: UITextView!
    @IBOutlet var resultTextView: UITextView!
    var convertId:Int32 = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        convertId = opencc_init_converter(Bundle.main.url(forResource: "s2tw", withExtension: "json", subdirectory: "opencc")!.path)
        inputTextView.delegate = self
        inputTextView.text = "着装污染虚伪发泄棱柱群众里面"
        let dummy = opencc_dummy_method_to_enforce_bundling()
        print("opencc_dummy_method_to_enforce_bundling " + String(dummy))
        resultTextView.text = convert(text: inputTextView.text)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        resultTextView.text = convert(text: inputTextView.text)
    }

    func convert(text:String)->String {
        let convertedPtr = opencc_convert(text, convertId)
        let converted = String(cString: convertedPtr!)
        opencc_free_string(UnsafeMutablePointer(mutating: convertedPtr!))
        return converted
    }
}

