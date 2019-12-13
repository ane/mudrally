<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.2" tiledversion="1.2.3" name="Hard vacuum" tilewidth="20" tileheight="20" tilecount="1248" columns="32">
 <image source="hard-vacuum.png" trans="008a76" width="640" height="780"/>
 <terraintypes>
  <terrain name="Sand" tile="535">
   <properties>
    <property name="friction" type="float" value="0.33000000000000002"/>
   </properties>
  </terrain>
  <terrain name="Rock" tile="954">
   <properties>
    <property name="friction" type="float" value="1"/>
   </properties>
  </terrain>
  <terrain name="Grass" tile="193">
   <properties>
    <property name="friction" type="float" value="0.5"/>
   </properties>
  </terrain>
  <terrain name="Ice" tile="705">
   <properties>
    <property name="friction" type="float" value="0.25"/>
   </properties>
  </terrain>
 </terraintypes>
 <tile id="193" terrain="2,2,2,2"/>
 <tile id="196">
  <objectgroup draworder="index">
   <object id="1" x="5.0353" y="5.0353" width="10" height="10">
    <properties>
     <property name="collidable" type="bool" value="true"/>
    </properties>
   </object>
  </objectgroup>
 </tile>
 <tile id="256">
  <objectgroup draworder="index">
   <object id="1" name="a" x="0.33723" y="14.2761">
    <properties>
     <property name="collidable" type="bool" value="true"/>
    </properties>
    <polygon points="0,0 7.64388,-2.47302 13.4892,-7.19424 15.5126,-14.0513 0,-14.0513"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="257">
  <objectgroup draworder="index">
   <object id="1" name="b" x="7.08183" y="-0.11241" rotation="-1">
    <properties>
     <property name="collidable" type="bool" value="true"/>
    </properties>
    <polygon points="0,0 2.02338,6.7446 3.14748,8.43076 5.95773,10.9038 9.89209,14.0513 13.0335,14.7237 13.152,0.56205"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="288">
  <objectgroup draworder="index">
   <object id="1" name="c" x="0" y="14">
    <properties>
     <property name="collidable" type="bool" value="true"/>
    </properties>
    <polygon points="0,0 4.94421,6.4655 15.0608,6.38944 10.4209,-1.82555 2.05375,-8.51925 -0.380324,-8.06286"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="289">
  <objectgroup draworder="index">
   <object id="1" name="d" x="5.85698" y="19.8529">
    <properties>
     <property name="collidable" type="bool" value="true"/>
    </properties>
    <polygon points="0,0 6.38944,-9.81235 13.3113,-15.5933 14.148,-5.40059 10.1166,-0.152129"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="392">
  <objectgroup draworder="index">
   <object id="1" name="PALLI" x="4.11979" y="1.94546" width="10" height="10">
    <properties>
     <property name="collidable" type="bool" value="true"/>
    </properties>
    <ellipse/>
   </object>
  </objectgroup>
 </tile>
 <tile id="535" terrain="0,0,0,0"/>
 <tile id="570" terrain=",,0,0"/>
 <tile id="705" terrain="3,3,3,3"/>
 <tile id="738" terrain="3,,,"/>
 <tile id="954" terrain="1,1,1,1"/>
</tileset>
