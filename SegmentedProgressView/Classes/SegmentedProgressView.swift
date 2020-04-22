import Foundation
import UIKit
import SnapKit

/// Progress view with discrete segments.
public class SegmentedProgressView: UIView {
    private static let CORNER_RADIUS: CGFloat = 5
    
    private let numTotalSegments: UInt32
    private let numFilledSegments: UInt32
    private let totalViewWidth: CGFloat
    private var filledSegments: [UIView]
    private var unfilledSegments: [UIView]
    
    private var numUnfilledSegments: UInt32 {
        get {
            return numTotalSegments - numFilledSegments
        }
    }
    
    private var segmentWidth: CGFloat {
        get {
            let widthWithoutSeparators: Float = Float(totalViewWidth) - (Float(numTotalSegments - 1) * Float(separatorSize))
            let individualWidth: Float = widthWithoutSeparators / Float(numTotalSegments)
            return CGFloat(individualWidth)
        }
    }
    
    var fillColor: UIColor = .orange {
        didSet {
            colorSegments()
        }
    }
    
    var noFillColor: UIColor = .darkGray {
        didSet {
            colorSegments()
        }
    }
    
    var cellHeight: CGFloat = 11
    var separatorSize: CGFloat = 3
    
    public init(numTotalSegments: UInt32, numFilledSegments: UInt32, totalViewWidth: CGFloat) {
        guard totalViewWidth > 0 else {
            fatalError("Width must be greater than zero")
        }
        
        self.numTotalSegments = numTotalSegments
        self.numFilledSegments = numFilledSegments
        self.totalViewWidth = totalViewWidth
        self.filledSegments = Array()
        self.unfilledSegments = Array()
        
        super.init(frame: .zero)
        
        for _ in 0..<self.numFilledSegments {
            let filledSegment = UIView()
            filledSegment.clipsToBounds = true
            filledSegment.layer.cornerRadius = SegmentedProgressView.CORNER_RADIUS
            addSubview(filledSegment)
            filledSegments.append(filledSegment)
        }
        
        for _ in 0..<self.numUnfilledSegments {
            let unfilledSegment = UIView()
            unfilledSegment.clipsToBounds = true
            unfilledSegment.layer.cornerRadius = SegmentedProgressView.CORNER_RADIUS
            addSubview(unfilledSegment)
            unfilledSegments.append(unfilledSegment)
        }
        
        colorSegments()
        setupConstraints()
    }
    
    public convenience init(numTotalSegments: UInt32,
                     numFilledSegments: UInt32,
                     totalViewWidth: CGFloat,
                     fillColor: UIColor,
                     noFillColor: UIColor) {
        self.init(numTotalSegments: numTotalSegments,
                  numFilledSegments: numFilledSegments,
                  totalViewWidth: totalViewWidth)
        self.fillColor = fillColor
        self.noFillColor = noFillColor
    }
    
    private func setupConstraints() {
        guard !self.filledSegments.isEmpty else {
            setupConstraintsWithNoFilledSegments()
            return
        }
        
        let cellWidth: CGFloat = self.segmentWidth // so we only calculate once
        let firstFilledSegment: UIView = self.filledSegments.first!
        
        firstFilledSegment.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(cellWidth)
            make.height.equalTo(self.cellHeight)
        }
        
        layoutSegmentsInOrder(segments: self.filledSegments)
        
        guard !self.unfilledSegments.isEmpty else {
            wrapOuterViewAroundSegments(lastSegment: filledSegments.last!)
            return
        }
        
        let firstUnfilledSegment: UIView = self.unfilledSegments.first!
        let lastFilledSegment: UIView = self.filledSegments.last!
        
        firstUnfilledSegment.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.equalTo(lastFilledSegment.snp.right).offset(self.separatorSize)
            make.height.equalTo(self.cellHeight)
            make.width.equalTo(cellWidth)
        }
        
        layoutSegmentsInOrder(segments: self.unfilledSegments)
        wrapOuterViewAroundSegments(lastSegment: unfilledSegments.last!)
    }
    
    private func setupConstraintsWithNoFilledSegments() {
        guard !self.unfilledSegments.isEmpty else { return }
        
        let cellWidth: CGFloat = self.segmentWidth
        let firstUnfilledSegment: UIView = self.unfilledSegments.first!
        
        firstUnfilledSegment.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(cellWidth)
            make.height.equalTo(self.cellHeight)
        }
        
        layoutSegmentsInOrder(segments: unfilledSegments)
    }
    
    private func layoutSegmentsInOrder(segments: [UIView]) {
        let cellWidth: CGFloat = self.segmentWidth // so we only calculate it once
        
        for i in 1..<segments.count {
            let currentSegment: UIView = segments[i]
            let prevSegment: UIView = segments[i - 1]
            
            currentSegment.snp.makeConstraints { (make) -> Void in
                make.centerY.equalToSuperview()
                make.width.equalTo(cellWidth)
                make.height.equalTo(self.cellHeight)
                make.left.equalTo(prevSegment.snp.right).offset(self.separatorSize)
            }
        }
    }
    
    private func wrapOuterViewAroundSegments(lastSegment: UIView) {
        self.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(lastSegment.snp.right)
        }
    }
    
    private func colorSegments() {
        DispatchQueue.main.async {
            self.filledSegments.forEach { $0.backgroundColor = self.fillColor }
            self.unfilledSegments.forEach { $0.backgroundColor = self.noFillColor }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
