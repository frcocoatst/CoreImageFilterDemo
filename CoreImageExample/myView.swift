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
// overview: http://stackoverflow.com/documentation/ios/7278/coreimage-filters#t=201701121316447831659
//


class myView: NSView {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
        let fileURL = Bundle.main.url(forResource: "image", withExtension: "png")
        // 2
        let beginImage = CIImage(contentsOf: fileURL!)
        
        // 3
        /* Try out various filters
         let filter = CIFilter(name: "CISepiaTone")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         filter!.setValue(0.5, forKey: kCIInputIntensityKey)
         
         let filter = CIFilter(name: "CIPhotoEffectTransfer")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         let filter = CIFilter(name: "CIPhotoEffectTonal")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         let filter = CIFilter(name: "CIPhotoEffectProcess")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         let filter = CIFilter(name: "CIPhotoEffectNoir")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         let filter = CIFilter(name: "CIPhotoEffectMono")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         let filter = CIFilter(name: "CIPhotoEffectInstant")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         let filter = CIFilter(name: "CIMinimumComponent")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         let filter = CIFilter(name: "CIMaximumComponent")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         let filter = CIFilter(name: "CIMaskToAlpha")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         
         // ----------------
         // Maps luminance to a color ramp of two colors.
         // from http://www.bytearray.org/?p=5360
         // from https://www.objc.io/issues/16-swift/functional-swift-apis/
         // from https://github.com/aschuch/QRCode/blob/master/QRCode/QRCode.swift
         // False Color Filter - Color code and background
         let color = CIColor(red: 0.2, green: 0, blue: 0)
         let backgroundColor = CIColor(red: 1, green: 0.5, blue: 1)
         
         let filter = CIFilter(name: "CIFalseColor")
         
         filter!.setDefaults()
         filter!.setValue(beginImage, forKey: "inputImage")
         filter!.setValue(color, forKey: "inputColor0")
         filter!.setValue(backgroundColor, forKey: "inputColor1")
         // ----------------
         
         //Remaps red, green, and blue color components to the number of brightness values you specify for each color component.
         let filter = CIFilter(name: "CIColorPosterize")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)     // parameters
         filter!.setValue(6.0, forKey:"inputLevels")
         
         // Remaps colors so they fall within shades of a single color.
         let color = CIColor(red: 1.0, green: 0.1, blue: 0.1)
         let filter = CIFilter(name: "CIColorMonochrome")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(color, forKey: "inputColor")     // parameters
         filter!.setValue(1.0, forKey:"inputIntensity")
         
         // Color Invert
         let filter = CIFilter(name: "CIColorInvert")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         
         // Adjusts the reference white point for an image and maps all colors in the source using the new reference.
         let color = CIColor(red: 1.0, green: 0.5, blue: 0.6)
         let filter = CIFilter(name: "CIWhitePointAdjust")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(color, forKey: "inputColor")
         
         // Adjusts the saturation of an image while keeping pleasing skin tones.
         let filter = CIFilter(name: "CIVibrance")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(0.8, forKey: "inputAmount")
         
         // Maps color intensity from a linear gamma curve to the sRGB color space
         let filter = CIFilter(name: "CILinearToSRGBToneCurve")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)

         // Changes the overall hue, or tint, of the source pixels
         let filter = CIFilter(name: "CIHueAdjust")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(0.5, forKey: "inputAngle")

         // Adjusts midtone brightness
         let filter = CIFilter(name: "CIGammaAdjust")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(0.8, forKey: "inputPower")
         
         // Adjusts the exposure setting for an image similar to the way you control exposure for a camera when you change the F-stop.
         let filter = CIFilter(name: "CIExposureAdjust")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(1.9, forKey: "inputEV")
         
         // ---------------
         // BLUR FILTERS
         // Blurs an image using a box-shaped convolution kernel.
         let filter = CIFilter(name: "CIBoxBlur")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(10.0, forKey: "inputRadius")

         // Blurs an image using a disc-shaped convolution kernel.
         let filter = CIFilter(name: "CIDiscBlur")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(10.0, forKey: "inputRadius")

         // Spreads source pixels by an amount specified by a Gaussian distribution
         let filter = CIFilter(name: "CIGaussianBlur")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(10.0, forKey: "inputRadius")

         // More Complex Filter: CIMaskedVariableBlur

         // Computes the median value for a group of neighboring pixels and replaces each pixel value with the median.
         let filter = CIFilter(name: "CIMedianFilter")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)

         // Blurs an image to simulate the effect of using a camera that moves a specified angle and distance while capturing the image.
         let filter = CIFilter(name: "CIMotionBlur")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(20.0, forKey: "inputRadius")
         filter!.setValue(10.0, forKey: "inputAngle")
         
         // Simulates the effect of zooming the camera while capturing the image
         let filter = CIFilter(name: "CIZoomBlur")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         let vect = CIVector(x:100, y: 100)
         filter!.setValue(vect, forKey: "inputCenter")
         filter!.setValue(20.0, forKey: "inputAmount")

         // ----------------------
         // NOISE REDUCTION FILTER
         // Reduces noise using a threshold value to define what is considered noise.
         let filter = CIFilter(name: "CINoiseReduction")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(0.02, forKey: "inputNoiseLevel")
         filter!.setValue(0.5, forKey: "inputSharpness")
         
         // Modifies color values to keep them within a specified range.
         let minVect = CIVector(x:0.0, y:0.3, z:0.0, w:0.0)
         let maxVect = CIVector(x:0.4, y:0.6, z:0.7, w:0.7)
         let filter = CIFilter(name: "CIColorClamp")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(minVect, forKey: "inputMinComponents")
         filter!.setValue(maxVect, forKey: "inputMaxComponents")
         
         // Adjusts saturation, brightness, and contrast values.
         // To calculate saturation, this filter linearly interpolates between a grayscale image (saturation = 0.0) and the original image (saturation = 1.0). The filter supports extrapolation: For values large than 1.0, it increases saturation.
         let filter = CIFilter(name: "CIColorControls")
         filter!.setValue(beginImage, forKey: kCIInputImageKey)
         filter!.setValue(1.0, forKey: "inputSaturation")
         filter!.setValue(0.5, forKey: "inputBrightness")
         filter!.setValue(1.0, forKey: "inputContrast")
         


         */
        
