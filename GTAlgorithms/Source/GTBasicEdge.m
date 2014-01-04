//
//  GTPath.m
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTBasicEdge.h"

@interface GTBasicEdge ()
@property (nonatomic, assign) GTDistance length;
@property (nonatomic, retain) id<GTNode> firstVertice;
@property (nonatomic, retain) id<GTNode> secondVertice;

@end

@implementation GTBasicEdge
@synthesize length = _length, firstVertice = _firstVertice, secondVertice = _secondVertice; 

-(GTDistance)getLength {
    return _length;
}
-(id<GTNode>)getFirstVertice {
    return _firstVertice;
}
-(id<GTNode>)getSecondVertice {
    return _secondVertice;
}

+(id)createEdgeWithLength:(GTDistance)_length firstVertice:(id<GTNode>)_firstVertice secondVertice:(id<GTNode>)_secondVertice {
    GTBasicEdge *newEdge = [GTBasicEdge new];
    [newEdge setLength:_length];
    [newEdge setFirstVertice:_firstVertice];
    [newEdge setSecondVertice:_secondVertice];
    return newEdge;
}

+(id)createUnweightedEdgeWithFirstVertice:(id<GTNode>)_firstVertice secondVertice:(id<GTNode>)_secondVertice {
    return [GTBasicEdge createEdgeWithLength:1.0f firstVertice:_firstVertice secondVertice:_secondVertice];
}

@end
