
/*
    pbrt source code Copyright(c) 1998-2012 Matt Pharr and Greg Humphreys.

    This file is part of pbrt.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:

    - Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.

    - Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
    IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
    PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 */

#if defined(_MSC_VER)
#pragma once
#endif

#ifndef PBRT_CORE_RENDERER_H
#define PBRT_CORE_RENDERER_H

// core/renderer.h*
#include "pbrt.h"

// Renderer Declarations
class Renderer {
public:
    // Renderer Interface
    virtual ~Renderer();

	 // 核心方法，提供scene指针，计算场景图像；
    virtual void Render(const Scene *scene) = 0;

	 /* 计算沿着既定光线上的入射辐射度。
	  * sample				针对积分器中的蒙特卡洛积分提供了随机采样值；
	  * T						若非NULL，则沿光线的体透射率将通过该参数返回；
	  */
    virtual Spectrum Li(const Scene *scene, const RayDifferential &ray,
        const Sample *sample, RNG &rng, MemoryArena &arena,
        Intersection *isect = NULL, Spectrum *T = NULL) const = 0;

	 /**
	  * 返回体散射造成的光线衰减部分；
	  * 【2017-07-27】上面的翻译是来自第二版的中文翻译书籍，查看了E文原版发现译者没有
	  * 错误，但实际上Transmittance返回的是“1-体散射造成的光线衰减”，其含义恰好相反；
	  */
    virtual Spectrum Transmittance(const Scene *scene,
        const RayDifferential &ray, const Sample *sample,
        RNG &rng, MemoryArena &arena) const = 0;
};



#endif // PBRT_CORE_RENDERER_H
