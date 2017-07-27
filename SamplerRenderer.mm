<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#990000" CREATED="1501122632132" ID="ID_461266390" MODIFIED="1501161855016">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: center">
      <font size="5">SamplerRenderer </font>
    </p>
    <p style="text-align: center">
      <i><font size="4">-WhittedIntegrator- </font></i>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-RandomSampler- </i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-PerspectiveCamera- </i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-PointLight- </i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-MirrorMaterial-</i></font>
    </p>
  </body>
</html>
</richcontent>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1501125313702" ID="ID_267505771" MODIFIED="1501160064042" POSITION="right" TEXT="void SamplerRenderer::Render(const Scene *scene)">
<node COLOR="#999999" CREATED="1501125647527" ID="ID_343582769" MODIFIED="1501135903754" TEXT="// Allow integrators to do preprocessing for the scene">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501125683507" ID="ID_609225841" MODIFIED="1501126044685" TEXT="surfaceIntegrator-&gt;Preprocess(scene,camera,this);">
<font NAME="SansSerif" SIZE="12"/>
<node COLOR="#006699" CREATED="1501126169626" ID="ID_862412655" MODIFIED="1501140371788" TEXT="&lt;&lt;WhittedIntegrator has no logic&gt;&gt;">
<font NAME="SansSerif" SIZE="10"/>
</node>
</node>
<node CREATED="1501125697803" ID="ID_718690332" MODIFIED="1501125700909" TEXT="volumeIntegrator-&gt;Preprocess(scene,camera,this);">
<node COLOR="#006699" CREATED="1501126169626" ID="ID_1779046247" MODIFIED="1501161898954" TEXT="&lt;&lt;TODO&gt;&gt;">
<font NAME="SansSerif" SIZE="10"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501125657160" ID="ID_1249866523" MODIFIED="1501135904776" TEXT="// Allocate and initialize _sample_">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501127505346" ID="ID_1043405659" MODIFIED="1501162183365" TEXT="Sample *sample=new Sample(sampler,surfaceIntegrator,volumeIntegrator,scene);">
<node CREATED="1501127733431" ID="ID_1975506111" MODIFIED="1501127734618" TEXT="if(surf) surf-&gt;RequestSamples(sampler,this,scene);">
<node COLOR="#006699" CREATED="1501127783429" ID="ID_1723604768" MODIFIED="1501140372857" TEXT="&lt;&lt;WhittedIntegrator has no logic&gt;&gt;">
<font NAME="SansSerif" SIZE="10"/>
</node>
</node>
<node CREATED="1501127739647" ID="ID_980656403" MODIFIED="1501127743440" TEXT="if(vol)  vol-&gt;RequestSamples(sampler,this,scene);"/>
<node CREATED="1501127746254" ID="ID_1694085567" MODIFIED="1501135914542" TEXT="AllocateSampleMemory()">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501125667308" ID="ID_1657126964" MODIFIED="1501125725837" TEXT="// Compute number of _SamplerRendererTask_s to create for rendering">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501135613455" ID="ID_780106377" MODIFIED="1501147736846">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      &#160;&#160;int nPixels=camera-&gt;film-&gt;xResolution * camera-&gt;film-&gt;yResolution;
    </p>
    <p style="text-align: left">
      &#160;&#160;int nTasks=max(32*NumSystemCores(),nPixels/(16*16));
    </p>
    <p style="text-align: left">
      &#160;&#160;nTasks=RoundUpPow2(nTasks);
    </p>
    <p style="text-align: left">
      &#160;&#160;ProgressReporter reporter(nTasks,&quot;Rendering&quot;);
    </p>
  </body>
