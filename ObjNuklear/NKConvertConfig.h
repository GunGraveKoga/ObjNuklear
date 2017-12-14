//
//  NKConvertConfig.h
//  ObjNuklear
//
//  Created by Yury Vovk on 14.12.2017.
//  Copyright © 2017 GunGraveKoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>
#include "nuklear.h"

struct nk_default_vertex {
    float position[2];
    float uv[2];
    nk_byte col[4];
};

@interface NKConvertConfig : OFObject
{
    struct nk_convert_config _config;
}

@property (nonatomic, assign, readonly) struct nk_convert_config *configHandle OF_RETURNS_INNER_POINTER;
@property (nonatomic, assign) const struct nk_draw_vertex_layout_element *vertexLayout OF_RETURNS_INNER_POINTER;
@property (nonatomic, assign) size_t vertexSize;
@property (nonatomic, assign) size_t vertexAlignment;
@property (nonatomic, assign) float globalAlpha;
@property (nonatomic, assign) enum nk_anti_aliasing lineAntiAliasing;
@property (nonatomic, assign) enum nk_anti_aliasing shapeAntiAliasing;
@property (nonatomic, assign) unsigned circleSegmentCount;
@property (nonatomic, assign) unsigned arcSegmentCount;
@property (nonatomic, assign) unsigned curveSegmentCount;
@property (nonatomic, assign) struct nk_draw_null_texture nullTexture;

+ (instancetype)config;

@end
