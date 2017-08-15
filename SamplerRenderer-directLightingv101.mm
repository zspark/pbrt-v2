<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#990000" CREATED="1501122632132" ID="ID_461266390" MODIFIED="1501829839379">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: center">
      <font size="5">SamplerRenderer </font>
    </p>
    <p style="text-align: center">
      <i><font size="4">-DirectLightingIntegrator- </font></i>
    </p>
    <p style="text-align: center">
      <i><font size="4">-EmissionIntegrator-</font></i>
    </p>
    <p style="text-align: center">
      <i><font size="4">-StratifiedSampler-</font></i>
    </p>
    <p style="text-align: center">
      <i><font size="4">-PerspectiveCamera-</font></i>
    </p>
    <p style="text-align: center">
      <i><font size="4">-PointLight-</font></i>
    </p>
    <p style="text-align: center">
      <i><font size="4">-MirrorMaterial-</font></i>
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501125313702" ID="ID_267505771" MODIFIED="1501831832036" POSITION="right" TEXT="void SamplerRenderer::Render(const Scene *scene)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501125647527" ID="ID_343582769" MODIFIED="1501829839379" TEXT="// Allow integrators to do preprocessing for the scene">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501125683507" ID="ID_609225841" MODIFIED="1501829839379" TEXT="surfaceIntegrator-&gt;Preprocess(scene,camera,this);">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      DirectLightIntegrator has no logic
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501125697803" ID="ID_718690332" MODIFIED="1501829839379" TEXT="volumeIntegrator-&gt;Preprocess(scene,camera,this);">
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
<node COLOR="#999999" CREATED="1501125657160" ID="ID_1249866523" MODIFIED="1501829839379" TEXT="// Allocate and initialize _sample_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501127505346" ID="ID_1043405659" MODIFIED="1502197429126" TEXT="Sample *sample=new Sample(sampler,surfaceIntegrator,volumeIntegrator,scene);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501127733431" ID="ID_1975506111" MODIFIED="1502197431698" TEXT="if(surf) surf-&gt;RequestSamples(sampler,this,scene);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501812211036" ID="ID_101059767" MODIFIED="1501829839379" TEXT="if(strategy==SAMPLE_ALL_UNIFORM)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501812220041" ID="ID_158942846" MODIFIED="1501829839379" TEXT=" // Allocate and request samples for sampling all lights">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501812228934" ID="ID_313191962" MODIFIED="1501829839379" TEXT="uint32_t nLights=scene-&gt;lights.size();">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501812234839" ID="ID_1565825226" MODIFIED="1501829839379" TEXT="lightSampleOffsets=new LightSampleOffsets[nLights];">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501812240884" ID="ID_1383448782" MODIFIED="1501829839379" TEXT="bsdfSampleOffsets=new BSDFSampleOffsets[nLights];">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501812246448" ID="ID_742805175" MODIFIED="1501829839379" TEXT=" for(uint32_t i=0; i&lt;nLights; ++i)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501812253574" ID="ID_389580767" MODIFIED="1501829839379" TEXT="const Light *light=scene-&gt;lights[i]; ">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501812257919" ID="ID_1195517295" MODIFIED="1501829839379" TEXT="int nSamples=light-&gt;nSamples;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501812262076" ID="ID_632428966" MODIFIED="1501829839379" TEXT="if(sampler) nSamples=sampler-&gt;RoundSize(nSamples);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501812270913" ID="ID_709181903" MODIFIED="1501829839379" TEXT="lightSampleOffsets[i]=LightSampleOffsets(nSamples,sample);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501812275414" ID="ID_622060402" MODIFIED="1501829839379" TEXT="bsdfSampleOffsets[i]=BSDFSampleOffsets(nSamples,sample);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#338800" CREATED="1501812284258" ID="ID_805107405" MODIFIED="1501829839379" TEXT="lightNumOffset=-1;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501812297823" ID="ID_1208060067" MODIFIED="1501829839379" TEXT="else">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501812300436" ID="ID_194265393" MODIFIED="1501829839379" TEXT="// Allocate and request samples for sampling one light">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501812306397" ID="ID_1380858672" MODIFIED="1501829839379" TEXT="lightSampleOffsets=new LightSampleOffsets[1];">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501812310572" ID="ID_988197245" MODIFIED="1501829839378" TEXT="lightSampleOffsets[0]=LightSampleOffsets(1,sample); ">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501812501128" ID="ID_1219475745" MODIFIED="1501829839378" TEXT="nSamples=count;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501812506643" ID="ID_368601498" MODIFIED="1501829839378" TEXT="componentOffset=sample-&gt;Add1D(nSamples);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501812511939" ID="ID_1851912916" MODIFIED="1501829839378" TEXT="posOffset=sample-&gt;Add2D(nSamples);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501812314655" ID="ID_1685675698" MODIFIED="1501829839378" TEXT="lightNumOffset=sample-&gt;Add1D(1);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501812318126" ID="ID_629899665" MODIFIED="1501829839378" TEXT="bsdfSampleOffsets=new BSDFSampleOffsets[1];">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501812321940" ID="ID_632930082" MODIFIED="1501829839378" TEXT="bsdfSampleOffsets[0]=BSDFSampleOffsets(1,sample);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501127739647" ID="ID_980656403" MODIFIED="1501829839378" TEXT="if(vol)  vol-&gt;RequestSamples(sampler,this,scene);">
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
<node CREATED="1501127746254" ID="ID_1694085567" MODIFIED="1501829839378" TEXT="AllocateSampleMemory()">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501125667308" ID="ID_1657126964" MODIFIED="1501829839378" TEXT="// Compute number of _SamplerRendererTask_s to create for rendering">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501135613455" ID="ID_780106377" MODIFIED="1501829839378">
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
<node CREATED="1501147689556" ID="ID_1509539625" MODIFIED="1501829839377" TEXT="vector&lt;Task *&gt; renderTasks;&#xa;for(int i=0; i&lt;nTasks; ++i)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501147671844" ID="ID_1898270116" MODIFIED="1501829839376" TEXT="renderTasks.push_back(new SamplerRendererTask(scene,this,camera,reporter,sampler,sample,visualizeObjectIds,nTasks-1-i,nTasks));">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501137545998" ID="ID_1937136649" MODIFIED="1501829839376" TEXT="&#xa0;&#xa0;EnqueueTasks(renderTasks);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501137568065" ID="ID_492310959" MODIFIED="1501829839376" TEXT="tasks[i]-&gt;Run();">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501139896230" ID="ID_595909183" MODIFIED="1501829839376" TEXT="// Get sub-_Sampler_ for _SamplerRendererTask_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501137631073" ID="ID_1854590979" MODIFIED="1501829839376" TEXT="Sampler *sampler=mainSampler-&gt;GetSubSampler(taskNum,taskCount);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501140270903" ID="ID_797356880" MODIFIED="1501829839376" TEXT="// Declare local variables used for rendering loop">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501140278547" ID="ID_1276042780" MODIFIED="1501829839376" TEXT="MemoryArena arena;&#xa;RNG rng(taskNum);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501139915122" ID="ID_112811044" MODIFIED="1501829839375" TEXT="// Allocate space for samples and intersections">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501139502103" ID="ID_236401151" MODIFIED="1501829839374">
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
      MaximumSampleCount() in StratifiedSampler returns&#160;&#19968;&#20010;&#20687;&#32032;&#20013;&#25152;&#26377;&#30340;&#37319;&#26679;&#28857;&#12290;
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501139940550" ID="ID_1293801259" MODIFIED="1501829839374" TEXT="// Get samples from _Sampler_ and update image">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501814476241" ID="ID_629848443" MODIFIED="1502197473579" TEXT="int sampleCount=sampler-&gt;GetMoreSamples(samples,rng);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501814524350" ID="ID_1180328839" MODIFIED="1501814525677" TEXT="if(yPos==yPixelEnd) return 0;"/>
<node COLOR="#338800" CREATED="1501814530223" ID="ID_1159445154" MODIFIED="1501814564460" TEXT="int nSamples=xPixelSamples * yPixelSamples;"/>
<node COLOR="#999999" CREATED="1501814539141" ID="ID_1213908766" MODIFIED="1501814540164" TEXT="// Generate stratified camera samples for _(xPos, yPos)_">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#999999" CREATED="1501814544931" ID="ID_1132180571" MODIFIED="1501814545517" TEXT="// Generate initial stratified samples into _sampleBuf_ memory">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501814551065" ID="ID_1224074050" MODIFIED="1501814563485" TEXT="float *bufp=sampleBuf;&#xa;float *imageSamples=bufp; bufp+=2*nSamples;&#xa;float *lensSamples=bufp;  bufp+=2*nSamples;&#xa;float *timeSamples=bufp;"/>
<node CREATED="1501814573923" ID="ID_139591273" MODIFIED="1501814580697" TEXT="StratifiedSample2D(imageSamples,xPixelSamples,yPixelSamples,rng,jitterSamples);"/>
<node CREATED="1501814586025" ID="ID_789386863" MODIFIED="1501814590269" TEXT="StratifiedSample2D(lensSamples,xPixelSamples,yPixelSamples,rng,jitterSamples);"/>
<node CREATED="1501814594599" ID="ID_98112746" MODIFIED="1501814598407" TEXT="StratifiedSample1D(timeSamples,xPixelSamples * yPixelSamples,rng,jitterSamples);"/>
<node COLOR="#999999" CREATED="1501814604388" ID="ID_419531991" MODIFIED="1501814605240" TEXT="// Shift stratified image samples to pixel coordinates">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501814610038" ID="ID_374363513" MODIFIED="1501814613738" TEXT="for(int o=0; o&lt;2*xPixelSamples * yPixelSamples; o+=2)">
<node CREATED="1501814618848" ID="ID_1996211313" MODIFIED="1501814619364" TEXT="imageSamples[o]+=xPos;"/>
<node CREATED="1501814623413" ID="ID_1739541350" MODIFIED="1501814623585" TEXT="imageSamples[o+1]+=yPos;"/>
</node>
<node COLOR="#999999" CREATED="1501814628600" ID="ID_164004235" MODIFIED="1501814629560" TEXT="// Decorrelate sample dimensions">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501814634278" ID="ID_330524849" MODIFIED="1501814634638" TEXT="Shuffle(lensSamples,xPixelSamples*yPixelSamples,2,rng);"/>
<node CREATED="1501814638358" ID="ID_1722108463" MODIFIED="1501814639890" TEXT="Shuffle(timeSamples,xPixelSamples*yPixelSamples,1,rng);"/>
<node COLOR="#999999" CREATED="1501814644779" ID="ID_1889807903" MODIFIED="1501814645256" TEXT="// Initialize stratified _samples_ with sample values">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501814650385" ID="ID_583799498" MODIFIED="1501814651740" TEXT="for(int i=0; i&lt;nSamples; ++i)">
<node CREATED="1501814657911" ID="ID_1683706298" MODIFIED="1501814665829" TEXT="samples[i].imageX=imageSamples[2*i];&#xa;samples[i].imageY=imageSamples[2*i+1];&#xa;samples[i].lensU=lensSamples[2*i];&#xa;samples[i].lensV=lensSamples[2*i+1];&#xa;samples[i].time=Lerp(timeSamples[i],shutterOpen,shutterClose);"/>
<node COLOR="#999999" CREATED="1501814674011" ID="ID_705741846" MODIFIED="1501814675003" TEXT="// Generate stratified samples for integrators">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501814679348" ID="ID_429049018" MODIFIED="1501814681707" TEXT="for(uint32_t j=0; j&lt;samples[i].n1D.size(); ++j)">
<node CREATED="1501814684508" ID="ID_391293012" MODIFIED="1501814684805" TEXT="LatinHypercube(samples[i].oneD[j],samples[i].n1D[j],1,rng);"/>
</node>
<node CREATED="1501814689711" ID="ID_1307489021" MODIFIED="1501814690304" TEXT="for(uint32_t j=0; j&lt;samples[i].n2D.size(); ++j)">
<node CREATED="1501814695007" ID="ID_1808932287" MODIFIED="1501814696006" TEXT="LatinHypercube(samples[i].twoD[j],samples[i].n2D[j],2,rng);"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501814920062" ID="ID_328918779" MODIFIED="1501814920710" TEXT="// Advance to next pixel for stratified sampling">
<font NAME="SansSerif" SIZE="10"/>
</node>
<node CREATED="1501814926380" ID="ID_645536638" MODIFIED="1501814926757" TEXT="if(++xPos==xPixelEnd">
<node CREATED="1501814931693" ID="ID_96744313" MODIFIED="1501814939867" TEXT="xPos=xPixelStart;&#xa;++yPos;"/>
</node>
<node CREATED="1501814944604" ID="ID_1370988280" MODIFIED="1501814944792" TEXT="return nSamples;"/>
</node>
<node COLOR="#006699" CREATED="1501139553154" ID="ID_1162917260" MODIFIED="1501829839374">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      while(sampleCount&gt;0)
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501140213465" ID="ID_40415666" MODIFIED="1501829839374" TEXT="// Generate camera rays and compute radiance along rays">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501139569878" ID="ID_1174461792" MODIFIED="1501829839374" TEXT="for(int i=0; i&lt;sampleCount; ++i)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501141722855" ID="ID_905670039" MODIFIED="1501829839373" TEXT="// Find camera ray for _sample[i]_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501139585509" ID="ID_1836136186" MODIFIED="1501829839373" TEXT="float rayWeight=camera-&gt;GenerateRayDifferential(samples[i],&amp;rays[i]);">
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
<node CREATED="1501139596811" ID="ID_1330192585" MODIFIED="1501829839373" TEXT="rays[i].ScaleDifferentials(1.f/sqrtf(sampler-&gt;samplesPerPixel));">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501141739469" ID="ID_1405635601" MODIFIED="1501829839373" TEXT="// Evaluate radiance along camera ray">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#006699" CREATED="1501139612809" ID="ID_444853147" MODIFIED="1501829839372" TEXT="if(rayWeight&gt;0.f)Ls[i]=rayWeight * renderer-&gt;Li(scene,rays[i],&amp;samples[i],rng,arena,&amp;isects[i],&amp;Ts[i]);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="108;-15;" ID="Arrow_ID_303581661" STARTARROW="None" STARTINCLINATION="-581;501;"/>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501139624509" ID="ID_1367874635" MODIFIED="1501829839372" TEXT="else{ &#x9;&#x9;&#x9; Ls[i]=0.f; &#x9;&#x9;&#x9; Ts[i]=1.f; &#x9;&#x9;  }">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501140194604" ID="ID_1464528973" MODIFIED="1501829839372" TEXT="// Report sample results to _Sampler_, add contributions to image">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501139739426" ID="ID_796413279" MODIFIED="1501829839371">
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
<node COLOR="#999999" CREATED="1501140187834" ID="ID_1172685064" MODIFIED="1501829839371" TEXT="// Free _MemoryArena_ memory from computing image sample values">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#ff0000" CREATED="1501139819743" ID="ID_30567835" MODIFIED="1501829839371" TEXT="arena.FreeAll();">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501814486902" ID="ID_1137361866" MODIFIED="1501829839371" TEXT="sampleCount=sampler-&gt;GetMoreSamples(samples,rng);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501140228254" ID="ID_945831127" MODIFIED="1501829839371" TEXT="// Clean up after _SamplerRendererTask_ is done with its image region">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501139831950" ID="ID_474603338" MODIFIED="1501829839369" TEXT="camera-&gt;film-&gt;UpdateDisplay(sampler-&gt;xPixelStart,sampler-&gt;yPixelStart,sampler-&gt;xPixelEnd+1,sampler-&gt;yPixelEnd+1);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#ff0000" CREATED="1501139851458" ID="ID_93462369" MODIFIED="1501829839368">
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
<node COLOR="#ff0000" CREATED="1501137530648" ID="ID_1566791993" MODIFIED="1501829839367">
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
<node COLOR="#999999" CREATED="1501125672827" ID="ID_854140763" MODIFIED="1501829839367" TEXT="// Clean up after rendering and store final image">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#ff0000" CREATED="1501135770119" ID="ID_1019952528" MODIFIED="1501829839367" TEXT="delete sample;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501135775462" ID="ID_244034339" MODIFIED="1501829839367" TEXT="camera-&gt;film-&gt;WriteImage()">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#006699" CREATED="1501158278298" ID="ID_1991648994" MODIFIED="1502104115626" POSITION="right" TEXT="Spectrum SamplerRenderer::Li(const Scene *scene,const RayDifferential &amp;ray,const Sample *sample,RNG &amp;rng,MemoryArena &amp;arena,Intersection *isect,Spectrum *T)">
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="108;-15;" ID="Arrow_ID_303581661" SOURCE="ID_444853147" STARTARROW="None" STARTINCLINATION="-581;501;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_235931306" SOURCE="ID_1630674246" STARTARROW="None" STARTINCLINATION="65;170;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_1395068675" SOURCE="ID_167951652" STARTARROW="None" STARTINCLINATION="65;170;"/>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501158303994" ID="ID_1006302197" MODIFIED="1501829839366" TEXT="// Allocate local variables for _isect_ and _T_ if needed">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501158380066" ID="ID_449137693" MODIFIED="1501829839364" TEXT="Spectrum localT;&#xa;if(!T) T=&amp;localT;&#xa;Intersection localIsect;&#xa;if(!isect) isect=&amp;localIsect;&#xa;Spectrum Li=0.f;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501158400066" ID="ID_1034243452" MODIFIED="1501829839364" TEXT="if(scene-&gt;Intersect(ray,isect))">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501154229887" ID="ID_770764746" MODIFIED="1502197375641" TEXT="Li=surfaceIntegrator-&gt;Li(scene,this,ray,*isect,sample,rng,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501154459127" ID="ID_743437454" MODIFIED="1501829839364" TEXT="Spectrum L(0.);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501154410199" ID="ID_226975413" MODIFIED="1501829839364" TEXT="// Evaluate BSDF at hit point">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501154471808" ID="ID_212894413" MODIFIED="1502197230010" TEXT="BSDF *bsdf = isect.GetBSDF(ray, arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501156121481" ID="ID_716514095" MODIFIED="1501234461777" TEXT="// Allocate _BSDF_, possibly doing bump mapping with _bumpMap_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501210518505" ID="ID_1890187580" MODIFIED="1501234461777" TEXT=" dg.ComputeDifferentials(ray);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501210524825" ID="ID_1608468653" MODIFIED="1502197232655" TEXT="BSDF *bsdf = primitive-&gt;GetBSDF(dg, ObjectToWorld, arena);">
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
<node COLOR="#338800" CREATED="1501154550271" ID="ID_429850703" MODIFIED="1501829839362" TEXT="const Point &amp;p = bsdf-&gt;dgShading.p;&#xa;const Normal &amp;n = bsdf-&gt;dgShading.nn;&#xa;Vector wo = -ray.d;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501154438079" ID="ID_1606661081" MODIFIED="1501829839362" TEXT="// Compute emitted light if ray hit an area light source">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501154568303" ID="ID_915802934" MODIFIED="1501829839362" TEXT="L += isect.Le(wo);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501210768474" ID="ID_1475449129" MODIFIED="1501829839362" TEXT="const AreaLight *area = primitive-&gt;GetAreaLight();">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501210777345" ID="ID_948964523" MODIFIED="1501829839362" TEXT="return area ? area-&gt;L(dg.p, dg.nn, wo) : Spectrum(0.);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501154448519" ID="ID_725044199" MODIFIED="1501829839362" TEXT="// Compute direct lighting for _DirectLightingIntegrator_ integrator">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501817680500" ID="ID_1702740476" MODIFIED="1502104284968" TEXT="if(scene-&gt;lights.size()&gt;0)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501817696403" ID="ID_1702746994" MODIFIED="1501829839362" TEXT=" // Apply direct lighting strategy">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501817707200" ID="ID_1642923554" MODIFIED="1502197256198" TEXT="switch(strategy)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501817714009" FOLDED="true" ID="ID_1290193181" MODIFIED="1502197258297" TEXT="case SAMPLE_ALL_UNIFORM: ">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#006699" CREATED="1501817723970" ID="ID_434151811" MODIFIED="1501829839361" TEXT="L+=UniformSampleAllLights(scene,renderer,arena,p,n,wo, isect.rayEpsilon,ray.time,bsdf,sample,rng, lightSampleOffsets,bsdfSampleOffsets);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501817756072" ID="ID_1030886923" MODIFIED="1501829839360" TEXT="break; ">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501817761555" ID="ID_1725094209" MODIFIED="1501829839360" TEXT="case SAMPLE_ONE_UNIFORM:">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#006699" CREATED="1501817767474" ID="ID_1930341964" MODIFIED="1502104347799" TEXT="L+=UniformSampleOneLight(scene,renderer,arena,p,n,wo,isect.rayEpsilon,ray.time,bsdf,sample,rng,lightNumOffset,lightSampleOffsets,bsdfSampleOffsets);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501818933894" ID="ID_1720509460" MODIFIED="1501829839359" TEXT="// Randomly choose a single light to sample, _light_">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501818942551" ID="ID_1386063397" MODIFIED="1501829839359" TEXT="int nLights=int(scene-&gt;lights.size());">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501818948758" ID="ID_1492094927" MODIFIED="1501829839359" TEXT="if(nLights==0) return Spectrum(0.);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501818953254" ID="ID_1355700237" MODIFIED="1501829839359" TEXT="int lightNum;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501818958558" ID="ID_631128074" MODIFIED="1501829839359" TEXT="if(lightNumOffset!=-1)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501818964623" ID="ID_1764351275" MODIFIED="1501829839359" TEXT="lightNum=Floor2Int(sample-&gt;oneD[lightNumOffset][0]*nLights);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501819014615" ID="ID_1179715868" MODIFIED="1501829839359" TEXT="else">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501819017047" ID="ID_642160129" MODIFIED="1501829839359" TEXT="lightNum=Floor2Int(rng.RandomFloat() * nLights);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501819023567" ID="ID_1962718561" MODIFIED="1501829839359" TEXT="lightNum=min(lightNum,nLights-1);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501819032791" ID="ID_618045612" MODIFIED="1501829839359" TEXT="Light *light=scene-&gt;lights[lightNum];">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501819039558" ID="ID_334301509" MODIFIED="1501829839359" TEXT="// Initialize light and bsdf samples for single light sample">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501819043774" ID="ID_1512155912" MODIFIED="1501829839359" TEXT="LightSample lightSample;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501819049407" ID="ID_74177942" MODIFIED="1501829839358" TEXT="BSDFSample bsdfSample;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501819055622" ID="ID_114398511" MODIFIED="1501829839358" TEXT="if(lightSampleOffset!=NULL &amp;&amp; bsdfSampleOffset!=NULL)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501819060918" ID="ID_1067580832" MODIFIED="1501829839358" TEXT="lightSample=LightSample(sample,*lightSampleOffset,0);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501819065463" ID="ID_1640281152" MODIFIED="1501829839358" TEXT="bsdfSample=BSDFSample(sample,*bsdfSampleOffset,0);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501819069983" ID="ID_1321754762" MODIFIED="1501829839358" TEXT="else">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501819073231" ID="ID_1586162667" MODIFIED="1501829839358" TEXT="lightSample=LightSample(rng);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501819078014" ID="ID_1669311165" MODIFIED="1501829839358" TEXT="bsdfSample=BSDFSample(rng);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#006699" CREATED="1501819084334" FOLDED="true" ID="ID_1756847472" MODIFIED="1502104350686" TEXT="return (float)nLights * EstimateDirect(scene,renderer,arena,light,p,n,wo,rayEpsilon,time,bsdf,rng,lightSample,bsdfSample,BxDFType(BSDF_ALL &amp; ~BSDF_SPECULAR));">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501828302798" ID="ID_752035083" MODIFIED="1501829839357" TEXT=" Spectrum Ld(0.);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#999999" CREATED="1501828310277" ID="ID_1240138065" MODIFIED="1501829839357" TEXT="// Sample light source with multiple importance sampling">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501828317598" ID="ID_982027735" MODIFIED="1501829839355" TEXT="Vector wi;&#xa;float lightPdf,bsdfPdf;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501828332222" ID="ID_64698026" MODIFIED="1501829839355" TEXT="VisibilityTester visibility;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828340773" ID="ID_1741839578" MODIFIED="1501829839355" TEXT="Spectrum Li=light-&gt;Sample_L(p,rayEpsilon,lightSample,time,&amp;wi,&amp;lightPdf,&amp;visibility);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828361965" ID="ID_834741231" MODIFIED="1501829839355" TEXT="if(lightPdf&gt;0.&amp;&amp;!Li.IsBlack())">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501828387902" ID="ID_896602142" MODIFIED="1501829839355" TEXT="Spectrum f=bsdf-&gt;f(wo,wi,flags);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828395989" ID="ID_349567784" MODIFIED="1501829839354" TEXT="if(!f.IsBlack()&amp;&amp;visibility.Unoccluded(scene))">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501828404221" ID="ID_15452538" MODIFIED="1501829839354" TEXT="// Add light&apos;s contribution to reflected radiance">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501828405792" ID="ID_1751853764" MODIFIED="1501829839354" TEXT="Li*=visibility.Transmittance(scene,renderer,NULL,rng,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828439598" ID="ID_1764587722" MODIFIED="1501829839354" TEXT="if(light-&gt;IsDeltaLight())">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501828445172" ID="ID_136618695" MODIFIED="1501829839354" TEXT="Ld+=f * Li * (AbsDot(wi,n)/lightPdf);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501828450262" ID="ID_68131182" MODIFIED="1501829839354" TEXT="else">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501828452197" ID="ID_812197317" MODIFIED="1501829839354" TEXT="bsdfPdf=bsdf-&gt;Pdf(wo,wi,flags);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828456846" ID="ID_1304866960" MODIFIED="1501829839354" TEXT="float weight=PowerHeuristic(1,lightPdf,1,bsdfPdf);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828460814" ID="ID_1180894610" MODIFIED="1501829839354" TEXT="Ld+=f * Li * (AbsDot(wi,n) * weight/lightPdf);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#999999" CREATED="1501828473054" ID="ID_262079992" MODIFIED="1501829839354" TEXT="// Sample BSDF with multiple importance sampling">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501828481180" ID="ID_1524815220" MODIFIED="1501829839354" TEXT="if(!light-&gt;IsDeltaLight())">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501828493941" ID="ID_1956284976" MODIFIED="1501829839354" TEXT="BxDFType sampledType;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828500605" ID="ID_292941290" MODIFIED="1501829839354" TEXT="Spectrum f=bsdf-&gt;Sample_f(wo,&amp;wi,bsdfSample,&amp;bsdfPdf,flags,&amp;sampledType);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828520941" ID="ID_1985989372" MODIFIED="1501829839354" TEXT="if(!f.IsBlack()&amp;&amp;bsdfPdf&gt;0.)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501828525654" ID="ID_1420214827" MODIFIED="1501829839354" TEXT="float weight=1.f;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828532278" ID="ID_1984684879" MODIFIED="1501829839354" TEXT="if(!(sampledType &amp; BSDF_SPECULAR))">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501828538701" ID="ID_50068228" MODIFIED="1501829839353" TEXT="lightPdf=light-&gt;Pdf(p,wi);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828543158" ID="ID_646007973" MODIFIED="1501829839353" TEXT="if(lightPdf==0.)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501828547894" ID="ID_1627326355" MODIFIED="1501829839353" TEXT="return Ld;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501828553094" ID="ID_648255437" MODIFIED="1501829839353" TEXT="weight=PowerHeuristic(1,bsdfPdf,1,lightPdf);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#999999" CREATED="1501828561566" ID="ID_1099157853" MODIFIED="1501829839353" TEXT="// Add light contribution from BSDF sampling">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node COLOR="#338800" CREATED="1501828568525" ID="ID_511030042" MODIFIED="1501829839353" TEXT="Intersection lightIsect;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501828575013" ID="ID_1979809786" MODIFIED="1501829839353" TEXT="Spectrum Li(0.f);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501828579606" ID="ID_638288389" MODIFIED="1501829839353" TEXT="RayDifferential ray(p,wi,rayEpsilon,INFINITY,time);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828587390" ID="ID_92840629" MODIFIED="1501829839353" TEXT="if(scene-&gt;Intersect(ray,&amp;lightIsect))">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501828592974" ID="ID_1113741452" MODIFIED="1501829839353" TEXT="if(lightIsect.primitive-&gt;GetAreaLight()==light) ">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501828597802" ID="ID_1086115287" MODIFIED="1501829839353" TEXT="Li=lightIsect.Le(-wi);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501828608790" ID="ID_1207384520" MODIFIED="1501829839353" TEXT="else">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501828610350" ID="ID_1490949689" MODIFIED="1501829839353" TEXT="Li=light-&gt;Le(ray);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501828622070" ID="ID_313290153" MODIFIED="1501829839353" TEXT="if(!Li.IsBlack())">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501828627509" ID="ID_263872329" MODIFIED="1501829839353" TEXT="Li*=renderer-&gt;Transmittance(scene,ray,NULL,rng,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501828633030" ID="ID_538032732" MODIFIED="1501829839353" TEXT="Ld+=f * Li * AbsDot(wi,n) * weight/bsdfPdf;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
</node>
<node CREATED="1501828646766" ID="ID_258701066" MODIFIED="1501829839353" TEXT="return Ld;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501817782576" ID="ID_1259121143" MODIFIED="1501829839352" TEXT="break;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
</node>
<node CREATED="1501154592959" ID="ID_1031088743" MODIFIED="1501829839352" TEXT="if (ray.depth + 1 &lt; maxDepth)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501154727263" ID="ID_976006635" MODIFIED="1501829839352" TEXT=" // Trace rays for specular reflection and refraction">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501154733968" FOLDED="true" ID="ID_1641369673" MODIFIED="1501829851267" TEXT="L += SpecularReflect(ray, bsdf, rng, isect, renderer, scene, sample,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501161161652" ID="ID_557770827" MODIFIED="1501829839351">
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
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501161178076" ID="ID_796875059" MODIFIED="1501829839351" TEXT="Spectrum f=bsdf-&gt;Sample_f(wo,&amp;wi,BSDFSample(rng),&amp;pdf, BxDFType(BSDF_REFLECTION|BSDF_SPECULAR));">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501161204037" ID="ID_345290455" MODIFIED="1501829839351" TEXT=" Spectrum L=0.f;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501161214524" ID="ID_1619390903" MODIFIED="1501829839350" TEXT="if(pdf&gt;0.f&amp;&amp;!f.IsBlack()&amp;&amp;AbsDot(wi,n)!=0.f)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501161220893" ID="ID_224369119" MODIFIED="1501829839350" TEXT="// Compute ray differential _rd_ for specular reflection">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501161230212" ID="ID_1642119104" MODIFIED="1501829839350" TEXT="RayDifferential rd(p,wi,ray,isect.rayEpsilon);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501161239197" ID="ID_1712290826" MODIFIED="1501829839350" TEXT="if(ray.hasDifferentials)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501161250852" ID="ID_1859597264" MODIFIED="1501829839345">
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
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#006699" CREATED="1501161308389" ID="ID_1630674246" MODIFIED="1501829839345" TEXT="Spectrum Li=renderer-&gt;Li(scene,rd,sample,rng,arena);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_235931306" STARTARROW="None" STARTINCLINATION="65;170;"/>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501161325213" ID="ID_545376017" MODIFIED="1501829839345" TEXT="L=f * Li * AbsDot(wi,n)/pdf;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501161332293" ID="ID_957208511" MODIFIED="1501829839345" TEXT="return L;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501154743279" FOLDED="true" ID="ID_206889962" MODIFIED="1501829849955" TEXT="L += SpecularTransmit(ray, bsdf, rng, isect, renderer, scene, sample,arena);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#338800" CREATED="1501161530164" ID="ID_1035974868" MODIFIED="1501829839342">
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
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501161579029" ID="ID_351934902" MODIFIED="1501829839339" TEXT="Spectrum f=bsdf-&gt;Sample_f(wo,&amp;wi,BSDFSample(rng),&amp;pdf,&#xa;BxDFType(BSDF_TRANSMISSION|BSDF_SPECULAR));">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node COLOR="#338800" CREATED="1501161204037" ID="ID_1713033387" MODIFIED="1501829839339" TEXT=" Spectrum L=0.f;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501161214524" ID="ID_1805254364" MODIFIED="1501829839339" TEXT="if(pdf&gt;0.f&amp;&amp;!f.IsBlack()&amp;&amp;AbsDot(wi,n)!=0.f)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501161220893" ID="ID_912661433" MODIFIED="1501829839339" TEXT="// Compute ray differential _rd_ for specular reflection">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501161230212" ID="ID_1960747999" MODIFIED="1501829839339" TEXT="RayDifferential rd(p,wi,ray,isect.rayEpsilon);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501161239197" ID="ID_1615077168" MODIFIED="1501829839339" TEXT="if(ray.hasDifferentials)">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1501161250852" ID="ID_1461343360" MODIFIED="1501829839321">
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
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node COLOR="#006699" CREATED="1501161308389" ID="ID_167951652" MODIFIED="1501829839321" TEXT="Spectrum Li=renderer-&gt;Li(scene,rd,sample,rng,arena);">
<arrowlink DESTINATION="ID_1991648994" ENDARROW="Default" ENDINCLINATION="458;160;" ID="Arrow_ID_1395068675" STARTARROW="None" STARTINCLINATION="65;170;"/>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501161325213" ID="ID_117005457" MODIFIED="1501829839321" TEXT="L=f * Li * AbsDot(wi,n)/pdf;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501161332293" ID="ID_1252963802" MODIFIED="1501829839320" TEXT="return L;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501154598287" ID="ID_1802163961" MODIFIED="1501829839320" TEXT="return L;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1501158421945" ID="ID_705614495" MODIFIED="1501829839320" TEXT="else">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node COLOR="#999999" CREATED="1501158429478" ID="ID_1930260112" MODIFIED="1501829839320" TEXT="// Handle ray that doesn&apos;t intersect any geometry">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="10"/>
</node>
<node CREATED="1501158436610" ID="ID_491317253" MODIFIED="1501829839317" TEXT="for(uint32_t i=0; i&lt;scene-&gt;lights.size(); ++i)&#xa;   Li+=scene-&gt;lights[i]-&gt;Le(ray);">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1501158455234" FOLDED="true" ID="ID_5168828" MODIFIED="1501829839317" TEXT="Spectrum Lvi=volumeIntegrator-&gt;Li(scene,this,ray,sample,rng,T,arena);">
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
<node CREATED="1501158470298" ID="ID_1170101992" MODIFIED="1501829839316" TEXT="return *T * Li+Lvi;">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
</map>