</html></richcontent>
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1501147689556" ID="ID_1509539625" MODIFIED="1501147763017" TEXT="vector&lt;Task *&gt; renderTasks;&#xa;for(int i=0; i&lt;nTasks; ++i)">
<node CREATED="1501147671844" ID="ID_1898270116" MODIFIED="1501147726514" TEXT="renderTasks.push_back(new SamplerRendererTask(scene,this,camera,reporter,sampler,sample,visualizeObjectIds,nTasks-1-i,nTasks));"/>
</node>
<node CREATED="1501137545998" ID="ID_1937136649" MODIFIED="1501160065031" TEXT="&#xa0;&#xa0;EnqueueTasks(renderTasks);">
<node CREATED="1501137568065" ID="ID_492310959" MODIFIED="1501162634378" TEXT="tasks[i]-&gt;Run();">
<node COLOR="#999999" CREATED="1501139896230" ID="ID_595909183" MODIFIED="1501139898392" TEXT="// Get sub-_Sampler_ for _SamplerRendererTask_">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501137631073" ID="ID_1854590979" MODIFIED="1501137638881" TEXT="Sampler *sampler=mainSampler-&gt;GetSubSampler(taskNum,taskCount);"/>
<node COLOR="#999999" CREATED="1501140270903" ID="ID_797356880" MODIFIED="1501140272049" TEXT="// Declare local variables used for rendering loop">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501140278547" ID="ID_1276042780" MODIFIED="1501140442698" TEXT="MemoryArena arena;&#xa;RNG rng(taskNum);"/>
<node COLOR="#999999" CREATED="1501139915122" ID="ID_112811044" MODIFIED="1501139916580" TEXT="// Allocate space for samples and intersections">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501139502103" ID="ID_236401151" MODIFIED="1501139529544">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      &#160;&#160;int maxSamples=sampler-&gt;MaximumSampleCount();
    </p>
    <p style="text-align: left">
      &#160;&#160;Sample *samples=origSample-&gt;Duplicate(maxSamples);
    </p>
    <p style="text-align: left">
      &#160;&#160;RayDifferential *rays=new RayDifferential[maxSamples];
    </p>
    <p style="text-align: left">
      &#160;&#160;Spectrum *Ls=new Spectrum[maxSamples];
    </p>
    <p style="text-align: left">
      &#160;&#160;Spectrum *Ts=new Spectrum[maxSamples];
    </p>
    <p style="text-align: left">
      &#160;&#160;Intersection *isects=new Intersection[maxSamples];
    </p>
  </body>
</html></richcontent>
<node COLOR="#006699" CREATED="1501140347639" ID="ID_985608401" MODIFIED="1501140384481" TEXT="&lt;&lt;returns 1 for RandomSampler&gt;&gt;">
<font NAME="SansSerif" SIZE="10"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501139940550" ID="ID_1293801259" MODIFIED="1501139942539" TEXT="// Get samples from _Sampler_ and update image">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501139553154" ID="ID_1162917260" MODIFIED="1501140315030">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int sampleCount;
    </p>
    <p>
      while((sampleCount=sampler-&gt;GetMoreSamples(samples,rng))&gt;0)
    </p>
  </body>
