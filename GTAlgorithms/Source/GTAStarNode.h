//
//  GTAStarNode.h
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTBasicNode.h"

@interface GTAStarNode : GTBasicNode {
    GTDistance _gScore;
    GTDistance _fScore;
    id<GTNode> _parent;
    id<GTNode> _baseNode;
}

@property (nonatomic, assign) GTDistance gScore;
@property (nonatomic, assign) GTDistance fScore;
@property (nonatomic, retain) id<GTNode> parent;
@property (nonatomic, retain) id<GTNode> baseNode;

+(GTAStarNode*)createAStarNodeFromBaseNode:(id<GTNode>)_baseNode;
@end
