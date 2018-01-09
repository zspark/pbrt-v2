<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#990000" CREATED="1501122632132" ID="ID_461266390" MODIFIED="1506322636188">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: center">
      <font size="5">SamplerRenderer </font>
    </p>
    <p style="text-align: center">
      <i><font size="4">-DiffuseIntegrator- </font></i>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-EmissionIntegrator-</i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-RandomSampler-</i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-PerspectiveCamera-</i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-InfiniteAreaLight-</i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-MirrorMaterial-</i></font>
    </p>
  </body>
</html>
</richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501125313702" FOLDED="true" ID="ID_267505771" MODIFIED="1506322675233" POSITION="right" TEXT="void SamplerRenderer::Render(const Scene *scene)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501125647527" ID="ID_343582769" MODIFIED="1501234599558" TEXT="// Allow integrators to do preprocessing for the scene">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501125683507" ID="ID_609225841" MODIFIED="1501234599558" TEXT="surfaceIntegrator-&gt;Preprocess(scene,camera,this);">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      WhittedIntegrator has no logic
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501125697803" ID="ID_718690332" MODIFIED="1501234599558" TEXT="volumeIntegrator-&gt;Preprocess(scene,camera,this);">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      TODO
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501125657160" ID="ID_1249866523" MODIFIED="1501234599558" TEXT="// Allocate and initialize _sample_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501127505346" ID="ID_1043405659" MODIFIED="1501744199039" TEXT="Sample *sample=new Sample(sampler,surfaceIntegrator,volumeIntegrator,scene);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501127733431" ID="ID_1975506111" MODIFIED="1501234599542" TEXT="if(surf) surf-&gt;RequestSamples(sampler,this,scene);">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      WhittedIntegrator has no logic
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501127739647" ID="ID_980656403" MODIFIED="1501234599542" TEXT="if(vol)  vol-&gt;RequestSamples(sampler,this,scene);">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      TODO
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501127746254" ID="ID_1694085567" MODIFIED="1501234599542" TEXT="AllocateSampleMemory()">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501125667308" ID="ID_1657126964" MODIFIED="1501234599542" TEXT="// Compute number of _SamplerRendererTask_s to create for rendering">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501135613455" ID="ID_780106377" MODIFIED="1501234599542">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      &#xa0;&#xa0;int nPixels=camera-&gt;film-&gt;xResolution * camera-&gt;film-&gt;yResolution;
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;int nTasks=max(32*NumSystemCores(),nPixels/(16*16));
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;nTasks=RoundUpPow2(nTasks);
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;ProgressReporter reporter(nTasks,"Rendering");
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501147689556" ID="ID_1509539625" MODIFIED="1501744199044" TEXT="vector&lt;Task *&gt; renderTasks;&#xa;for(int i=0; i&lt;nTasks; ++i)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501147671844" ID="ID_1898270116" MODIFIED="1501234599542" TEXT="renderTasks.push_back(new SamplerRendererTask(scene,this,camera,reporter,sampler,sample,visualizeObjectIds,nTasks-1-i,nTasks));">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501137545998" ID="ID_1937136649" MODIFIED="1501744199048" TEXT="&#xa0;&#xa0;EnqueueTasks(renderTasks);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501137568065" ID="ID_492310959" MODIFIED="1501754671398" TEXT="tasks[i]-&gt;Run();">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501139896230" ID="ID_595909183" MODIFIED="1501234599542" TEXT="// Get sub-_Sampler_ for _SamplerRendererTask_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501137631073" ID="ID_1854590979" MODIFIED="1501234599542" TEXT="Sampler *sampler=mainSampler-&gt;GetSubSampler(taskNum,taskCount);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501140270903" ID="ID_797356880" MODIFIED="1501234599542" TEXT="// Declare local variables used for rendering loop">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501140278547" ID="ID_1276042780" MODIFIED="1501234599542" TEXT="MemoryArena arena;&#xa;RNG rng(taskNum);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501139915122" ID="ID_112811044" MODIFIED="1501234599542" TEXT="// Allocate space for samples and intersections">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501139502103" ID="ID_236401151" MODIFIED="1501234599542">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      &#xa0;&#xa0;int maxSamples=sampler-&gt;MaximumSampleCount();
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;Sample *samples=origSample-&gt;Duplicate(maxSamples);
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;RayDifferential *rays=new RayDifferential[maxSamples];
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;Spectrum *Ls=new Spectrum[maxSamples];
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;Spectrum *Ts=new Spectrum[maxSamples];
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;Intersection *isects=new Intersection[maxSamples];
    </p>
  </body>
