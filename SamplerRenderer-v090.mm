<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#990000" CREATED="1501122632132" ID="ID_461266390" MODIFIED="1501813610316">
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
      <font size="4"><i>-EmissionIntegrator-</i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-RandomSampler-</i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-PerspectiveCamera-</i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-PointLight-</i></font>
    </p>
    <p style="text-align: center">
      <font size="4"><i>-MirrorMaterial-</i></font>
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501125313702" FOLDED="true" ID="ID_267505771" MODIFIED="1515503239114" POSITION="right" TEXT="void SamplerRenderer::Render(const Scene *scene)">
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
<node CREATED="1501137568065" ID="ID_492310959" MODIFIED="1514377014515" TEXT="tasks[i]-&gt;Run();">
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
<node CREATED="1501158278298" ID="ID_1991648994" MODIFIED="1515502760978" POSITION="right" TEXT="Spectrum SamplerRenderer::Li(const Scene *scene,const RayDifferential &amp;ray,const Sample *sample,RNG &amp;rng,MemoryArena &amp;arena,Intersection *isect,Spectrum *T)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      integrator
    </p>
  </body>
</html></richcontent>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="108;-15;" ID="Arrow_ID_303581661" SOURCE="ID_444853147" STARTARROW="None" STARTINCLINATION="-581;501;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_235931306" SOURCE="ID_1630674246" STARTARROW="None" STARTINCLINATION="65;170;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_1395068675" SOURCE="ID_167951652" STARTARROW="None" STARTINCLINATION="65;170;"/>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<icon BUILTIN="messagebox_warning"/>
<node COLOR="#999999" CREATED="1501158303994" ID="ID_1006302197" MODIFIED="1501234461793" TEXT="// Allocate local variables for _isect_ and _T_ if needed">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501158380066" ID="ID_449137693" MODIFIED="1501234461777" TEXT="Spectrum localT;&#xa;if(!T) T=&amp;localT;&#xa;Intersection localIsect;&#xa;if(!isect) isect=&amp;localIsect;&#xa;Spectrum Li=0.f;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501158400066" ID="ID_1034243452" MODIFIED="1514377040449" TEXT="if(scene-&gt;Intersect(ray,isect))">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501154229887" ID="ID_770764746" MODIFIED="1515550436757" TEXT="Li=surfaceIntegrator-&gt;Li(scene,this,ray,*isect,sample,rng,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501154393999" ID="ID_1769148932" MODIFIED="1501234461777" TEXT="// Compute emitted and reflected light at ray intersection point">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501154459127" ID="ID_743437454" MODIFIED="1501234461777" TEXT="Spectrum L(0.);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501154410199" ID="ID_226975413" MODIFIED="1501234461777" TEXT="// Evaluate BSDF at hit point">
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
<node COLOR="#338800" CREATED="1501154550271" ID="ID_429850703" MODIFIED="1501234461777" TEXT="const Point &amp;p = bsdf-&gt;dgShading.p;&#xa;const Normal &amp;n = bsdf-&gt;dgShading.nn;&#xa;Vector wo = -ray.d;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501154438079" ID="ID_1606661081" MODIFIED="1501234461777" TEXT="// Compute emitted light if ray hit an area light source">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501154568303" ID="ID_915802934" MODIFIED="1502104279678" TEXT="L += isect.Le(wo);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501210768474" ID="ID_1475449129" MODIFIED="1501234461777" TEXT="const AreaLight *area = primitive-&gt;GetAreaLight();">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501210777345" ID="ID_948964523" MODIFIED="1501234461777" TEXT="return area ? area-&gt;L(dg.p, dg.nn, wo) : Spectrum(0.);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501154448519" ID="ID_725044199" MODIFIED="1501234461777" TEXT="// Add contribution of each light source">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501154579016" ID="ID_1169883430" MODIFIED="1514377186850" TEXT="for (uint32_t i = 0; i &lt; scene-&gt;lights.size(); ++i) ">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501154624719" ID="ID_276644104" MODIFIED="1501234461777" TEXT="Vector wi;float pdf;VisibilityTester visibility;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501154657128" ID="ID_1501515829" MODIFIED="1501831507039" TEXT="Spectrum Li = scene-&gt;lights[i]-&gt;Sample_L(p, isect.rayEpsilon,LightSample(rng), ray.time, &amp;wi, &amp;pdf, &amp;visibility);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501155470552" ID="ID_1861122130" MODIFIED="1501234461777">
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
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501154669823" ID="ID_1227897206" MODIFIED="1501234461777" TEXT="if (Li.IsBlack() || pdf == 0.f) continue;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501154674511" ID="ID_1574574756" MODIFIED="1502195114219" TEXT="Spectrum f = bsdf-&gt;f(wo, wi);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501154682672" ID="ID_995696333" MODIFIED="1501831510070" TEXT="if (!f.IsBlack() &amp;&amp; visibility.Unoccluded(scene))">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501154688623" ID="ID_777834603" MODIFIED="1501234461762" TEXT="L += f * Li * AbsDot(wi, n) *visibility.Transmittance(scene, renderer,sample, rng, arena) / pdf;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501154592959" ID="ID_1031088743" MODIFIED="1501744366426" TEXT="if (ray.depth + 1 &lt; maxDepth)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501154727263" ID="ID_976006635" MODIFIED="1501234461762" TEXT=" // Trace rays for specular reflection and refraction">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501154733968" FOLDED="true" ID="ID_1641369673" MODIFIED="1515550537999" TEXT="L += SpecularReflect(ray, bsdf, rng, isect, renderer, scene, sample,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
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
</html></richcontent>
</node>
<node CREATED="1501161178076" ID="ID_796875059" MODIFIED="1501161188746" TEXT="Spectrum f=bsdf-&gt;Sample_f(wo,&amp;wi,BSDFSample(rng),&amp;pdf, BxDFType(BSDF_REFLECTION|BSDF_SPECULAR));"/>
<node COLOR="#338800" CREATED="1501161204037" ID="ID_345290455" MODIFIED="1501161206621" TEXT=" Spectrum L=0.f;"/>
<node CREATED="1501161214524" ID="ID_1619390903" MODIFIED="1503314333330" TEXT="if(pdf&gt;0.f&amp;&amp;!f.IsBlack()&amp;&amp;AbsDot(wi,n)!=0.f)">
<node COLOR="#999999" CREATED="1501161220893" ID="ID_224369119" MODIFIED="1501161223421" TEXT="// Compute ray differential _rd_ for specular reflection">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501161230212" ID="ID_1642119104" MODIFIED="1501161230434" TEXT="RayDifferential rd(p,wi,ray,isect.rayEpsilon);"/>
<node CREATED="1501161239197" ID="ID_1712290826" MODIFIED="1514377149048" TEXT="if(ray.hasDifferentials)">
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
</html></richcontent>
</node>
</node>
<node COLOR="#006699" CREATED="1501161308389" ID="ID_1630674246" MODIFIED="1501505770858" TEXT="Spectrum Li=renderer-&gt;Li(scene,rd,sample,rng,arena);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_235931306" STARTARROW="None" STARTINCLINATION="65;170;"/>
</node>
<node CREATED="1501161325213" ID="ID_545376017" MODIFIED="1501161325418" TEXT="L=f * Li * AbsDot(wi,n)/pdf;"/>
</node>
<node CREATED="1501161332293" ID="ID_957208511" MODIFIED="1501161332556" TEXT="return L;"/>
</node>
<node CREATED="1501154743279" FOLDED="true" ID="ID_206889962" MODIFIED="1515550560103" TEXT="L += SpecularTransmit(ray, bsdf, rng, isect, renderer, scene, sample,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
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
</html></richcontent>
</node>
<node CREATED="1501161579029" ID="ID_351934902" MODIFIED="1501161607102" TEXT="Spectrum f=bsdf-&gt;Sample_f(wo,&amp;wi,BSDFSample(rng),&amp;pdf,&#xa;BxDFType(BSDF_TRANSMISSION|BSDF_SPECULAR));"/>
<node COLOR="#338800" CREATED="1501161204037" ID="ID_1713033387" MODIFIED="1501161206621" TEXT=" Spectrum L=0.f;"/>
<node CREATED="1501161214524" ID="ID_1805254364" MODIFIED="1515550545521" TEXT="if(pdf&gt;0.f&amp;&amp;!f.IsBlack()&amp;&amp;AbsDot(wi,n)!=0.f)">
<node COLOR="#999999" CREATED="1501161220893" ID="ID_912661433" MODIFIED="1501161223421" TEXT="// Compute ray differential _rd_ for specular reflection">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501161230212" ID="ID_1960747999" MODIFIED="1501161230434" TEXT="RayDifferential rd(p,wi,ray,isect.rayEpsilon);"/>
<node CREATED="1501161239197" ID="ID_1615077168" MODIFIED="1514377176987" TEXT="if(ray.hasDifferentials)">
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
</html></richcontent>
</node>
</node>
<node COLOR="#006699" CREATED="1501161308389" ID="ID_167951652" MODIFIED="1501505763089" TEXT="Spectrum Li=renderer-&gt;Li(scene,rd,sample,rng,arena);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_1395068675" STARTARROW="None" STARTINCLINATION="65;170;"/>
</node>
<node CREATED="1501161325213" ID="ID_117005457" MODIFIED="1501161325418" TEXT="L=f * Li * AbsDot(wi,n)/pdf;"/>
</node>
<node CREATED="1501161332293" ID="ID_1252963802" MODIFIED="1501161332556" TEXT="return L;"/>
</node>
</node>
<node CREATED="1501154598287" ID="ID_1802163961" MODIFIED="1501234461762" TEXT="return L;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501158421945" ID="ID_705614495" MODIFIED="1501744199056" TEXT="else">
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
