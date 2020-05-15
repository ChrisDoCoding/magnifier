//
//  MainView.swift
//  Magnifier
//
//  Created by Chris Chen on 2020/5/10.
//  Copyright © 2020 Dev4App. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubviews()
        addSubviewConstraints()
        initView()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "君不見，黃河之水天上來，奔流到海不復回。\n君不見，高堂明鏡悲白髮，朝如青絲暮成雪。\n人生得意須盡歡，莫使金樽空對月。\n天生我材必有用，千金散盡還復來。\n烹羊宰牛且爲樂，會須一飲三百杯。\n岑夫子，丹丘生，將進酒，杯莫停。\n與君歌一曲，請君爲我傾耳聽。(傾耳聽 一作：側耳聽)\n鐘鼓饌玉不足貴，但願長醉不復醒。(不足貴 一作：何足貴；不復醒 一作：不願醒/不用醒)\n古來聖賢皆寂寞，惟有飲者留其名。(古來 一作：自古；惟 通：唯)\n陳王昔時宴平樂，斗酒十千恣歡謔。\n主人何爲言少錢，徑須沽取對君酌。\n五花馬，千金裘，呼兒將出換美酒，與爾同銷萬古愁。"
        
        addSubview(label)
    }
    
    func addSubviewConstraints() {
        
        label.snp.makeConstraints { (make) in
            make.leading.equalTo(snp.leading).offset(50)
            make.trailing.equalTo(snp.trailing).offset(-50)
            make.centerY.equalTo(snp.centerY)
        }
    }
    
    func initView() {
        
        backgroundColor = .systemBlue
    }
    
    func configureView() {
        
    }

}