</html></richcontent>
<node COLOR="#999999" CREATED="1501140213465" ID="ID_40415666" MODIFIED="1501140214767" TEXT="// Generate camera rays and compute radiance along rays">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501139569878" ID="ID_1174461792" MODIFIED="1501158275821" TEXT="for(int i=0; i&lt;sampleCount; ++i)">
<node COLOR="#999999" CREATED="1501141722855" ID="ID_905670039" MODIFIED="1501141724142" TEXT="// Find camera ray for _sample[i]_">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501139585509" ID="ID_1836136186" MODIFIED="1501139678376" TEXT="float rayWeight=camera-&gt;GenerateRayDifferential(samples[i],&amp;rays[i]);">
<node COLOR="#006699" CREATED="1501147489811" ID="ID_117939789" MODIFIED="1501147598346" TEXT="&lt;&lt;depth of field, and rayWeight is always 1.0f in perspective camera&gt;&gt;">
<font NAME="SansSerif" SIZE="10"/>
</node>
</node>
<node CREATED="1501139596811" ID="ID_1330192585" MODIFIED="1501139597016" TEXT="rays[i].ScaleDifferentials(1.f/sqrtf(sampler-&gt;samplesPerPixel));"/>
<node COLOR="#999999" CREATED="1501141739469" ID="ID_1405635601" MODIFIED="1501141740678" TEXT="// Evaluate radiance along camera ray">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#990000" CREATED="1501139612809" ID="ID_444853147" MODIFIED="1501159009067" TEXT="if(rayWeight&gt;0.f)Ls[i]=rayWeight * renderer-&gt;Li(scene,rays[i],&amp;samples[i],rng,arena,&amp;isects[i],&amp;Ts[i]);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="60;-24;" ID="Arrow_ID_303581661" STARTARROW="None" STARTINCLINATION="-122;268;"/>
</node>
<node CREATED="1501139624509" ID="ID_1367874635" MODIFIED="1501139635836" TEXT="else{ &#x9;&#x9;&#x9; Ls[i]=0.f; &#x9;&#x9;&#x9; Ts[i]=1.f; &#x9;&#x9;  }"/>
</node>
<node COLOR="#999999" CREATED="1501140194604" ID="ID_1464528973" MODIFIED="1501140195969" TEXT="// Report sample results to _Sampler_, add contributions to image">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501139739426" ID="ID_796413279" MODIFIED="1501140038700">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      if(sampler-&gt;ReportResults(samples,rays,Ls,isects,sampleCount)){
    </p>
    <p style="text-align: left">
      &#160;&#160;for(int i=0; i&lt;sampleCount; ++i)camera-&gt;film-&gt;AddSample(samples[i],Ls[i]);
    </p>
    <p style="text-align: left">
      }
    </p>
  </body>
</html></richcontent>
</node>
<node COLOR="#999999" CREATED="1501140187834" ID="ID_1172685064" MODIFIED="1501140189324" TEXT="// Free _MemoryArena_ memory from computing image sample values">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501139819743" ID="ID_30567835" MODIFIED="1501139820588" TEXT="arena.FreeAll();"/>
</node>
<node COLOR="#999999" CREATED="1501140228254" ID="ID_945831127" MODIFIED="1501140229556" TEXT="// Clean up after _SamplerRendererTask_ is done with its image region">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501139831950" ID="ID_474603338" MODIFIED="1501140241179" TEXT="camera-&gt;film-&gt;UpdateDisplay(sampler-&gt;xPixelStart,sampler-&gt;yPixelStart,sampler-&gt;xPixelEnd+1,sampler-&gt;yPixelEnd+1);"/>
<node COLOR="#ff0000" CREATED="1501139851458" ID="ID_93462369" MODIFIED="1501139861559">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      delete sampler;
    </p>
    <p>
      &#160;&#160;delete[] samples;
    </p>
    <p>
      &#160;&#160;delete[] rays;
    </p>
    <p>
      &#160;&#160;delete[] Ls;
    </p>
    <p>
      &#160;&#160;delete[] Ts;
    </p>
    <p>
      &#160;&#160;delete[] isects;
    </p>
    <p>
      &#160;&#160;reporter.Update();
    </p>
  </body>
</html></richcontent>
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501137530648" ID="ID_1566791993" MODIFIED="1501137543481">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      &#160;&#160;WaitForAllTasks();
    </p>
    <p style="text-align: left">
      &#160;&#160;for(uint32_t i=0; i&lt;renderTasks.size(); ++i)delete renderTasks[i];
    </p>
    <p style="text-align: left">
      &#160;&#160;reporter.Done();
    </p>
  </body>
