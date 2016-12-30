//
//  myView.swift
//  CoreImageExample
//
//  Created by Friedrich HAEUPL on 29.06.16.
//  Copyright © 2016 Friedrich HAEUPL. All rights reserved.
//

import Cocoa
// import CoreImage
// https://www.raywenderlich.com/76285/beginning-core-image-swift


class myView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        let fileURL = Bundle.main.url(forResource: "image", withExtension: "png")
        // 2
        let beginImage = CIImage(contentsOf: fileURL!)
        
        // 3
        let filter = CIFilter(name: "CISepiaTone")
        filter!.setValue(beginImage, forKey: kCIInputImageKey)
        filter!.setValue(0.5, forKey: kCIInputIntensityKey)
        
        // 4 Apply filter and
        // convert CIImage to NSImage
        let rep: NSCIImageRep = NSCIImageRep(ciImage: filter!.outputImage!)
        let nsImage: NSImage = NSImage(size: rep.size)
        nsImage.addRepresentation(rep)
        
        // 1) Just draw it
        // nsImage.drawAtPoint(NSZeroPoint, fromRect: NSZeroRect, operation:.CompositeSourceOver, fraction: 1)
        // 2) Or stretch image to fill view
        nsImage.draw(in: self.bounds, from:NSZeroRect ,operation:.sourceOver, fraction:1)

    }
    
}
