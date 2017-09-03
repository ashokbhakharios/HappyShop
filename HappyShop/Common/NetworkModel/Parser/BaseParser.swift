//
//  BaseParser.swift
//  PropertyGuruTest
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class BaseParser: NSObject {
    
    /*
     * Override this function in all subclasss
       Parse your response in data model
     *
     * @param response 
     * Response dictionary which needs to be parsed
     *
     * @return return parsed model object
     */
    func parseResponse(_ response: Any?) -> Any?  {
        return response;
    }
    
    static func parseResponse(_ response: Any?, apiType: APIType) -> Any? {
        let parser = ParserFactory.getParserForAPIType(apiType)
        return parser.parseResponse(response)
    }
}
