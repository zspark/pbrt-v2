<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1500343954210" ID="ID_927353454" MODIFIED="1500343962147" TEXT="PBRT">
<node CREATED="1500343967427" ID="ID_1962258425" MODIFIED="1500344003153" POSITION="right" TEXT="Integrator">
<node CREATED="1500343981209" ID="ID_916160400" MODIFIED="1500344006531" TEXT="SurfaceIntegrator">
<node CREATED="1500344010109" ID="ID_1311662332" MODIFIED="1500344017755" TEXT="GlossyPRTIntegrator">
<node CREATED="1500344022534" ID="ID_538684594" MODIFIED="1500344399276" TEXT="Preprocess()">
<node CREATED="1500344034538" ID="ID_808365358" MODIFIED="1500344393909" TEXT="SHProjectIncidentDirectRadiance()">
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
</html>
</richcontent>
</node>
<node CREATED="1500344152888" ID="ID_1620449793" MODIFIED="1500344405796" TEXT="SHReduaceRinging()"/>
</node>
<node CREATED="1500344047167" ID="ID_1159094186" MODIFIED="1500344396382" TEXT="SHComputeBSDFMatrix()"/>
</node>
<node CREATED="1500362941774" ID="ID_356085371" MODIFIED="1500362950508" TEXT="Render">
<node CREATED="1500362965462" ID="ID_1198068221" MODIFIED="1500362969234" TEXT="SamplerRender"/>
</node>
</node>
</node>
</node>
<node CREATED="1500344649016" ID="ID_966725140" MODIFIED="1500344652606" POSITION="left" TEXT="BSDF"/>
<node CREATED="1500345515012" ID="ID_1683491421" MODIFIED="1500345518930" POSITION="left" TEXT="BxDF">
<node CREATED="1500345527672" ID="ID_930412833" MODIFIED="1500345531667" TEXT="Microfacet"/>
</node>
<node CREATED="1500366229569" ID="ID_1594328857" MODIFIED="1500366234775" POSITION="right" TEXT="CameraSample">
<node CREATED="1500366236065" ID="ID_750746285" MODIFIED="1500366241566" TEXT="Sample"/>
</node>
<node CREATED="1500366254289" ID="ID_941195705" MODIFIED="1500366257072" POSITION="right" TEXT="Sampler">
<node CREATED="1500366258817" ID="ID_809901686" MODIFIED="1500366264039" TEXT="RandomSampler"/>
</node>
<node CREATED="1500369488088" ID="ID_1608455062" MODIFIED="1500369491210" POSITION="left" TEXT="Camera">
<node CREATED="1500369492136" ID="ID_130732596" MODIFIED="1500369496646" TEXT="EnvironmentCamera"/>
<node CREATED="1500369497339" ID="ID_833199460" MODIFIED="1500369513783" TEXT="ProjectiveCamera">
<node CREATED="1500369515021" ID="ID_1765266699" MODIFIED="1500369521716" TEXT="OrthoCamera"/>
<node CREATED="1500369522080" ID="ID_1375682118" MODIFIED="1500369535873" TEXT="PerspectiveCamera"/>
</node>
</node>
</node>
</map>
