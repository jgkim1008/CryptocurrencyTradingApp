//
//  StatusCell.swift
//  CryptocurrencyTradingApp
//
//  Created by 홍정아 on 2022/01/29.
//

import UIKit
import SnapKit

class StatusCell: UITableViewCell {
    private var font: UIFont.TextStyle = .footnote
    private lazy var coinNameLabel = UILabel.makeLabel(font: .body)
    private lazy var symbolLabel = UILabel.makeLabel(font: .caption1, color: .systemGray)
    private lazy var nameStackView = UIStackView.makeStackView(alignment: .leading,
                                                               axis: .vertical,
                                                               spacing: 3,
                                                               subviews: [coinNameLabel,
                                                                          symbolLabel])
    private lazy var withdrawStatusLabel = UILabel.makeLabel(font: .subheadline)
    private lazy var depositStatusLabel = UILabel.makeLabel(font: .subheadline)
    private lazy var cellStackView = UIStackView.makeStackView(alignment: .center,
                                                               subviews: [nameStackView,
                                                                          withdrawStatusLabel,
                                                                          depositStatusLabel])

    func configure(viewModel: AssetStatusViewModel) {
        configureLabels(viewModel: viewModel)
        layoutStackView()
        layoutLabels()
    }
    
    private func layoutStackView() {
        addSubview(cellStackView)
        cellStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    private func layoutLabels() {
        nameStackView.snp.makeConstraints { $0.width.equalToSuperview().multipliedBy(0.6) }
        withdrawStatusLabel.snp.makeConstraints { $0.width.equalToSuperview().multipliedBy(0.2) }
        depositStatusLabel.snp.makeConstraints { $0.width.equalToSuperview().multipliedBy(0.2) }
        coinNameLabel.textAlignment = .left
        symbolLabel.textAlignment = .left
        withdrawStatusLabel.textAlignment = .center
        depositStatusLabel.textAlignment = .center
    }
    
    private func configureLabels(viewModel: AssetStatusViewModel) {
        coinNameLabel.text = viewModel.coinName
        symbolLabel.text = viewModel.symbol
        withdrawStatusLabel.text = viewModel.withdrawStatus == 1 ? "가능" : "불가"
        withdrawStatusLabel.textColor = viewModel.withdrawStatus == 1 ? .systemGreen : .systemRed.withAlphaComponent(0.7)
        depositStatusLabel.text = viewModel.depositStatus == 1 ? "가능" : "불가"
        depositStatusLabel.textColor = viewModel.depositStatus == 1 ? .systemGreen : .systemRed.withAlphaComponent(0.7)
    }
}
