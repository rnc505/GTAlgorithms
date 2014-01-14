//
//  GTPath.m
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/25/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTPath.h"
#import "GTAStarNode.h"
@implementation GTPath
@synthesize length = _mLength, startNode = _startNode, endNode = _endNode, finalPath = _finalPath;
-(void)addDirectedEdgeWithBeginningNode:(id<GTNode>)_beginning endNode:(id<GTNode>)_end length:(GTDistance)_length {
    [super addDirectedEdgeWithBeginningNode:_beginning endNode:_end length:_length];
    _mLength += _length;
}
-(void)addNode:(id<GTNode>)_node {
    [super addNode:_node];
    [_finalPath insertObject:_node  atIndex:0];
}

+(id)blankPath {
    GTPath *blankPath = [GTPath new];
    [blankPath setAdjacencyList:[NSMutableDictionary new]];
    [blankPath setEdgeWeights:[NSMutableDictionary new]];
    [blankPath setFinalPath:[NSMutableArray new]];
    return blankPath;
}

@end
