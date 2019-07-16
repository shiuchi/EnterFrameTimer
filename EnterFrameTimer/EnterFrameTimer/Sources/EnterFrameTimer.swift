//
//  EnterFrameTimer.swift
//
//  Created by shiuchi on 2019/07/17.
//  Copyright © 2019 shiuchi. All rights reserved.
//


public class EnterFrameTimer {
    
    public static let shared = EnterFrameTimer()
    
    typealias Callback = () -> Bool
    
    public var fps: Double = 24 {
        didSet {
            timer?.invalidate()
            setTimer()
        }
    }
    
    public var isValid: Bool { return timer?.isValid ?? false }
    
    private var list = [ObjectIdentifier: Callback]()
    
    private var timer: Timer?
    
    private init() {}
    
    public func register(_ target: AnyObject, handler: @escaping () -> ()) {
        if let _ = list[ObjectIdentifier(target)] {
            return
        }
        
        let callback: () -> Bool = { [weak target] in
            guard let _ = target else { return false }
            handler()
            return true
        }
        
        list[ObjectIdentifier(target)] = callback
        
        setTimer()
    }
    
    private func setTimer(){
        guard !list.isEmpty else { return }
        if timer == nil || timer?.isValid == false {
            timer = Timer.scheduledTimer(timeInterval: 1 / fps, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        }
    }
    
    public func remove(_ target: AnyObject) {
        list.removeValue(forKey: ObjectIdentifier(target))
        if list.isEmpty {
            timer?.invalidate()
        }
    }
    
    @objc func onTimer() {
        if list.isEmpty {
            timer?.invalidate()
        } else {
            list.forEach {
                if !$1() {
                    list.removeValue(forKey: $0)
                }
            }
        }
    }
}
