
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

#ifndef PBRT_SAMPLERS_STRATIFIED_H
#define PBRT_SAMPLERS_STRATIFIED_H

 // samplers/stratified.h*
#include "sampler.h"
#include "film.h"

// StratifiedSampler Declarations
// 将采样区域分成不相交的多个区域，并在其中获取单一采样。
class StratifiedSampler: public Sampler{
public:
  /**
  * StratifiedSampler Public Methods
  * xs    x方向上的分层数，表明的是一个像素内x方向分了多少层。
  */
  StratifiedSampler(int xstart,int xend,int ystart,int yend,
                    int xs,int ys,bool jitter,float sopen,float sclose);
  ~StratifiedSampler();
  int RoundSize(int size) const{ return size; }
  Sampler *GetSubSampler(int num,int count);
  int GetMoreSamples(Sample *sample,RNG &rng);
  int MaximumSampleCount(){ return xPixelSamples * yPixelSamples; }
private:
  // StratifiedSampler Private Data
  int xPixelSamples,yPixelSamples;
  bool jitterSamples;
  int xPos,yPos;
  float *sampleBuf;
};

StratifiedSampler *CreateStratifiedSampler(const ParamSet &params,const Film *film,
                                           const Camera *camera);

#endif // PBRT_SAMPLERS_STRATIFIED_H
