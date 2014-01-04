//
//  GTAStarNode.m
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTAStarNode.h"

@implementation GTAStarNode
@synthesize gScore = _gScore, fScore = _fScore, parent = _parent, baseNode = _baseNode;

+(GTAStarNode*)createAStarNodeFromBaseNode:(id<GTNode>)_baseNode {
    GTAStarNode *newNode = [GTAStarNode new];
    [newNode setBaseNode:_baseNode];
    [newNode setGScore:0.0f];
    [newNode setFScore:0.0f];
    [newNode setParent:nil];
    return newNode;
}

-(NSString*)getIdentifier {
    return [_baseNode getIdentifier];
}
-(GTCoordinate2D)getLocation {
    return [_baseNode getLocation];
}
-(GTDistance)calculateDistanceFromNode:(id<GTNode>)node {
    return [_baseNode calculateDistanceFromNode:node];
}
@end
