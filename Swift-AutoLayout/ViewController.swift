//
//  ViewController.swift
//  Swift-AutoLayout
//
//  Created by Yiqi Wang on 15/11/9.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let myView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.grayColor()
    
    myView.backgroundColor = UIColor.redColor()
    self.view.addSubview(myView)
    //使用auto layout布局
    myView.translatesAutoresizingMaskIntoConstraints = false
    
    example3()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  /**
  最基础的方式布局
  */

  func example1() {
    let viewFrame = CGRectMake(50.0, 100.0, 150.0, 150.0)
    
    //view据文字开始的方向（各民族文字阅读方向不同，采用NSLayoutAttributeLeading比NSLayoutAttributeLeft更有助于后续本地化工作开展）
    let viewLeft = NSLayoutConstraint(item: myView,
                                 attribute: NSLayoutAttribute.Leading,
                                 relatedBy: NSLayoutRelation.Equal,
                                    toItem: self.view,
                                 attribute: NSLayoutAttribute.Leading,
                                multiplier: 1,
                                  constant: CGRectGetMinX(viewFrame))
    let viewTop = NSLayoutConstraint(item: myView,
                                attribute: NSLayoutAttribute.Top,
                                relatedBy: NSLayoutRelation.Equal,
                                   toItem: self.view,
                                attribute: NSLayoutAttribute.Top,
                               multiplier: 1,
                                 constant: CGRectGetMinY(viewFrame))
    let viewWidth = NSLayoutConstraint(item: myView,
                                  attribute: NSLayoutAttribute.Width,
                                  relatedBy: NSLayoutRelation.GreaterThanOrEqual,
                                     toItem: nil,
                                  attribute: NSLayoutAttribute.NotAnAttribute,
                                  multiplier: 1,
                                  constant: CGRectGetWidth(viewFrame))
    let viewHeight = NSLayoutConstraint(item: myView,
                                   attribute: NSLayoutAttribute.Height,
                                   relatedBy: NSLayoutRelation.GreaterThanOrEqual,
                                      toItem: nil,
                                   attribute: NSLayoutAttribute.NotAnAttribute,
                                  multiplier: 1,
                                    constant: CGRectGetHeight(viewFrame))
   //把约束添加到父视图上
    let constraints : [NSLayoutConstraint] =  [viewLeft, viewTop, viewWidth, viewHeight]
    self.view.addConstraints(constraints)
  }
  
  /**
  使用VFL重构上一个布局
  */
    func example2() {
      let viewBindings = ["myView":myView]
      self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[myView(>=150)]",
        options: NSLayoutFormatOptions(rawValue: 0),
        metrics: nil,
        views: viewBindings))
      self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[myView(>=150)]",
        options: NSLayoutFormatOptions(rawValue:0),
        metrics: nil,
        views: viewBindings))
    }
  
  /**
  在右侧添加一个视图
  */
  func example3() {
    let myView2 = UIView()
    myView2.backgroundColor = UIColor.blueColor()
    myView2.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(myView2)
    
    let viewBindings = ["myView":myView, "myView2":myView2]
    self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[myView(>=150)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindings))
    self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[myView(>=150)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindings))
    self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[myView]-[myView2(>=50)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindings))
    self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[myView2(>=50)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindings))
    
  }
}

