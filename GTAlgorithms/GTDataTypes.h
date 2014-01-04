//
//  GTDataTypes.h
//  GTAlgorithms
//
//  Created by Robby Cohen on 12/28/13.
//  Copyright (c) 2013 Robby Cohen. All rights reserved.
//
#ifndef GTAlgorithms_GTDataTypes_h
#define GTAlgorithms_GTDataTypes_h
#pragma GCC diagnostic ignored "-Wunused-function"
#import <float.h>
typedef double GTCoordinate;
typedef double GTDistance;
#define GTDistanceMax DBL_MAX;

typedef struct {
    GTCoordinate x;
    GTCoordinate y;
} GTCoordinate2D;


static GTCoordinate2D GTCoordinate2DMake(double _x, double _y) {
    GTCoordinate2D newCoordinate;
    newCoordinate.x = _x;
    newCoordinate.y = _y;
    return newCoordinate;
}
#endif