</html></richcontent>
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MaximumSampleCount() in RandomSampler always return 1
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501139940550" ID="ID_1293801259" MODIFIED="1501234599542" TEXT="// Get samples from _Sampler_ and update image">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#006699" CREATED="1501139553154" ID="ID_1162917260" MODIFIED="1501814138252">
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
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int RandomSampler::GetMoreSamples(Sample *sample,RNG &amp;rng){
    </p>
    <p>
      &#160;&#160;if(samplePos==nSamples){
    </p>
    <p>
      if(xPixelStart==xPixelEnd||yPixelStart==yPixelEnd)
    </p>
    <p>
      return 0;
    </p>
    <p>
      if(++xPos==xPixelEnd){
    </p>
    <p>
      xPos=xPixelStart;
    </p>
    <p>
      ++yPos;
    </p>
    <p>
      }
    </p>
    <p>
      if(yPos==yPixelEnd)
    </p>
    <p>
      return 0;
    </p>
    <p>
      
    </p>
    <p>
      for(int i=0; i&lt;5*nSamples; ++i)
    </p>
    <p>
      imageSamples[i]=rng.RandomFloat();
    </p>
    <p>
      
    </p>
    <p>
      // Shift image samples to pixel coordinates
    </p>
    <p>
      for(int o=0; o&lt;2*nSamples; o+=2){
    </p>
    <p>
      imageSamples[o]+=xPos;
    </p>
    <p>
      imageSamples[o+1]+=yPos;
    </p>
    <p>
      }
    </p>
    <p>
      samplePos=0;
    </p>
    <p>
      &#160;&#160;}
    </p>
    <p>
      &#160;&#160;// Return next \mono{RandomSampler} sample point
    </p>
    <p>
      &#160;&#160;sample-&gt;imageX=imageSamples[2*samplePos];
    </p>
    <p>
      &#160;&#160;sample-&gt;imageY=imageSamples[2*samplePos+1];
    </p>
    <p>
      &#160;&#160;sample-&gt;lensU=lensSamples[2*samplePos];
    </p>
    <p>
      &#160;&#160;sample-&gt;lensV=lensSamples[2*samplePos+1];
    </p>
    <p>
      &#160;&#160;sample-&gt;time=Lerp(timeSamples[samplePos],shutterOpen,shutterClose);
    </p>
    <p>
      &#160;&#160;// Generate stratified samples for integrators
    </p>
    <p>
      &#160;&#160;for(uint32_t i=0; i&lt;sample-&gt;n1D.size(); ++i)
    </p>
    <p>
      for(uint32_t j=0; j&lt;sample-&gt;n1D[i]; ++j)
    </p>
    <p>
      sample-&gt;oneD[i][j]=rng.RandomFloat();
    </p>
    <p>
      &#160;&#160;for(uint32_t i=0; i&lt;sample-&gt;n2D.size(); ++i)
    </p>
    <p>
      for(uint32_t j=0; j&lt;2*sample-&gt;n2D[i]; ++j)
    </p>
    <p>
      sample-&gt;twoD[i][j]=rng.RandomFloat();
    </p>
    <p>
      &#160;&#160;++samplePos;
    </p>
    <p>
      &#160;&#160;return 1;
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501140213465" ID="ID_40415666" MODIFIED="1501234599542" TEXT="// Generate camera rays and compute radiance along rays">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501139569878" ID="ID_1174461792" MODIFIED="1501754682576" TEXT="for(int i=0; i&lt;sampleCount; ++i)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501141722855" ID="ID_905670039" MODIFIED="1501234599542" TEXT="// Find camera ray for _sample[i]_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501139585509" ID="ID_1836136186" MODIFIED="1501234599542" TEXT="float rayWeight=camera-&gt;GenerateRayDifferential(samples[i],&amp;rays[i]);">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      handle depth of field, and rayWeight is always 1.0f in perspective camera
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501139596811" ID="ID_1330192585" MODIFIED="1501234599542" TEXT="rays[i].ScaleDifferentials(1.f/sqrtf(sampler-&gt;samplesPerPixel));">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501141739469" ID="ID_1405635601" MODIFIED="1501234599542" TEXT="// Evaluate radiance along camera ray">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#006699" CREATED="1501139612809" ID="ID_444853147" MODIFIED="1501505805968" TEXT="if(rayWeight&gt;0.f)Ls[i]=rayWeight * renderer-&gt;Li(scene,rays[i],&amp;samples[i],rng,arena,&amp;isects[i],&amp;Ts[i]);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="108;-15;" ID="Arrow_ID_303581661" STARTARROW="None" STARTINCLINATION="-581;501;"/>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501139624509" ID="ID_1367874635" MODIFIED="1501234599542" TEXT="else{ &#x9;&#x9;&#x9; Ls[i]=0.f; &#x9;&#x9;&#x9; Ts[i]=1.f; &#x9;&#x9;  }">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501140194604" ID="ID_1464528973" MODIFIED="1501234599542" TEXT="// Report sample results to _Sampler_, add contributions to image">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501139739426" ID="ID_796413279" MODIFIED="1501234599527">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      if(sampler-&gt;ReportResults(samples,rays,Ls,isects,sampleCount)){
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;for(int i=0; i&lt;sampleCount; ++i)camera-&gt;film-&gt;AddSample(samples[i],Ls[i]);
    </p>
    <p style="text-align: left">
      }
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501140187834" ID="ID_1172685064" MODIFIED="1501234599527" TEXT="// Free _MemoryArena_ memory from computing image sample values">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#ff0000" CREATED="1501139819743" ID="ID_30567835" MODIFIED="1501234599527" TEXT="arena.FreeAll();">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501140228254" ID="ID_945831127" MODIFIED="1501234599527" TEXT="// Clean up after _SamplerRendererTask_ is done with its image region">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501139831950" ID="ID_474603338" MODIFIED="1501234599527" TEXT="camera-&gt;film-&gt;UpdateDisplay(sampler-&gt;xPixelStart,sampler-&gt;yPixelStart,sampler-&gt;xPixelEnd+1,sampler-&gt;yPixelEnd+1);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#ff0000" CREATED="1501139851458" ID="ID_93462369" MODIFIED="1501234599511">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      delete sampler;
    </p>
    <p>
      &#xa0;&#xa0;delete[] samples;
    </p>
    <p>
      &#xa0;&#xa0;delete[] rays;
    </p>
    <p>
      &#xa0;&#xa0;delete[] Ls;
    </p>
    <p>
      &#xa0;&#xa0;delete[] Ts;
    </p>
    <p>
      &#xa0;&#xa0;delete[] isects;
    </p>
    <p>
      &#xa0;&#xa0;reporter.Update();
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#ff0000" CREATED="1501137530648" ID="ID_1566791993" MODIFIED="1501234599511">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      &#xa0;&#xa0;WaitForAllTasks();
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;for(uint32_t i=0; i&lt;renderTasks.size(); ++i)delete renderTasks[i];
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;reporter.Done();
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501125672827" ID="ID_854140763" MODIFIED="1501234599495" TEXT="// Clean up after rendering and store final image">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#ff0000" CREATED="1501135770119" ID="ID_1019952528" MODIFIED="1501234599495" TEXT="delete sample;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501135775462" ID="ID_244034339" MODIFIED="1501234599495" TEXT="camera-&gt;film-&gt;WriteImage()">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#990000" CREATED="1501158278298" ID="ID_1991648994" MODIFIED="1506322798359" POSITION="right" TEXT="Spectrum SamplerRenderer::Li(const Scene *scene,const RayDifferential &amp;ray,const Sample *sample,RNG &amp;rng,MemoryArena &amp;arena,Intersection *isect,Spectrum *T)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Renderer
    </p>
  </body>
