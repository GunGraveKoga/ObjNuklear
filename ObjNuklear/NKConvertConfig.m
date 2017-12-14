//
//  NKConvertConfig.m
//  ObjNuklear
//
//  Created by Yury Vovk on 14.12.2017.
//  Copyright © 2017 GunGraveKoga. All rights reserved.
//

#define NK_INCLUDE_FIXED_TYPES
#define NK_INCLUDE_STANDARD_IO
#define NK_INCLUDE_STANDARD_VARARGS
#define NK_INCLUDE_DEFAULT_ALLOCATOR
#define NK_INCLUDE_VERTEX_BUFFER_OUTPUT
#define NK_INCLUDE_FONT_BAKING
#define NK_INCLUDE_DEFAULT_FONT
#import "NKConvertConfig.h"

static const struct nk_draw_vertex_layout_element default_vertex_layout[] = {
    {NK_VERTEX_POSITION, NK_FORMAT_FLOAT, offsetof(struct nk_default_vertex, position)},
    {NK_VERTEX_TEXCOORD, NK_FORMAT_FLOAT, offsetof(struct nk_default_vertex, uv)},
    {NK_VERTEX_COLOR, NK_FORMAT_R8G8B8A8, offsetof(struct nk_default_vertex, col)},
    {NK_VERTEX_LAYOUT_END}
};

static struct nk_draw_null_texture _nullTexture;

@implementation NKConvertConfig

+ (instancetype)config {
    return [[[self alloc] init] autorelease];
}

- (instancetype)init {
    self = [super init];
    
    memset(&_config, 0, sizeof(struct nk_convert_config));
    _config.vertex_layout = default_vertex_layout;
    _config.vertex_size = sizeof(struct nk_default_vertex);
    _config.vertex_alignment = OF_ALIGNOF(struct nk_default_vertex);
    _config.null = _nullTexture;
    _config.circle_segment_count = 22;
    _config.curve_segment_count = 22;
    _config.arc_segment_count = 22;
    _config.global_alpha = 1.0f;
    _config.shape_AA = NK_ANTI_ALIASING_ON;
    _config.line_AA = NK_ANTI_ALIASING_ON;
    
    return self;
}

- (struct nk_convert_config *)configHandle {
    return &_config;
}

- (const struct nk_draw_vertex_layout_element *)vertexLayout {
    return _config.vertex_layout;
}

- (void)setVertexLayout:(const struct nk_draw_vertex_layout_element *)vertexLayout {
    _config.vertex_layout = vertexLayout;
}

- (size_t)vertexSize {
    return _config.vertex_size;
}

- (void)setVertexSize:(size_t)vertexSize {
    _config.vertex_size = vertexSize;
}

- (size_t)vertexAlignment {
    return _config.vertex_alignment;
}

- (void)setVertexAlignment:(size_t)vertexAlignment {
    _config.vertex_alignment = vertexAlignment;
}

- (float)globalAlpha {
    return _config.global_alpha;
}

- (void)setGlobalAlpha:(float)globalAlpha {
    _config.global_alpha = globalAlpha;
}

- (enum nk_anti_aliasing)lineAntiAliasing {
    return _config.line_AA;
}

- (void)setLineAntiAliasing:(enum nk_anti_aliasing)lineAntiAliasing {
    _config.line_AA = lineAntiAliasing;
}

- (enum nk_anti_aliasing)shapeAntiAliasing {
    return _config.shape_AA;
}

- (void)setShapeAntiAliasing:(enum nk_anti_aliasing)shapeAntiAliasing {
    _config.shape_AA = shapeAntiAliasing;
}

- (unsigned int)circleSegmentCount {
    return _config.circle_segment_count;
}

- (void)setCircleSegmentCount:(unsigned int)circleSegmentCount {
    _config.circle_segment_count = circleSegmentCount;
}

- (unsigned int)arcSegmentCount {
    return _config.arc_segment_count;
}

- (void)setArcSegmentCount:(unsigned int)arcSegmentCount {
    _config.arc_segment_count = arcSegmentCount;
}

- (unsigned int)curveSegmentCount {
    return _config.curve_segment_count;
}

- (void)setCurveSegmentCount:(unsigned int)curveSegmentCount {
    _config.curve_segment_count = curveSegmentCount;
}

- (struct nk_draw_null_texture)nullTexture {
    return _config.null;
}

- (void)setNullTexture:(struct nk_draw_null_texture)nullTexture {
    _config.null = nullTexture;
}

@end