</html></richcontent>
</node>
<node COLOR="#999999" CREATED="1501125672827" ID="ID_854140763" MODIFIED="1501125726407" TEXT="// Clean up after rendering and store final image">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#ff0000" CREATED="1501135770119" ID="ID_1019952528" MODIFIED="1501135862905" TEXT="delete sample;"/>
<node CREATED="1501135775462" ID="ID_244034339" MODIFIED="1501135799150" TEXT="camera-&gt;film-&gt;WriteImage()"/>
</node>
<node CREATED="1501158278298" ID="ID_1991648994" MODIFIED="1501161417259" POSITION="right" TEXT="Spectrum SamplerRenderer::Li(const Scene *scene,const RayDifferential &amp;ray,const Sample *sample,RNG &amp;rng,MemoryArena &amp;arena,Intersection *isect,Spectrum *T)">
<node COLOR="#999999" CREATED="1501158303994" ID="ID_1006302197" MODIFIED="1501158305575" TEXT="// Allocate local variables for _isect_ and _T_ if needed">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501158380066" ID="ID_449137693" MODIFIED="1501158391962" TEXT="Spectrum localT;&#xa;if(!T) T=&amp;localT;&#xa;Intersection localIsect;&#xa;if(!isect) isect=&amp;localIsect;&#xa;Spectrum Li=0.f;"/>
<node CREATED="1501158400066" ID="ID_1034243452" MODIFIED="1501163950904" TEXT="if(scene-&gt;Intersect(ray,isect))">
<node CREATED="1501154229887" ID="ID_770764746" MODIFIED="1501161435845" TEXT="Li=surfaceIntegrator-&gt;Li(scene,this,ray,*isect,sample,rng,arena);">
<node COLOR="#999999" CREATED="1501154393999" ID="ID_1769148932" MODIFIED="1501154395967" TEXT="// Compute emitted and reflected light at ray intersection point">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501154459127" ID="ID_743437454" MODIFIED="1501154861647" TEXT="Spectrum L(0.);"/>
<node COLOR="#999999" CREATED="1501154410199" ID="ID_226975413" MODIFIED="1501154411166" TEXT="// Evaluate BSDF at hit point">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501154471808" ID="ID_212894413" MODIFIED="1501163953162" TEXT="BSDF *bsdf = isect.GetBSDF(ray, arena);">
<node COLOR="#999999" CREATED="1501156121481" ID="ID_716514095" MODIFIED="1501156122923" TEXT="// Allocate _BSDF_, possibly doing bump mapping with _bumpMap_">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501156134265" ID="ID_611700583" MODIFIED="1501156139501">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      DifferentialGeometry dgs;
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;if (bumpMap)
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Bump(bumpMap, dgGeom, dgShading, &amp;dgs);
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;else
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;dgs = dgShading;
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;BSDF *bsdf = BSDF_ALLOC(arena, BSDF)(dgs, dgGeom.nn);
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;Spectrum R = Kr-&gt;Evaluate(dgs).Clamp();
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;if (!R.IsBlack())
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;bsdf-&gt;Add(BSDF_ALLOC(arena, SpecularReflection)(R,
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;BSDF_ALLOC(arena, FresnelNoOp)()));
    </p>
    <p style="text-align: left">
      &#160;&#160;&#160;&#160;return bsdf;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node COLOR="#999999" CREATED="1501154417726" ID="ID_523848725" MODIFIED="1501154418537" TEXT="// Initialize common variables for Whitted integrator">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501154550271" ID="ID_429850703" MODIFIED="1501154848591" TEXT="const Point &amp;p = bsdf-&gt;dgShading.p;&#xa;const Normal &amp;n = bsdf-&gt;dgShading.nn;&#xa;Vector wo = -ray.d;"/>
