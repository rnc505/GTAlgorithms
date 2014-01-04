//
//  GTNode.m
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTBasicNode.h"

@interface GTBasicNode ()
@property (nonatomic, assign) GTCoordinate2D location;
@property (nonatomic, retain) NSString* identifier;
@end

@implementation GTBasicNode
@synthesize location = _location,  identifier = _identifier; 

-(NSString *)getIdentifier {
    if(!_identifier) {
        CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
        _identifier = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
        CFRelease(newUniqueId);
    }
    return _identifier;
}

-(GTCoordinate2D)getLocation {
    return _location;
}

-(GTDistance)calculateDistanceFromNode:(id<GTNode>)node {
    return sqrt(pow([node getLocation].x - _location.x, 2) + pow([node getLocation].y - _location.y, 2));
}

+(GTBasicNode*)createBasicNodeWithLocation:(GTCoordinate2D)location {
    GTBasicNode* newNode = [GTBasicNode new];
    [newNode setLocation:location];
    [newNode getIdentifier];
    return newNode;
}

+(GTBasicNode*)createBasicNodeWithXCoordinate:(GTDistance)x withYCoordinate:(GTDistance)y {
    return [GTBasicNode createBasicNodeWithLocation:GTCoordinate2DMake(x, y)];
}

@end
