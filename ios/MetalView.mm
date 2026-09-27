#import "MetalView.h"
#import "BuildInfo.h"
#include <simd/simd.h>

@implementation MetalView {
    id<MTLCommandQueue> _queue;
}

- (instancetype)initWithFrame:(CGRect)frame {
    id<MTLDevice> device = MTLCreateSystemDefaultDevice();
    self = [super initWithFrame:frame device:device];
    if (self) {
        _queue = [device newCommandQueue];
        self.colorPixelFormat = MTLPixelFormatBGRA8Unorm;
        self.clearColor = MTLClearColorMake(0.07, 0.09, 0.14, 1.0);
        self.preferredFramesPerSecond = 60;
        self.delegate = self;
        self.paused = NO;
        self.enableSetNeedsDisplay = NO;
        self.autoResizeDrawable = YES;
    }
    return self;
}

- (void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size {
    (void)view;
    (void)size;
}

- (void)drawInMTKView:(MTKView *)view {
    id<MTLCommandBuffer> cmd = [_queue commandBuffer];
    MTLRenderPassDescriptor *pass = view.currentRenderPassDescriptor;
    if (!pass) {
        return;
    }
    id<MTLRenderCommandEncoder> enc = [cmd renderCommandEncoderWithDescriptor:pass];
    [enc endEncoding];
    id<CAMetalDrawable> drawable = view.currentDrawable;
    if (drawable) {
        [cmd presentDrawable:drawable];
    }
    [cmd commit];
}

@end
