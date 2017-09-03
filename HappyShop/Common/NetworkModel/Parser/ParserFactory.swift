//
//  ParserFactory.swift
//  PropertyGuruTest
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class ParserFactory: NSObject {

    static func getParserForAPIType(_ apiType: APIType) -> BaseParser {
        
        var parser = BaseParser()
        
        switch apiType {
            
        case .categoryDetails:
            parser = CategoryParser()
            
        case .productDetail:
            parser = ProductDetailParser()
            
        }
        return parser
    }
}
