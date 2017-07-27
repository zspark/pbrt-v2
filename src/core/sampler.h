
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

#ifndef PBRT_CORE_SAMPLER_H
#define PBRT_CORE_SAMPLER_H

 // core/sampler.h*
#include "pbrt.h"
#include "geometry.h"
#include "rng.h"
#include "memory.h"

// Sampling Declarations
// 该类定义了采样器的接口，并负责生成多维采样位置序列。
class Sampler{
public:
  // Sampler Interface
  virtual ~Sampler();
  Sampler(int xstart,int xend,int ystart,int yend,
			 int spp,float sopen,float sclose);

  /** 
   * 该方法将生成1个或者多个采样，返回生成的采样数量，并将采样值填入参数中；
	* 采样其中设置的nSamples指的是一个像素的采样数量；
	* 该逻辑会依次遍历所有的像素，每个像素nSamples个采样；
	* 所以该函数一共会返回nSample*Xresolution*Yresolution个不同的sample内容，
	*/
  virtual int GetMoreSamples(Sample *sample,RNG &rng)=0;

  // 返回最大数量的采样，使得调用者对Sample的数量进行先期内存空间的分配；
  virtual int MaximumSampleCount()=0;

  // 向渲染器报告生成的光线，计算得到的辐射度值，以及最初源自GetMoreSamples方法的采样集合中的交点。
  virtual bool ReportResults(Sample *samples,const RayDifferential *rays,
									  const Spectrum *Ls,const Intersection *isects,int count);

  // 返回一个子采样器，最多count个，返回的这个是第num个；
  // 注意：所有的子采样器应该全面覆盖所有的图像；
  virtual Sampler *GetSubSampler(int num,int count)=0;
  virtual int RoundSize(int size) const=0;

  // Sampler Public Data
  const int xPixelStart,xPixelEnd,yPixelStart,yPixelEnd;
  const int samplesPerPixel;
  const float shutterOpen,shutterClose;
protected:
  // Sampler Protected Methods
	 // 该函数负责计算像素的采样范围；是个工具函数；
  void ComputeSubWindow(int num,int count,int *xstart,int *xend,int *ystart,int *yend) const;
};


struct CameraSample{
  float imageX,imageY;
  float lensU,lensV;
  float time;
};


struct Sample: public CameraSample{
  // Sample Public Methods
  Sample(Sampler *sampler,SurfaceIntegrator *surf,VolumeIntegrator *vol,
			const Scene *scene);


  // 将请求的采样数量记录于数组中，并回返一个索引以供积分器使用；
  uint32_t Add1D(uint32_t num){
	 n1D.push_back(num);
	 return n1D.size()-1;
  }
  uint32_t Add2D(uint32_t num){
	 n2D.push_back(num);
	 return n2D.size()-1;
  }
  ~Sample(){
	 if(oneD!=NULL){
		FreeAligned(oneD[0]);
		FreeAligned(oneD);
	 }
  }

  // 复制count个自己，由堆上的数组返回；
  Sample *Duplicate(int count) const;

  // Sample Public Data
  vector<uint32_t> n1D,n2D;
  float **oneD,**twoD;
private:
  // Sample Private Methods
  void AllocateSampleMemory();
  Sample(){ oneD=twoD=NULL; }
};



#endif // PBRT_CORE_SAMPLER_H
