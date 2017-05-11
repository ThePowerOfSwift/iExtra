//
//  MainBundleImageFileFinder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-16.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

/*
 
 This class will find all images in the app bundle and
 remove any retina variations. The class can only find
 images that are not placed in asset folders.
 
 */

import Foundation

public class MainBundleImageFileFinder: MainBundleFileFinder {
    
    
    // MARK: Public methods
    
    public override func findFiles(withPrefix prefix: String) -> [String] {
        let rawResult = super.findFiles(withPrefix: prefix)
        let result = filter(rawResult)
        return result
    }
    
    public override func findFiles(withSuffix suffix: String) -> [String] {
        let rawResult = super.findFiles(withSuffix: suffix)
        let result = filter(rawResult)
        return result
    }
    
    
    // MARK: Private methods
    
    private func filter(_ rawResult:[String]) -> [String] {
        var result = [String]()
        for fileName in rawResult {
            if (isBaseImageName(fileName)) {
                result.append(getBaseImageName(fileName))
            }
        }
        return result
    }
    
    private func getBaseImageName(_ fileName:String) -> String {
        var result = fileName.components(separatedBy: ".").first
        result = result?.components(separatedBy: "~iphone").first
        return result!
    }
    
    private func isBaseImageName(_ fileName:String) -> Bool {
        return fileName.range(of: "@") != nil
            || fileName.range(of: "_2x") != nil
            || fileName.range(of: "_3x") != nil
            || fileName.range(of: "~ipad") != nil
    }
}