<node COLOR="#999999" CREATED="1501154438079" ID="ID_1606661081" MODIFIED="1501154439026" TEXT="// Compute emitted light if ray hit an area light source">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501154568303" ID="ID_915802934" MODIFIED="1501154568606" TEXT="L += isect.Le(wo);"/>
<node COLOR="#999999" CREATED="1501154448519" ID="ID_725044199" MODIFIED="1501154449254" TEXT="// Add contribution of each light source">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501154579016" ID="ID_1169883430" MODIFIED="1501163955404" TEXT="for (uint32_t i = 0; i &lt; scene-&gt;lights.size(); ++i) ">
<node COLOR="#338800" CREATED="1501154624719" ID="ID_276644104" MODIFIED="1501154853895" TEXT="Vector wi;float pdf;VisibilityTester visibility;"/>
<node CREATED="1501154657128" ID="ID_1501515829" MODIFIED="1501154658934" TEXT="Spectrum Li = scene-&gt;lights[i]-&gt;Sample_L(p, isect.rayEpsilon,LightSample(rng), ray.time, &amp;wi, &amp;pdf, &amp;visibility);">
<node CREATED="1501155470552" ID="ID_1861122130" MODIFIED="1501155478856">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      *wi=Normalize(lightPos-p);
    </p>
    <p>
      *pdf=1.f;
    </p>
    <p>
      visibility-&gt;SetSegment(p,pEpsilon,lightPos,0.,time);
    </p>
    <p>
      return Intensity/DistanceSquared(lightPos,p);
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1501154669823" ID="ID_1227897206" MODIFIED="1501154670092" TEXT="if (Li.IsBlack() || pdf == 0.f) continue;"/>
<node CREATED="1501154674511" ID="ID_1574574756" MODIFIED="1501154674715" TEXT=" Spectrum f = bsdf-&gt;f(wo, wi);"/>
<node CREATED="1501154682672" ID="ID_995696333" MODIFIED="1501154682853" TEXT="if (!f.IsBlack() &amp;&amp; visibility.Unoccluded(scene))">
<node CREATED="1501154688623" ID="ID_777834603" MODIFIED="1501154702668" TEXT="L += f * Li * AbsDot(wi, n) *visibility.Transmittance(scene, renderer,sample, rng, arena) / pdf;"/>
</node>
</node>
<node CREATED="1501154592959" ID="ID_1031088743" MODIFIED="1501154593536" TEXT="if (ray.depth + 1 &lt; maxDepth)">
<node COLOR="#999999" CREATED="1501154727263" ID="ID_976006635" MODIFIED="1501154729135" TEXT=" // Trace rays for specular reflection and refraction">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501154733968" FOLDED="true" ID="ID_1641369673" MODIFIED="1501161806299" TEXT="L += SpecularReflect(ray, bsdf, rng, isect, renderer, scene, sample,arena);">
<node COLOR="#338800" CREATED="1501161161652" ID="ID_557770827" MODIFIED="1501161171373">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Vector wo=-ray.d,wi;
    </p>
    <p>
      float pdf;
    </p>
    <p>
      const Point &amp;p=bsdf-&gt;dgShading.p;
    </p>
    <p>
      const Normal &amp;n=bsdf-&gt;dgShading.nn;
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1501161178076" ID="ID_796875059" MODIFIED="1501161188746" TEXT="Spectrum f=bsdf-&gt;Sample_f(wo,&amp;wi,BSDFSample(rng),&amp;pdf, BxDFType(BSDF_REFLECTION|BSDF_SPECULAR));"/>
<node COLOR="#338800" CREATED="1501161204037" ID="ID_345290455" MODIFIED="1501161206621" TEXT=" Spectrum L=0.f;"/>
<node CREATED="1501161214524" ID="ID_1619390903" MODIFIED="1501161215723" TEXT="if(pdf&gt;0.f&amp;&amp;!f.IsBlack()&amp;&amp;AbsDot(wi,n)!=0.f)">
<node COLOR="#999999" CREATED="1501161220893" ID="ID_224369119" MODIFIED="1501161223421" TEXT="// Compute ray differential _rd_ for specular reflection">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501161230212" ID="ID_1642119104" MODIFIED="1501161230434" TEXT="RayDifferential rd(p,wi,ray,isect.rayEpsilon);"/>
<node CREATED="1501161239197" FOLDED="true" ID="ID_1712290826" MODIFIED="1501161307218" TEXT="if(ray.hasDifferentials)">
<node CREATED="1501161250852" ID="ID_1859597264" MODIFIED="1501161299389">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      rd.hasDifferentials=true;
    </p>
    <p>
      rd.rxOrigin=p+isect.dg.dpdx;
    </p>
    <p>
      rd.ryOrigin=p+isect.dg.dpdy;
    </p>
    <p>
      // Compute differential reflected directions
    </p>
    <p>
      Normal dndx=bsdf-&gt;dgShading.dndu * bsdf-&gt;dgShading.dudx+bsdf-&gt;dgShading.dndv * bsdf-&gt;dgShading.dvdx;
    </p>
    <p>
      Normal dndy=bsdf-&gt;dgShading.dndu * bsdf-&gt;dgShading.dudy+bsdf-&gt;dgShading.dndv * bsdf-&gt;dgShading.dvdy;
    </p>
    <p>
      Vector dwodx=-ray.rxDirection-wo,dwody=-ray.ryDirection-wo;
    </p>
    <p>
      float dDNdx=Dot(dwodx,n)+Dot(wo,dndx);
    </p>
    <p>
      float dDNdy=Dot(dwody,n)+Dot(wo,dndy);
    </p>
    <p>
      rd.rxDirection=wi-dwodx+2*Vector(Dot(wo,n) * dndx+dDNdx * n);
    </p>
    <p>
      rd.ryDirection=wi-dwody+2*Vector(Dot(wo,n) * dndy+dDNdy * n);
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node COLOR="#990000" CREATED="1501161308389" ID="ID_1630674246" MODIFIED="1501161417259" TEXT="Spectrum Li=renderer-&gt;Li(scene,rd,sample,rng,arena);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_235931306" STARTARROW="None" STARTINCLINATION="65;170;"/>
</node>
<node CREATED="1501161325213" ID="ID_545376017" MODIFIED="1501161325418" TEXT="L=f * Li * AbsDot(wi,n)/pdf;"/>
</node>
<node CREATED="1501161332293" ID="ID_957208511" MODIFIED="1501161332556" TEXT="return L;"/>
</node>
<node CREATED="1501154743279" FOLDED="true" ID="ID_206889962" MODIFIED="1501161808755" TEXT="L += SpecularTransmit(ray, bsdf, rng, isect, renderer, scene, sample,arena);">
<node COLOR="#338800" CREATED="1501161530164" ID="ID_1035974868" MODIFIED="1501161742588">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Vector wo=-ray.d,wi;
    </p>
    <p>
      float pdf;
    </p>
    <p>
      const Point &amp;p=bsdf-&gt;dgShading.p;
    </p>
    <p>
      const Normal &amp;n=bsdf-&gt;dgShading.nn;
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1501161579029" ID="ID_351934902" MODIFIED="1501161607102" TEXT="Spectrum f=bsdf-&gt;Sample_f(wo,&amp;wi,BSDFSample(rng),&amp;pdf,&#xa;BxDFType(BSDF_TRANSMISSION|BSDF_SPECULAR));"/>
<node COLOR="#338800" CREATED="1501161204037" ID="ID_1713033387" MODIFIED="1501161206621" TEXT=" Spectrum L=0.f;"/>
<node CREATED="1501161214524" ID="ID_1805254364" MODIFIED="1501161215723" TEXT="if(pdf&gt;0.f&amp;&amp;!f.IsBlack()&amp;&amp;AbsDot(wi,n)!=0.f)">
<node COLOR="#999999" CREATED="1501161220893" ID="ID_912661433" MODIFIED="1501161223421" TEXT="// Compute ray differential _rd_ for specular reflection">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501161230212" ID="ID_1960747999" MODIFIED="1501161230434" TEXT="RayDifferential rd(p,wi,ray,isect.rayEpsilon);"/>
<node CREATED="1501161239197" FOLDED="true" ID="ID_1615077168" MODIFIED="1501161701219" TEXT="if(ray.hasDifferentials)">
<node CREATED="1501161250852" ID="ID_1461343360" MODIFIED="1501161699198">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      rd.hasDifferentials=true;
    </p>
    <p>
      rd.rxOrigin=p+isect.dg.dpdx;
    </p>
    <p>
      rd.ryOrigin=p+isect.dg.dpdy;
    </p>
    <p>
      
    </p>
    <p>
      float eta=bsdf-&gt;eta;
    </p>
    <p>
      Vector w=-wo;
    </p>
    <p>
      if(Dot(wo,n)&lt;0) eta=1.f/eta;
    </p>
    <p>
      
    </p>
    <p>
      Normal dndx=bsdf-&gt;dgShading.dndu * bsdf-&gt;dgShading.dudx+bsdf-&gt;dgShading.dndv * bsdf-&gt;dgShading.dvdx;
    </p>
    <p>
      Normal dndy=bsdf-&gt;dgShading.dndu * bsdf-&gt;dgShading.dudy+bsdf-&gt;dgShading.dndv * bsdf-&gt;dgShading.dvdy;
    </p>
    <p>
      
    </p>
    <p>
      Vector dwodx=-ray.rxDirection-wo,dwody=-ray.ryDirection-wo;
    </p>
    <p>
      float dDNdx=Dot(dwodx,n)+Dot(wo,dndx);
    </p>
    <p>
      float dDNdy=Dot(dwody,n)+Dot(wo,dndy);
    </p>
    <p>
      
    </p>
    <p>
      float mu=eta * Dot(w,n)-Dot(wi,n);
    </p>
    <p>
      float dmudx=(eta-(eta*eta*Dot(w,n))/Dot(wi,n)) * dDNdx;
    </p>
    <p>
      float dmudy=(eta-(eta*eta*Dot(w,n))/Dot(wi,n)) * dDNdy;
    </p>
    <p>
      
    </p>
    <p>
      rd.rxDirection=wi+eta * dwodx-Vector(mu * dndx+dmudx * n);
    </p>
    <p>
      rd.ryDirection=wi+eta * dwody-Vector(mu * dndy+dmudy * n);
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node COLOR="#990000" CREATED="1501161308389" ID="ID_167951652" MODIFIED="1501161417259" TEXT="Spectrum Li=renderer-&gt;Li(scene,rd,sample,rng,arena);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_1395068675" STARTARROW="None" STARTINCLINATION="65;170;"/>
</node>
<node CREATED="1501161325213" ID="ID_117005457" MODIFIED="1501161325418" TEXT="L=f * Li * AbsDot(wi,n)/pdf;"/>
</node>
<node CREATED="1501161332293" ID="ID_1252963802" MODIFIED="1501161332556" TEXT="return L;"/>
</node>
</node>
<node CREATED="1501154598287" ID="ID_1802163961" MODIFIED="1501154598588" TEXT="return L;"/>
</node>
</node>
<node CREATED="1501158421945" ID="ID_705614495" MODIFIED="1501158423872" TEXT="else">
<node COLOR="#999999" CREATED="1501158429478" ID="ID_1930260112" MODIFIED="1501158430534" TEXT="// Handle ray that doesn&apos;t intersect any geometry">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501158436610" ID="ID_491317253" MODIFIED="1501158448872" TEXT="for(uint32_t i=0; i&lt;scene-&gt;lights.size(); ++i)&#xa;   Li+=scene-&gt;lights[i]-&gt;Le(ray);"/>
</node>
<node CREATED="1501158455234" ID="ID_5168828" MODIFIED="1501158463456" TEXT="Spectrum Lvi=volumeIntegrator-&gt;Li(scene,this,ray,sample,rng,T,arena);"/>
<node CREATED="1501158470298" ID="ID_1170101992" MODIFIED="1501158470543" TEXT="return *T * Li+Lvi;"/>
</node>
</node>
</map>
