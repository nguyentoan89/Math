//
//  ViewController.swift
//  MathCrazy
//
//  Created by Nguyen Cong Toan on 2/20/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    
    var random_Pos: Int = 0
    var dung: Int = 0
    var sai: Int = 0
    var time: Int = 0
    var timer = Timer()
    @IBOutlet weak var lbl_number1: UILabel!
    @IBOutlet weak var lbl_number2: UILabel!
    
    @IBOutlet weak var lbl_time: UILabel!
    @IBOutlet weak var lbl_f: UILabel!
    @IBOutlet weak var lbl_t: UILabel!
    @IBOutlet weak var btn_kq1: UIButton!
    
    @IBOutlet weak var btn_kq2: UIButton!
    
    @IBOutlet weak var btn_kq3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()
        start()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.dem_time), userInfo: nil, repeats: true)
    }
    func start()
    {
        time = 60
    }
    func dem_time()
    {
         time -= 1
        lbl_time.text = String(time)
        if time == 0
            {
                choilai()
            }
    }
    func choilai()
    {
        time = 60
        dung = 0
        lbl_t.text = String(dung)
        sai = 0
        lbl_f.text = String(sai)
        setRandom()
    }
    
    func thoat()
    {
        exit(0)
    }
    
    @IBAction func btn_thoat(_ sender: UIButton) {
        thoat()
    }
    
    @IBAction func btn_acction(_ sender: UIButton) {
        if random_Pos == 3
        {
            dung += 1
        }else{
            dung -= 1
                if dung < 0 || sai < 0 {
                    choilai()
            }
            sai += 1
        }
        check_T_F()
        setRandom()
    }
        
    
    
    
    @IBAction func btn_acc2(_ sender: UIButton) {
        if random_Pos == 2
        {
            dung += 1
        }else
        {
            dung -= 1
            if dung < 0 || sai < 0 {
                choilai()
            }
            sai += 1
        }
        check_T_F()
        setRandom()
    }
    
    
    
    @IBAction func btn_acc3(_ sender: UIButton) {
        if random_Pos == 1
        {
            dung += 1
        }else{
            dung -= 1
            if dung < 0 || sai < 0 {
                choilai()
            }
            sai += 1
        }
        check_T_F()
        setRandom()
    }

    
    
    func check_T_F()
    {
        lbl_t.text = String(format: "%d" , dung)
        lbl_f.text = String(format: "%d",sai)
    }
    
    
    
    
    //hien thi so random
    func setRandom()
    {
        let random1 = Int(arc4random_uniform(9)) + 1
        let random2 = Int(arc4random_uniform(9)) + 1
        
        lbl_number1.text = String(random1)
        lbl_number2.text = String(random2)
        setResult(randomA: random1, randomB: random2)
    }
        //hien thi ket qua
   func setResult(randomA: Int, randomB: Int)
    {
        // random so khac voi random1 vaf random2 ?
        //let r1 = Int(arc4random_uniform(9)+1)
        //let r2 = Int(arc4random_uniform(9)+1)
    
        random_Pos = Int(arc4random_uniform(3)+1)
        if random_Pos==1
        {
            btn_kq1.setTitle(String(sum(p1: randomA, p2: randomB)), for: UIControlState.normal )
            btn_kq2.setTitle(String(randomB), for: UIControlState.normal)
            btn_kq3.setTitle(String(randomA), for: UIControlState.normal)
        }
        else if random_Pos == 2
        {
            btn_kq1.setTitle(String(randomA), for: UIControlState.normal )
            btn_kq2.setTitle(String(sum(p1: randomA, p2: randomB)), for: UIControlState.normal)
            btn_kq3.setTitle(String(randomB), for: UIControlState.normal)
        }
        else
        {
            btn_kq1.setTitle(String(randomA), for: UIControlState.normal )
            btn_kq2.setTitle(String(randomB), for: UIControlState.normal)
            btn_kq3.setTitle(String(sum(p1: randomA, p2: randomB)), for: UIControlState.normal)
        }
    
    }
       //tinh tong
    
    func sum(p1: Int, p2: Int) -> Int

    {
      return p1+p2
    }
}

