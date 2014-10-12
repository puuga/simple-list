//
//  ViewController.swift
//  simple list
//
//  Created by Siwawes Wongcharoen on 10/12/2557 BE.
//  Copyright (c) 2557 puuga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var btCal:UIButton!;
    var tfList:UITextField!;
    var lbInfo:UILabel!;
    var lbListLengthInfo:UILabel!;
    var lbMinimumInfo:UILabel!;
    var lbMaximumInfo:UILabel!;
    var lbAvgInfo:UILabel!;
    var lbListLength:UILabel!;
    var lbMinimum:UILabel!;
    var lbMaximum:UILabel!;
    var lbAvg:UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bindWidget();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindWidget() {
        lbInfo = UILabel(frame: CGRect(x: 40, y: 40, width: 280, height: 40));
        lbInfo.text = "Enter List of numbers";
        
        tfList = UITextField(frame: CGRect(x: 40, y: 100, width: 280, height: 40));
        tfList.backgroundColor = UIColor.brownColor();
        
        btCal = UIButton(frame: CGRect(x: 40, y: 160, width: 280, height: 40));
        btCal.setTitle("cal", forState: UIControlState.Normal);
        btCal.setTitleColor(UIColor.brownColor(), forState: UIControlState.Normal);
        btCal.addTarget(self, action: "performClicked", forControlEvents: .TouchUpInside);
        
        lbListLengthInfo = UILabel(frame: CGRect(x: 40, y: 220, width: 100, height: 40));
        lbListLengthInfo.text = "List Length";
        lbListLength = UILabel(frame: CGRect(x: 160, y: 220, width: 100, height: 40));
        
        lbMinimumInfo = UILabel(frame: CGRect(x: 40, y: 280, width: 100, height: 40));
        lbMinimumInfo.text = "List MIN";
        lbMinimum = UILabel(frame: CGRect(x: 160, y: 280, width: 100, height: 40));
        
        lbMaximumInfo = UILabel(frame: CGRect(x: 40, y: 340, width: 100, height: 40));
        lbMaximumInfo.text = "List MAX";
        lbMaximum = UILabel(frame: CGRect(x: 160, y: 340, width: 100, height: 40));
        
        lbAvgInfo = UILabel(frame: CGRect(x: 40, y: 400, width: 100, height: 40));
        lbAvgInfo.text = "List AVG";
        lbAvg = UILabel(frame: CGRect(x: 160, y: 400, width: 100, height: 40));
        
        self.view.addSubview(lbInfo);
        self.view.addSubview(tfList);
        self.view.addSubview(btCal);
        self.view.addSubview(lbListLengthInfo);
        self.view.addSubview(lbListLength);
        self.view.addSubview(lbMinimumInfo);
        self.view.addSubview(lbMinimum);
        self.view.addSubview(lbMaximumInfo);
        self.view.addSubview(lbMaximum);
        self.view.addSubview(lbAvgInfo);
        self.view.addSubview(lbAvg);
    }
    
    func performClicked() {
        //println("click");
        
        var texts = tfList.text.componentsSeparatedByString(",");
        lbListLength.text = "\(texts.count)";
        
        var sum:Double = 0.0;
        var min = NSString(string: texts[0]).integerValue;
        var max = NSString(string: texts[0]).integerValue;
        for temp in texts {
            sum += NSString(string: temp).doubleValue;
            if (min > NSString(string: temp).integerValue) {
                min = NSString(string: temp).integerValue;
            }
            if (max < NSString(string: temp).integerValue) {
                max = NSString(string: temp).integerValue;
            }
        }
        lbMinimum.text = "\(min)";
        lbMaximum.text = "\(max)";
        lbAvg.text = String(format:"%f", sum/Double(texts.count));
    }


}