        // Adjusts saturation, brightness, and contrast values.
        // To calculate saturation, this filter linearly interpolates between a grayscale image (saturation = 0.0) and the original image (saturation = 1.0). The filter supports extrapolation: For values large than 1.0, it increases saturation.
        let filter = CIFilter(name: "CIGloom")
        filter!.setValue(beginImage, forKey: kCIInputImageKey)
        filter!.setValue(10.0, forKey: "inputRadius")
        filter!.setValue(1.5,  forKey: "inputIntensity")


        // More Complex Filters
        /*
         
         CIColorMatrix
         CIColorPolynomial

         
         https://gist.github.com/seivan/b5b2a7926028c179d4ba
         
         var topGradient = CIFilter(name: "CILinearGradient",
         withInputParameters:["inputPoint0" : CIVector(x: 0, y: self.inputTop * height),
         "inputColor0" : CIColor(red: 0, green: 1, blue: 0, alpha: 1),
         "inputPoint1" : CIVector(x: 0, y: self.inputCenter * height),
         "inputColor1" : CIColor(red: 0, green: 1, blue: 0, alpha: 0)
         ])
         var topGradient = CIFilter(name: "CILinearGradient",
         withInputParameters:["inputPoint0" : CIVector(x: 0, y: 100),
         "inputColor0" : CIColor(red: 0, green: 1, blue: 0, alpha: 1),
         "inputPoint1" : CIVector(x: 0, y: 100),
         "inputColor1" : CIColor(red: 0, green: 1, blue: 0, alpha: 0)
         ])
         */
        

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
