<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1500343954210" ID="ID_927353454" MODIFIED="1501818010681" TEXT="PBRT">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500862107577" ID="ID_650183095" MODIFIED="1501818010681" POSITION="right" TEXT="Light">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500862135540" ID="ID_1442174518" MODIFIED="1501818010681" TEXT="AreaLight">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500862544355" ID="ID_26985159" MODIFIED="1501818010681" TEXT="DiffuseAreaLight">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1500343967427" ID="ID_1962258425" MODIFIED="1501818010681" POSITION="right" TEXT="Integrator">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500343981209" ID="ID_916160400" MODIFIED="1501818010681" TEXT="SurfaceIntegrator">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500344010109" ID="ID_1311662332" MODIFIED="1501818010681" TEXT="GlossyPRTIntegrator">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500344022534" ID="ID_538684594" MODIFIED="1501818010681" TEXT="Preprocess()">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500344034538" FOLDED="true" ID="ID_808365358" MODIFIED="1501818010681" TEXT="SHProjectIncidentDirectRadiance()">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500344090098" ID="ID_947073118" MODIFIED="1500344247228">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p style="text-align: left">
      for(uint32_t i=0; i&lt;scene-&gt;lights.size(); ++i){
    </p>
    <p>
      Light *light=scene-&gt;lights[i];
    </p>
    <p>
      <font color="#ff0033">light-&gt;SHProject(p,pEpsilon,lmax,scene,computeLightVis,time,rng,c);</font>
    </p>
    <p>
      for(int j=0; j&lt;SHTerms(lmax); ++j)c_d[j]+=c[j];
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1500344152888" ID="ID_1620449793" MODIFIED="1500344405796" TEXT="SHReduaceRinging()"/>
</node>
<node CREATED="1500344047167" ID="ID_1159094186" MODIFIED="1501818010681" TEXT="SHComputeBSDFMatrix()">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1500362941774" ID="ID_356085371" MODIFIED="1501818010681" TEXT="Render">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500362965462" ID="ID_1198068221" MODIFIED="1501818010681" TEXT="SamplerRender">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1500862035305" ID="ID_482734171" MODIFIED="1501818010681" TEXT="DiffusePRTIntegrator">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1500879574572" ID="ID_105334429" MODIFIED="1515502428960" TEXT="DirectLightIntegraor">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    &lt;html&gt; &lt;head&gt; &lt;/head&gt; &lt;body&gt; &lt;p&gt; &amp;#27492;&amp;#31867;&amp;#31215;&amp;#20998;&amp;#22120;&amp;#19987;&amp;#27880;&amp;#20110;&amp;#30452;&amp;#25509;&amp;#20809;&amp;#29031;&amp;#30340;&amp;#26576;&amp;#20123;&amp;#20851;&amp;#38190;&amp;#32454;&amp;#33410;&lt;content ename=&quot;content&quot;&gt;&amp;#20869;&amp;#23481;&amp;#65292;&amp;#24573;&amp;#30053;&amp;#38750;&amp;#33258;&amp;#21457;&amp;#20809;&amp;#23545;&amp;#35937;&amp;#30340;&amp;#38388;&amp;#25509;&amp;#20142;&amp;#24230;&amp;#12290; &lt;/p&gt; &lt;/body&gt; &lt;/html&gt;
  </body>
</html>
</richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1500344649016" ID="ID_966725140" MODIFIED="1501818010681" POSITION="left" TEXT="BSDF">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1500345515012" FOLDED="true" ID="ID_1683491421" MODIFIED="1501818010681" POSITION="left" TEXT="BxDF">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500345527672" ID="ID_930412833" MODIFIED="1500345531667" TEXT="Microfacet"/>
</node>
<node CREATED="1500366229569" FOLDED="true" ID="ID_1594328857" MODIFIED="1501818010681" POSITION="right" TEXT="CameraSample">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500366236065" ID="ID_750746285" MODIFIED="1500366241566" TEXT="Sample"/>
</node>
<node CREATED="1500366254289" ID="ID_941195705" MODIFIED="1501818010681" POSITION="right" TEXT="Sampler">
<richcontent TYPE="NOTE">&lt;html&gt;
  &lt;head&gt;
    
    
  &lt;/head&gt;
  &lt;body&gt;
    &lt;p&gt;
      &amp;#27599;&amp;#20010;&amp;#37319;&amp;#26679;&amp;#22120;&amp;#22312;&amp;#26500;&amp;#36896;&amp;#30340;&amp;#26102;&amp;#20505;&amp;#38656;&amp;#35201;&amp;#20256;&amp;#20837;&lt;content ename=&quot;content&quot;&gt;&amp;#20687;&amp;#32032;&amp;#21306;&amp;#22495;&amp;#65292;&amp;#27599;&amp;#20010;&amp;#20687;&amp;#32032;&amp;#30340;&amp;#37319;&amp;#26679;&amp;#25968;&amp;#37327;&amp;#65292;&amp;#37319;&amp;#26679;&amp;#26102;&amp;#38388;&amp;#38388;&amp;#38548;&amp;#12290;
    &lt;/p&gt;
  &lt;/body&gt;
&lt;/html&gt;</richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500366258817" ID="ID_809901686" MODIFIED="1501818010681" TEXT="RandomSampler">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#27425;GetMoreSampler&#20989;&#25968;&#36820;&#22238;&#19968;&#20010;&#20687;&#32032;&#20013;&#30340;&#19968;&#20010;&#37319;&#26679;&#28857;&#12290;
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501813619369" ID="ID_1519996831" MODIFIED="1501818010681" TEXT="StratifiedSampler">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#27425;GetMoreSamples&#20989;&#25968;&#36820;&#22238;&#19968;&#25972;&#20010;&#20687;&#32032;&#20013;&#25152;&#26377;&#30340;&#37319;&#26679;&#28857;&#12290;
    </p>
  </body>
</html></richcontent>
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501813630892" ID="ID_875508574" MODIFIED="1501818010681" TEXT="HaltonSampler">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501813637452" ID="ID_1816450156" MODIFIED="1501818010681" TEXT="LowDiscrepancySampler">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501813647713" ID="ID_1201945759" MODIFIED="1501818010681" TEXT="BestCandidateSampler">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1501813657350" ID="ID_1053687927" MODIFIED="1501818010681" TEXT="AdaptiveSampler">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
<node CREATED="1500369488088" ID="ID_1608455062" MODIFIED="1501818010681" POSITION="left" TEXT="Camera">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500369492136" ID="ID_130732596" MODIFIED="1501818010681" TEXT="EnvironmentCamera">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1500369497339" ID="ID_833199460" MODIFIED="1501818010681" TEXT="ProjectiveCamera">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
<node CREATED="1500369515021" ID="ID_1765266699" MODIFIED="1501818010681" TEXT="OrthoCamera">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
<node CREATED="1500369522080" ID="ID_1375682118" MODIFIED="1501818010681" TEXT="PerspectiveCamera">
<font NAME="DejaVu Sans Mono for Powerline" SIZE="12"/>
</node>
</node>
</node>
</node>
</map>
