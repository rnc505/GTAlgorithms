//
//  GTGraph.m
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/24/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//

#import "GTGraph.h"
#import "GTBasicNode.h"
#import "GTBasicEdge.h"

@implementation GTGraph
@synthesize adjacencyList = _adjacencyList, edgeWeights = _edgeWeights;

-(void)addNode:(id<GTNode>)_node {
    if(![_adjacencyList objectForKey:[_node getIdentifier]]) {
        [_adjacencyList setObject:[NSMutableSet new] forKey:[_node getIdentifier]];
    }
}
-(void)addNodes:(NSSet*)_setOfNodes {
    [_setOfNodes enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [self addNode:obj];
    }];
}

-(void)addUndirectedEdgeWithFirstNode:(id<GTNode>)_firstNode secondNode:(id<GTNode>)_secondNode {
    [self addUndirectedEdgeWithFirstNode:_firstNode secondNode:_secondNode length:1.0f];
}
-(void)addDirectedEdgeWithBeginningNode:(id<GTNode>)_beginning endNode:(id<GTNode>)_end {
    [self addDirectedEdgeWithBeginningNode:_beginning endNode:_end length:1.0f];
}

-(void)addUndirectedEdgeWithFirstNode:(id<GTNode>)_firstNode secondNode:(id<GTNode>)_secondNode length:(GTDistance)_length {
    [self addDirectedEdgeWithBeginningNode:_firstNode endNode:_secondNode length:_length];
    [self addDirectedEdgeWithBeginningNode:_secondNode endNode:_firstNode length:_length];
    
}
-(void)addDirectedEdgeWithBeginningNode:(id<GTNode>)_beginning endNode:(id<GTNode>)_end length:(GTDistance)_length {
    if(![_adjacencyList objectForKey:[_beginning getIdentifier]]) {
        [NSException raise:@"Node not added to graph" format:@"The Beginning Node was not added to graph"];
    }
    if(![_adjacencyList objectForKey:[_end getIdentifier]]) {
        [NSException raise:@"Node not added to graph" format:@"The Ending Node was not added to graph"];
    }
    [[_adjacencyList objectForKey:[_beginning getIdentifier]] addObject:_end];
    [_edgeWeights setObject:[NSNumber numberWithDouble:_length] forKey:[[_beginning getIdentifier] stringByAppendingString:[_end getIdentifier]]];
}

-(void)addUndirectedEdge:(id<GTEdge>)_edge {
    [self addUndirectedEdgeWithFirstNode:[_edge getFirstVertice] secondNode:[_edge getSecondVertice] length:[_edge getLength]];
}
-(void)addDirectedEdge:(id<GTEdge>)_edge {
    [self addDirectedEdgeWithBeginningNode:[_edge getFirstVertice] endNode:[_edge getSecondVertice] length:[_edge getLength]];
}

-(void)addUndirectedEdges:(NSSet*)_setOfEdges {
    [_setOfEdges enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [self addUndirectedEdge:obj];
    }];
}
-(void)addDirectedEdges:(NSSet*)_setOfEdges {
    [_setOfEdges enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [self addDirectedEdge:obj];
    }];
}

-(GTDistance)getEdgeLengthFromFirstNode:(GTBasicNode *)_firstNode toSecondNode:(GTBasicNode *)_secondNode {
    if(![[_adjacencyList objectForKey:[_firstNode getIdentifier]] containsObject:_secondNode]) {
        [NSException raise:@"No edge exists between nodes" format:@"There does not exists an edge between these nodes"];
    }
    return [[_edgeWeights objectForKey:[[_firstNode getIdentifier] stringByAppendingString:[_secondNode getIdentifier]]] doubleValue];
}

+(GTGraph *)createEmptyGraph {
    GTGraph *newGraph = [GTGraph new];
    [newGraph setAdjacencyList:[NSMutableDictionary new]];
    [newGraph setEdgeWeights:[NSMutableDictionary new]];
    return newGraph;
}

@end
