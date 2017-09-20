
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

#ifndef PBRT_CORE_LIGHT_H
#define PBRT_CORE_LIGHT_H

 // core/light.h*
#include "pbrt.h"
#include "geometry.h"
#include "transform.h"
#include "spectrum.h"
#include "rng.h"
#include "memory.h"

// Light Declarations
class Light{
public:
  // Light Interface
  virtual ~Light();
  Light(const Transform &l2w,int ns=1)
    : nSamples(max(1,ns)),LightToWorld(l2w),
    WorldToLight(Inverse(l2w)){
    // Warn if light has transformation with scale
    if(WorldToLight.HasScale())
      Warning("Scaling detected in world to light transformation!\n"
              "The system has numerous assumptions, implicit and explicit,\n"
              "that this transform will have no scale factors in it.\n"
              "Proceed at your own risk; your image may have errors or\n"
              "the system may crash as a result of this.");
  }

  /**
   * 调用者负责传递场景内一点的世界空间位置，以及光照采样的时刻，最终返回到达该点的辐射度。
   * 该函数还负责初始化相对于光源的入射方向wi，以及初始化VisibilityTester对象；
   * 如果光源不是点光源，该方法需要对光源表面上的一点进行随机采样。
   */
  virtual Spectrum Sample_L(const Point &p,float pEpsilon,
                            const LightSample &ls,float time,Vector *wi,float *pdf,
                            VisibilityTester *vis) const=0;
  virtual Spectrum Power(const Scene *) const=0;

  // 确定光源是否使用Delta分布进行描述；
  virtual bool IsDeltaLight() const=0;

  // 针对未与场景几何体对象碰撞的光线，无穷远区域光源须向其“贡献”辐射度。对此，可向Light基类加入一方法，沿未碰撞光线并根据当前光源返回发射辐射度。
  // 针对其他类型光源，默认实现并不返回辐射度。
  virtual Spectrum Le(const RayDifferential &r) const;
  virtual float Pdf(const Point &p,const Vector &wi) const=0;
  virtual Spectrum Sample_L(const Scene *scene,const LightSample &ls,
                            float u1,float u2,float time,Ray *ray,
                            Normal *Ns,float *pdf) const=0;
  virtual void SHProject(const Point &p,float pEpsilon,int lmax,
                         const Scene *scene,bool computeLightVisibility,float time,
                         RNG &rng,Spectrum *coeffs) const;

  // Light Public Data
  const int nSamples;
protected:
  // Light Protected Data
  const Transform LightToWorld,WorldToLight;
};


struct VisibilityTester{
  // VisibilityTester Public Methods

  // 可在场景中的两点间进行可见性测试。
  void SetSegment(const Point &p1,float eps1,
                  const Point &p2,float eps2,float time){
    float dist=Distance(p1,p2);
    r=Ray(p1,(p2-p1)/dist,eps1,dist * (1.f-eps2),time);
    Assert(!r.HasNaNs());
  }

  // 确定既定方向上是否存在相关对象。
  void SetRay(const Point &p,float eps,const Vector &w,float time){
    r=Ray(p,w,eps,INFINITY,time);
    Assert(!r.HasNaNs());
  }

  // 判断射线是否与场景中其它对象相交；
  bool Unoccluded(const Scene *scene) const;

  // 该方法用于处理经场景介质作用后的光线雨目标点之间的亮度；
  Spectrum Transmittance(const Scene *scene,const Renderer *renderer,
                         const Sample *sample,RNG &rng,MemoryArena &arena) const;
  Ray r;
};


class AreaLight: public Light{
public:
  // AreaLight Interface
  AreaLight(const Transform &l2w,int ns): Light(l2w,ns){}

  /**
   * 该方法是AreaLight专有。
   * 根据光源表面上的既定点和表面法线计算出射方向上的发射辐射度L;
  */
  virtual Spectrum L(const Point &p,const Normal &n,
                     const Vector &w) const=0;
};


struct LightSample{
  // LightSample Public Methods
  LightSample(){}
  LightSample(const Sample *sample,const LightSampleOffsets &offsets,uint32_t num);
  LightSample(RNG &rng){
    uPos[0]=rng.RandomFloat();
    uPos[1]=rng.RandomFloat();
    uComponent=rng.RandomFloat();
  }
  LightSample(float up0,float up1,float ucomp){
    Assert(up0>=0.f && up0<1.f);
    Assert(up1>=0.f && up1<1.f);
    Assert(ucomp>=0.f && ucomp<1.f);
    uPos[0]=up0; uPos[1]=up1;
    uComponent=ucomp;
  }
  float uPos[2],uComponent;
};


struct LightSampleOffsets{
  LightSampleOffsets(){}
  LightSampleOffsets(int count,Sample *sample);
  int nSamples,componentOffset,posOffset;
};



// ShapeSet Declarations
class ShapeSet{
public:
  // ShapeSet Public Methods
  ShapeSet(const Reference<Shape> &s);
  float Area() const{ return sumArea; }
  ~ShapeSet();
  Point Sample(const Point &p,const LightSample &ls,Normal *Ns) const;
  Point Sample(const LightSample &ls,Normal *Ns) const;
  float Pdf(const Point &p,const Vector &wi) const;
  float Pdf(const Point &p) const;
private:
  // ShapeSet Private Data
  vector<Reference<Shape> > shapes;
  float sumArea;
  vector<float> areas;
  Distribution1D *areaDistribution;
};



#endif // PBRT_CORE_LIGHT_H