</html>
</richcontent>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="108;-15;" ID="Arrow_ID_303581661" SOURCE="ID_444853147" STARTARROW="None" STARTINCLINATION="-581;501;"/>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
<node COLOR="#999999" CREATED="1501158303994" ID="ID_1006302197" MODIFIED="1501234461793" TEXT="// Allocate local variables for _isect_ and _T_ if needed">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501158380066" ID="ID_449137693" MODIFIED="1501234461777" TEXT="Spectrum localT;&#xa;if(!T) T=&amp;localT;&#xa;Intersection localIsect;&#xa;if(!isect) isect=&amp;localIsect;&#xa;Spectrum Li=0.f;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501158400066" ID="ID_1034243452" MODIFIED="1501744199051" TEXT="if(scene-&gt;Intersect(ray,isect))">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#990000" CREATED="1501154229887" ID="ID_770764746" MODIFIED="1506322821734" TEXT="Li=surfaceIntegrator-&gt;Li(scene,this,ray,*isect,sample,rng,arena);">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      integrator
    </p>
  </body>
</html>
</richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
<node COLOR="#338800" CREATED="1501154459127" ID="ID_743437454" MODIFIED="1501234461777" TEXT="Spectrum L(0.);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1506322865218" ID="ID_578779989" MODIFIED="1506322884746" TEXT="Vector wo = -ray.d;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501154410199" ID="ID_226975413" MODIFIED="1506322960733" TEXT="// Compute emitted light if ray hit an area light source">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1506322981523" ID="ID_322400861" MODIFIED="1506322982383" TEXT="L += isect.Le(wo);"/>
<node COLOR="#999999" CREATED="1506323001675" ID="ID_660378092" MODIFIED="1506323004525" TEXT="// Evaluate BSDF at hit point">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501154471808" FOLDED="true" ID="ID_212894413" MODIFIED="1501744196212" TEXT="BSDF *bsdf = isect.GetBSDF(ray, arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501156121481" ID="ID_716514095" MODIFIED="1501234461777" TEXT="// Allocate _BSDF_, possibly doing bump mapping with _bumpMap_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501210518505" ID="ID_1890187580" MODIFIED="1501234461777" TEXT=" dg.ComputeDifferentials(ray);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501210524825" FOLDED="true" ID="ID_1608468653" MODIFIED="1501744196205" TEXT="BSDF *bsdf = primitive-&gt;GetBSDF(dg, ObjectToWorld, arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501210582857" ID="ID_871405071" MODIFIED="1501210609577" TEXT="DifferentialGeometry dgs;"/>
<node CREATED="1501210587369" ID="ID_1483967973" MODIFIED="1501210589354" TEXT="shape-&gt;GetShadingGeometry(ObjectToWorld, dg, &amp;dgs);"/>
<node CREATED="1501210591761" FOLDED="true" ID="ID_744835466" MODIFIED="1501744196201" TEXT="return material-&gt;GetBSDF(dg, dgs, arena);">
<node CREATED="1501156134265" ID="ID_611700583" MODIFIED="1501156139501">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      DifferentialGeometry dgs;
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;if (bumpMap)
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;Bump(bumpMap, dgGeom, dgShading, &amp;dgs);
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;else
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;dgs = dgShading;
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;BSDF *bsdf = BSDF_ALLOC(arena, BSDF)(dgs, dgGeom.nn);
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;Spectrum R = Kr-&gt;Evaluate(dgs).Clamp();
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;if (!R.IsBlack())
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;bsdf-&gt;Add(BSDF_ALLOC(arena, SpecularReflection)(R,
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;BSDF_ALLOC(arena, FresnelNoOp)()));
    </p>
    <p style="text-align: left">
      &#xa0;&#xa0;&#xa0;&#xa0;return bsdf;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1501210528938" ID="ID_1007244919" MODIFIED="1501234461777" TEXT="return bsdf;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501154417726" ID="ID_523848725" MODIFIED="1501234461777" TEXT="// Initialize common variables for Whitted integrator">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501154550271" ID="ID_429850703" MODIFIED="1506323024400" TEXT="const Point &amp;p = bsdf-&gt;dgShading.p;&#xa;const Normal &amp;n = bsdf-&gt;dgShading.nn;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501154438079" ID="ID_1606661081" MODIFIED="1506323055100" TEXT="// Compute reflected radiance using diffuse PRT">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#999999" CREATED="1506323067563" ID="ID_374824875" MODIFIED="1506323070061" TEXT="// Project diffuse transfer function at point to SH">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1506323210323" ID="ID_1811550706" MODIFIED="1506323210991" TEXT="Spectrum *c_transfer = arena.Alloc&lt;Spectrum&gt;(SHTerms(lmax));"/>
<node CREATED="1506323217034" ID="ID_112465134" MODIFIED="1506323236760" TEXT="SHComputeDiffuseTransfer(p, Faceforward(n, wo),isect.rayEpsilon, scene, rng, nSamples, lmax,c_transfer);">
<node CREATED="1506324006859" ID="ID_1264353508" MODIFIED="1506324007592" TEXT="for(int i=0; i&lt;SHTerms(lmax); ++i)">
<node CREATED="1506324011794" ID="ID_1778333548" MODIFIED="1506324012200" TEXT="c_transfer[i]=0.f;"/>
</node>
<node COLOR="#338800" CREATED="1506324016586" ID="ID_74876871" MODIFIED="1506324221091" TEXT="uint32_t scramble[2]={rng.RandomUInt(), rng.RandomUInt()};"/>
<node COLOR="#338800" CREATED="1506324020555" ID="ID_1858701225" MODIFIED="1506324223498" TEXT="float *Ylm=ALLOCA(float,SHTerms(lmax));"/>
<node CREATED="1506324027315" ID="ID_182141958" MODIFIED="1506324040631" TEXT="for(int i=0; i&lt;nSamples; ++i)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      // &#25105;&#35273;&#24471;&#19979;&#19968;&#34892;&#30340;nSamples&#24212;&#35813;&#20889;&#25104;2*nSamples&#65292;&#22240;&#20026;for&#24490;&#29615;&#37324;&#38754;&#26159;&#33293;&#36873;&#37319;&#26679;&#65292;&#26377;&#19968;&#21322;&#30340;&#37319;&#26679;&#28857;&#26159;&#34987;&#36807;&#28388;&#25481;&#30340;&#12290;
    </p>
  </body>
</html>
</richcontent>
<node COLOR="#999999" CREATED="1506324048363" ID="ID_1090599837" MODIFIED="1506324050205" TEXT="// Sample _i_th direction and compute estimate for transfer coefficients">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1506324058411" ID="ID_285126402" MODIFIED="1506324106788" TEXT="float u[2];"/>
<node CREATED="1506324062011" ID="ID_1100694129" MODIFIED="1506324063921" TEXT="Sample02(i,scramble,u);"/>
<node COLOR="#338800" CREATED="1506324065755" FOLDED="true" ID="ID_160662933" MODIFIED="1506324285810" TEXT="Vector w=UniformSampleSphere(u[0],u[1]);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1506324251795" ID="ID_539413744" MODIFIED="1506324267084">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      float z=1.f-2.f * u1;
    </p>
    <p>
      float r=sqrtf(max(0.f,1.f-z*z));
    </p>
    <p>
      float phi=2.f * M_PI * u2;
    </p>
    <p>
      float x=r * cosf(phi);
    </p>
    <p>
      float y=r * sinf(phi);
    </p>
    <p>
      return Vector(x,y,z);
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1506324068891" ID="ID_1348280728" MODIFIED="1506324070713" TEXT="float pdf=UniformSpherePdf();">
<node CREATED="1506324304939" ID="ID_295434382" MODIFIED="1506324305856" TEXT="return 1.f/(4.f * M_PI);"/>
</node>
<node CREATED="1506324072947" FOLDED="true" ID="ID_1762858538" MODIFIED="1506326222069" TEXT="if(Dot(w,n)&gt;0.f&amp;&amp;!scene-&gt;IntersectP(Ray(p,w,rayEpsilon)))">
<node COLOR="#999999" CREATED="1506324077491" ID="ID_810249479" MODIFIED="1506324079102" TEXT="// Accumulate contribution of direction $\w{}$ to transfer coefficients">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1506324082490" ID="ID_391366871" MODIFIED="1506324084264" TEXT="SHEvaluate(w,lmax,Ylm);">
<node CREATED="1506324347260" ID="ID_124082744" MODIFIED="1506324356087">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if(lmax&gt;28){
    </p>
    <p>
      &#160;&#160;&#160;&#160;Error(&quot;SHEvaluate() runs out of numerical precision for lmax &gt; 28. &quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&quot;If you need more bands, try recompiling using doubles.&quot;);
    </p>
    <p>
      &#160;&#160;&#160;&#160;exit(1);
    </p>
    <p>
      &#160;&#160;}
    </p>
  </body>
</html>
</richcontent>
</node>
<node COLOR="#999999" CREATED="1506324368042" ID="ID_830540200" MODIFIED="1506324369790" TEXT="// Compute Legendre polynomial values for $\cos\theta$">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1506324373811" ID="ID_941715674" MODIFIED="1506324376274" TEXT="Assert(w.Length()&gt;.995f &amp;&amp; w.Length()&lt;1.005f);"/>
<node CREATED="1506324378331" ID="ID_706422069" MODIFIED="1506324378872" TEXT="legendrep(w.z,lmax,out);"/>
<node COLOR="#999999" CREATED="1506324385466" ID="ID_916401697" MODIFIED="1506324386754" TEXT="// Compute $K_l^m$ coefficients">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1506324390611" ID="ID_1081681306" MODIFIED="1506324409099" TEXT="float *Klm=ALLOCA(float,SHTerms(lmax));"/>
<node CREATED="1506324401019" ID="ID_456707521" MODIFIED="1506324403398">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      for(int l=0; l&lt;=lmax; ++l)
    </p>
    <p>
      &#160;&#160;&#160;&#160;for(int m=-l; m&lt;=l; ++m)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;Klm[SHIndex(l,m)]=K(l,m);
    </p>
  </body>
</html>
</richcontent>
</node>
<node COLOR="#999999" CREATED="1506324418708" ID="ID_865090944" MODIFIED="1506324419710" TEXT=" // Compute $\sin\phi$ and $\cos\phi$ values">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1506324423931" ID="ID_1008020021" MODIFIED="1506324426563" TEXT="float *sins=ALLOCA(float,lmax+1),*coss=ALLOCA(float,lmax+1);"/>
<node COLOR="#338800" CREATED="1506324429828" ID="ID_356861259" MODIFIED="1506324438315" TEXT="float xyLen=sqrtf(max(0.f,1.f-w.z*w.z));"/>
<node CREATED="1506324443740" ID="ID_69714942" MODIFIED="1506324445530" TEXT="if(xyLen==0.f)">
<node CREATED="1506324447947" ID="ID_1759649730" MODIFIED="1506324448288" TEXT="for(int i=0; i&lt;=lmax; ++i) sins[i]=0.f;"/>
<node CREATED="1506324452626" ID="ID_1707228044" MODIFIED="1506324452960" TEXT="for(int i=0; i&lt;=lmax; ++i) coss[i]=1.f;"/>
</node>
<node CREATED="1506324460451" ID="ID_1073251991" MODIFIED="1506324465448" TEXT="else">
<node CREATED="1506324466331" ID="ID_1522029165" MODIFIED="1506324466912" TEXT="sinCosIndexed(w.y/xyLen,w.x/xyLen,lmax+1,sins,coss);"/>
</node>
<node COLOR="#999999" CREATED="1506324486419" ID="ID_400777393" MODIFIED="1506324487677" TEXT="// Apply SH definitions to compute final $(l,m)$ values">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1506324491099" ID="ID_1289114382" MODIFIED="1506324494764" TEXT="static const float sqrt2=sqrtf(2.f);"/>
<node CREATED="1506324512851" ID="ID_1222625812" MODIFIED="1506324515495">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      for(int l=0; l&lt;=lmax; ++l){
    </p>
    <p>
      &#160;&#160;&#160;&#160;for(int m=-l; m&lt;0; ++m){
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;out[SHIndex(l,m)]=sqrt2 * Klm[SHIndex(l,m)]*
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;out[SHIndex(l,-m)]*sins[-m];
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;Assert(!isnan(out[SHIndex(l,m)]));
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;Assert(!isinf(out[SHIndex(l,m)]));
    </p>
    <p>
      &#160;&#160;&#160;&#160;}
    </p>
    <p>
      &#160;&#160;&#160;&#160;out[SHIndex(l,0)]*=Klm[SHIndex(l,0)];
    </p>
    <p>
      &#160;&#160;&#160;&#160;for(int m=1; m&lt;=l; ++m){
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;out[SHIndex(l,m)]*=sqrt2 * Klm[SHIndex(l,m)]*coss[m];
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;Assert(!isnan(out[SHIndex(l,m)]));
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;Assert(!isinf(out[SHIndex(l,m)]));
    </p>
    <p>
      &#160;&#160;&#160;&#160;}
    </p>
    <p>
      &#160;&#160;}
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1506324086034" ID="ID_1120514446" MODIFIED="1506326199691" TEXT="for(int j=0; j&lt;SHTerms(lmax); ++j)">
<node CREATED="1506324091779" ID="ID_761138051" MODIFIED="1506324092370" TEXT="c_transfer[j]+=(Ylm[j]*AbsDot(w,n))/(pdf * nSamples);"/>
</node>
</node>
</node>
</node>
<node COLOR="#999999" CREATED="1506323247363" ID="ID_169425952" MODIFIED="1506323249196" TEXT="// Compute integral of product of incident radiance and transfer function">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1506323253731" ID="ID_290272245" MODIFIED="1506323268443" TEXT="Spectrum Kd = bsdf-&gt;rho(wo, rng, BSDF_ALL_REFLECTION) * INV_PI;"/>
<node COLOR="#338800" CREATED="1506323258402" ID="ID_1562938423" MODIFIED="1506323269323" TEXT="Spectrum Lo = 0.f;"/>
<node COLOR="#999999" CREATED="1501154448519" ID="ID_725044199" MODIFIED="1501234461777" TEXT="// Add contribution of each light source">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501154579016" ID="ID_1169883430" MODIFIED="1506323181960" TEXT="for (int i = 0; i &lt; SHTerms(lmax); ++i)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1506323169163" ID="ID_261917750" MODIFIED="1506323170455" TEXT="Lo += c_in[i] * c_transfer[i];"/>
</node>
<node CREATED="1501154592959" ID="ID_1031088743" MODIFIED="1506323141264" TEXT="return L + Kd * Lo.Clamp()">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501158421945" FOLDED="true" ID="ID_705614495" MODIFIED="1506322786118" TEXT="else">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501158429478" ID="ID_1930260112" MODIFIED="1501234461746" TEXT="// Handle ray that doesn&apos;t intersect any geometry">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501158436610" ID="ID_491317253" MODIFIED="1501234461746" TEXT="for(uint32_t i=0; i&lt;scene-&gt;lights.size(); ++i)&#xa;   Li+=scene-&gt;lights[i]-&gt;Le(ray);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501158455234" FOLDED="true" ID="ID_5168828" MODIFIED="1501744352045" TEXT="Spectrum Lvi=volumeIntegrator-&gt;Li(scene,this,ray,sample,rng,T,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501505841130" ID="ID_1315644671" MODIFIED="1501554332754" TEXT="VolumeRegion *vr=scene-&gt;volumeRegion;"/>
<node COLOR="#338800" CREATED="1501554333384" ID="ID_1270844555" MODIFIED="1501554335638" TEXT="Assert(sample!=NULL);"/>
<node COLOR="#338800" CREATED="1501554321748" ID="ID_1064655232" MODIFIED="1501554324126" TEXT="float t0,t1;"/>
<node CREATED="1501505859650" FOLDED="true" ID="ID_958468324" MODIFIED="1501744196217" TEXT="if(!vr||!vr-&gt;IntersectP(ray,&amp;t0,&amp;t1)||(t1-t0)==0.f)">
<node CREATED="1501554349940" ID="ID_164902455" MODIFIED="1501554351580" TEXT="  *T=Spectrum(1.f);   return 0.f;"/>
</node>
<node COLOR="#999999" CREATED="1501505886281" ID="ID_1469492745" MODIFIED="1501505887543" TEXT="// Do emission-only volume integration in _vr_">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501505893746" ID="ID_699224492" MODIFIED="1501505930090" TEXT="Spectrum Lv(0.);"/>
<node COLOR="#999999" CREATED="1501505899042" ID="ID_936794659" MODIFIED="1501505900822" TEXT="// Prepare for volume integration stepping">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501505911210" ID="ID_1143038255" MODIFIED="1501505926890" TEXT="int nSamples=Ceil2Int((t1-t0)/stepSize);&#xa;float step=(t1-t0)/nSamples;&#xa;Spectrum Tr(1.f);&#xa;Point p=ray(t0),pPrev;&#xa;Vector w=-ray.d;"/>
<node CREATED="1501505936657" ID="ID_360437361" MODIFIED="1501505938296" TEXT="t0+=sample-&gt;oneD[scatterSampleOffset][0]*step;"/>
<node CREATED="1501505945530" ID="ID_1652728775" MODIFIED="1501744340914" TEXT="for(int i=0; i&lt;nSamples; ++i,t0+=step)">
<node COLOR="#999999" CREATED="1501505954281" ID="ID_1490331239" MODIFIED="1501505956357" TEXT="// Advance to sample at _t0_ and update _T_">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501505971937" ID="ID_971115911" MODIFIED="1501505973017" TEXT="pPrev=p;     p=ray(t0);"/>
<node CREATED="1501505992689" ID="ID_492795135" MODIFIED="1501505993576" TEXT=" Ray tauRay(pPrev,p-pPrev,0.f,1.f,ray.time,ray.depth);"/>
<node CREATED="1501506002362" ID="ID_1566568053" MODIFIED="1501506013449" TEXT="Spectrum stepTau=vr-&gt;tau(tauRay,.5f * stepSize,rng.RandomFloat());"/>
<node CREATED="1501506020066" ID="ID_499132131" MODIFIED="1501506021768" TEXT="Tr*=Exp(-stepTau);"/>
<node COLOR="#999999" CREATED="1501505962010" ID="ID_1557069938" MODIFIED="1501505963163" TEXT="// Possibly terminate ray marching if transmittance is small">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501506031394" ID="ID_1706651117" MODIFIED="1501744345011" TEXT="if(Tr.y()&lt;1e-3)">
<node CREATED="1501506040305" ID="ID_1399281766" MODIFIED="1501506041953" TEXT="const float continueProb=.5f;"/>
<node CREATED="1501506058650" ID="ID_1520706702" MODIFIED="1501506063281" TEXT="if(rng.RandomFloat()&gt;continueProb){&#xa;        Tr=0.f;&#xa;        break;&#xa;      }"/>
<node CREATED="1501506072770" ID="ID_902870302" MODIFIED="1501506074592" TEXT="Tr/=continueProb;"/>
</node>
<node COLOR="#999999" CREATED="1501506092633" ID="ID_282597106" MODIFIED="1501506093848" TEXT="// Compute emission-only source term at _p_">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501506099970" ID="ID_1628000046" MODIFIED="1501506101096" TEXT="Lv+=Tr * vr-&gt;Lve(p,w,ray.time);"/>
</node>
<node CREATED="1501506107922" ID="ID_343488757" MODIFIED="1501506109416" TEXT="*T=Tr;   return Lv * step;"/>
</node>
<node CREATED="1501158470298" ID="ID_1170101992" MODIFIED="1501234461730" TEXT="return *T * Li+Lvi;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
</map>
