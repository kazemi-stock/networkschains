//Author Javid Jafari
const N=10;
const X=2;
const dopi=Math.PI*2;
const f=3;
 Easing={
      linear:{
        eIn:function (i,T,x0,dt,dn){
            return dt * i * T + x0;
        }
      }
     ,x2:{
         eIn:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = x * x;
             return dt * fx + x0;
         }
         ,eOut:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = 1 - (x -= 1) * x;
             return dt * fx + x0;
         },
         eInOut:function (i,T,x0,dt,dn){
             var x = i * (T * 2);
             if (x < 1) return dt * (x * x) * .5 + x0;
             else {
                 x -= 1;
                 return dt * ((1 - (x -= 1) * x) * .5 + .5)+ x0;
             }

         }
     }
     ,x3:{
         eIn:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = x * x * x;
             return dt * fx + x0;
         }
         ,eOut:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = 1 + (x -= 1) * x * x;
             return dt * fx + x0;
         },
         eInOut:function (i,T,x0,dt,dn){
             var x = i * (T * 2);
             if (x < 1) return dt * (x * x * x) * .5 + x0;
             else {
                 x -= 1;
                 return dt * ((1 + (x -= 1) * x * x) * .5 + .5)+ x0;
             }

         }
     }
     ,x4:{
         eIn:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = x * x * x * x;
             return dt * fx + x0;
         }
         ,eOut:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = 1 - (x -= 1) * x * x * x;
             return dt * fx + x0;
         },
         eInOut:function (i,T,x0,dt,dn){
             var x = i * (T * 2);
             if (x < 1) return dt * (x * x * x * x) * .5 + x0;
             else {
                 x -= 1;
                 return dt * ((1 - (x -= 1) * x * x * x) * .5 + .5) + x0;
             }

         }
     }
     ,x5:{
         eIn:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = x * x * x * x * x;
             return dt * fx + x0;
         }
         ,eOut:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = 1 + (x -= 1) * x * x * x * x;
             return dt * fx + x0;
         },
         eInOut:function (i,T,x0,dt,dn){
             var x = i * (T * 2);
             if (x < 1) return dt * (x * x * x * x * x) * .5 + x0;
             else {
                 x -= 1;
                 return dt * ((1 + (x -= 1) * x * x * x * x) * .5 + .5) + x0;
             }

         }
     },
     back:{
         eIn:function (i,T,x0,dt,dn){
             var sf = (dn)?dn.sf:1.5;
             var x = i * T;
             var fx = x * x * ((sf + 1) * x - sf);
             return dt * fx + x0;
         }
         ,eOut:function (i,T,x0,dt,dn){
             var sf = (dn)?dn.sf:1.5;
             var x =i * T;
             x = 1 - x;
             var fx = 1-x * x * ((sf+1)*x-sf);
             return dt * fx + x0;
         },
         eInOut:function (i,T,x0,dt,dn){
             var sf = (dn)?dn.sf:1.5;
             var x = i * (T * 2);
             if (x < 1) return dt * (x * x * ((sf+1)*x-sf)) * .5 + x0;
             else {
                 //x -= 1;
                 x = 2 - x;
                 return dt * ((1-x * x * ((sf+1)*x-sf)) * .5 + .5)+ x0;
             }
         }
     }
     ,expo:{
         eIn:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = Math.pow(2,(x-1)*N);
             return dt * fx + x0;
         }
         ,eOut:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx = 1 - Math.pow(2,-x*N);
             return dt * fx + x0;
         },
         eInOut:function (i,T,x0,dt,dn){
             var x = i * (T * 2);
             if (x < 1) return dt * (Math.pow(2,(x-1)*N)) * .5 + x0;
             else {
                 x -= 1;
                 return dt * ((1 - Math.pow(2,-x*N)) * .5 + .5) + x0;
             }
         }
     }
     ,elastic:{
         eIn:function (i,T,x0,dt,dn){
             var x = i * T;

             x -= 1;
             var cx = Math.sin(x * f * dopi) / (x * f * dopi);
             if (isNaN(cx)) cx=1;
             var fx = cx;
             return dt * fx + x0;
         },
         eIn2:function (i,T,x0,dt,dn){
             var n = f;
             var x = i * T;
             x -= 1;
             var t = 1 - (1 / (n*2));
             var cx = Math.sin(x * f * dopi) / (x * f * dopi);
             if (isNaN(cx)) cx=1;
             var fx = cx;
             if ((x += 1) >= t) {var gx = 2 * n * x - 2 * n + 1;fx = gx; }
             return dt * fx + x0;
         }
         ,eOut:function (i,T,x0,dt,dn){
             var x = i * T;
             var cx = Math.sin(x * f * dopi) / (x * f * dopi);
             if (isNaN(cx)) cx=1;
             var fx = -cx+1;
             return dt * fx + x0;
         },
         eInOut:function (i,T,x0,dt,dn){
             var x = i * (T * 2);

             if (x < 1) {
                 x -= 1;
                 var cx = Math.sin(x * f * dopi) / (x * f * dopi);
                 if (isNaN(cx)) cx=1;
                 var fx = cx*.5;
                 return dt * fx + x0;

             }
             else {
                 x -= 1;
                 var cx = Math.sin(x * f * dopi) / (x * f * dopi);
                 if (isNaN(cx)) cx=1;
                 var fx = (-cx+1)*.5+.5;
                 return dt * fx + x0;
             }
         }
     },
     circ:{
         eIn:function (i,T,x0,dt,dn){
             var x = i * T;
             var fx =1-Math.sqrt(1-(x*x));
             return dt * fx + x0;
         }
         ,eOut:function (i,T,x0,dt,dn){
             var x = i * T;
             x -= 1;
             var fx =Math.sqrt(1-(x*x));
             return dt * fx + x0;
         },
         eInOut:function (i,T,x0,dt,dn){
             var x = i * (T * 2);
             if (x < 1) return dt * (1-Math.sqrt(1-(x*x))) * .5 + x0;
             else {
                 x -= 2;
                 return dt * ((Math.sqrt(1-(x*x))) * .5 + .5) + x0;
             }
         }
     }


};
TwableObj=function (obj,props,duration,ease,onFinish,onUpdate,easeProps){

    this.obj=obj;
    this.T=duration;
    this.t=this.T+1;
    var invT=1/this.T;
    this.isEnable=false;
    this.isPaused=false;
    this.onFinish=onFinish;
    this.onUpdate=onUpdate;
    this.props=props;
    this.eProps=easeProps;
    if(ease==null) ease= Easing.linear.eIn;
    this.ease=ease;
    this.oth={};
    for (var i in this.props){

        var x0=obj[i];
         //x0=parseFloat(x0);
      //  console.log(x0);
        var delt=this.props[i]-x0;
        this.oth[i]={delta:delt,x0:x0}
    }

    this.start=function (){

        this.isEnable=true;
        this.isPaused=false;
        this.t=0;
    }
    this.stop=function (){

        this.t=this.T+1;

    }
    this.pause=function(){

        this.isPaused=true;
    }
    this.play=function(){

        this.isPaused=false;
    }
    var oo={};
    this.setEasing=function (ease){
        if(ease==null) ease=Easing.linear.eIn;
        this.ease=ease;

    };
    this.setProps=function(props){

        this.props=props;
        this.oth={};
        this.stop();
        for (i in props){

            var x0=this.obj[i];
            var delt=this.props[i]-x0;
            this.oth[i]={delta:delt,x0:x0};
        }

    };
    this.addProps=function (props){
        for ( i in props){

            this.props[i]=props[i];
        }
        for (i in this.props){
            var x0=this.obj[i];
            var delt=this.props[i]-x0;
            this.oth[i]={delta:delt,x0:x0};
        }


    }
    this.setT=function (T){
        this.T=T;
        invT=1/T;
    }
    this.update=function (){
        if(this.isPaused) return;
        if(this.t>this.T){
            this.isEnable=false;
            if(this.onFinish!=null) this.onFinish(this);
            return;
        }
        if(this.onUpdate!=null) this.onUpdate(this);

        for (i in this.props){
            var o=this.oth[i];
            var p=this.ease(this.t,invT, o.x0, o.delta,this.eProps);
           // console.log(this.obj[i]);
            this.obj[i]=p;
        }
        this.t++;

    }



}
Twin=(function(){
var map={};
return {
    go: function (id,obj,props,duration,ease,onFinish,onUpdate,easeProps) {
        var tobj;
        if(map[id]!=null){

            tobj=map[id];
            tobj.obj=obj;
            tobj.setProps(props);
            tobj.setEasing(ease);
            tobj.setT(duration);
            tobj.t=0;
            tobj.onFinish=onFinish;
            tobj.onUpdate=onUpdate;

            tobj.start();
        }
        else {
           tobj =new TwableObj(obj,props,duration,ease,onFinish,onUpdate,easeProps);
            map[id]=tobj;
            tobj.start();
        }
    },
    init:function (){
        setInterval(update,1);
    },
    getObject:function (id){

        return map[id];
    }
}
 function update(){
     for(o in map){
         if(map[o].isEnable) map[o].update();
     }

 }
})();





var coinPaths=[{back:'./assets/image/skelton-back.jpg',front:'./assets/image/skelton.jpg'},
    {back:'./assets/image/dollar-back.jpg',front:'./assets/image/dollar.jpg'},
    {back:'./assets/image/star-back.jpg',front:'./assets/image/star.jpg'}];

Twin.init();

const n=6;
var holder=document.querySelector('#coin-holder');
var tags=` <div class="scene obj"    id="obj">
    <div class="shape cylinder-1 cyl-1">
      <div class="face bm"></div>
      <div class="face tp"></div>
      <div class="face side s0"></div>
      <div class="face side s1"></div>
      <div class="face side s2"></div>
      <div class="face side s3"></div>
      <div class="face side s4"></div>
      <div class="face side s5"></div>
      <div class="face side s6"></div>
      <div class="face side s7"></div>
      <div class="face side s8"></div>
      <div class="face side s9"></div>
      <div class="face side s10"></div>
      <div class="face side s11"></div>
      <div class="face side s12"></div>
      <div class="face side s13"></div>
    </div>
  </div>`;
  holder.innerHTML =tags;
  var obj=document.querySelector('#obj');
   obj.querySelector('.face.bm').style=" background:url('"+coinPaths[2].back+"');"
   obj.querySelector('.face.tp').style=" background:url('"+coinPaths[2].front+"');"
    var sides=obj.querySelectorAll('.face.side');
  
     for(s of sides){
        s.style=" background:url('./assets/image/sidesYellow.jpg');"
     }
let trace=console.log;
const parent=obj.parentElement;

var t=0;
 obj.style.transform="rotateY("+t+"deg) rotateZ(180deg) rotateX(90deg) translate(2px,20px)";
const coins=[]
coins.push(obj)
obj.angle=0;
coins[0].i=0
let box=document.querySelector('#box');
var theo={x:60}
function udate(o) {
  box.style.width=o.obj.x+'px'
  // body...
}
for(let i=1;i<n;i++){
  let x=(((i)/n)*360);
   console.log(x+':'+i);
  let o=obj.cloneNode(true);
  o.i=i;
   parent.appendChild(o);
   o.angle=x;
   o.style.transform="rotateY("+x+"deg) rotateZ(180deg) rotateX(90deg) translate(0px,20px)";
   if(i==1 ||i==4 )
  {
     o.querySelector('.face.bm').style=" background:url('"+coinPaths[0].back+"');"
     o.querySelector('.face.tp').style=" background:url('"+coinPaths[0].front+"');"
     var sides=o.querySelectorAll('.face.side');
        for(s of sides){
        s.style=" background:url('./assets/image/sidesRed.jpg');"
     }
  }
    if(i==2 || i==5)
  {
     o.querySelector('.face.bm').style=" background:url('"+coinPaths[1].back+"');"
     o.querySelector('.face.tp').style=" background:url('"+coinPaths[1].front+"');"
     var sides=o.querySelectorAll('.face.side');
  
     for(s of sides){
        s.style=" background:url('./assets/image/sidesBlue.jpg');"
     }
  }
     if(i==3)
  {
      var sides=o.querySelectorAll('.face.side');
        for(s of sides){
       s.style=" background:url('./assets/image/sidesYellow.jpg');"
     }
      o.querySelector('.face.bm').style=" background:url('"+coinPaths[2].back+"');"
     o.querySelector('.face.tp').style=" background:url('"+coinPaths[2].front+"');"

  }

   coins.push(o);

}
function play(speed,time,id,bounce='') {
    var ease=Easing.expo.eInOut;
   if(bounce=='bounce') ease=Easing.elastic.eIn;
  theo.x=theo.x%(360)
 Twin.go('id',theo,{x:(360-coins[id].angle)+360*speed},time,ease,null,udate);
}


coins[0].i=0;
var y=0;
var yy=0;
var tt=0;
var mouseEnabled=false;
var mouseDown=false;
holder.addEventListener('mousedown', function (argument) {
    mouseDown=true;
    // body...
})
document.addEventListener('mouseup', function (argument) {
    mouseDown=false;
    console.log('mup')
    // body...
})
document.addEventListener('click',function (argument) {
  start=true;
  // body...
})
var dh=.5;
var h=0;
holder.addEventListener('mousemove',function (evt) {
  
 // y=evt.clientY/window.screen.height;
 var targ=evt.currentTarget;
  var rect = targ.getBoundingClientRect();
  if(mouseDown===true){
     //holder.style['perspective-origin']= '50% '+dh*100+'%';
       h=(evt.clientY-rect.top)/rect.height;
}


  

  // body...
})
loop();
 function loop(argument) {
  yy+=(y-yy)*.1
  var stop=false;
  dh+=(h-dh)*.1;
 
    if(mouseEnabled==true) holder.style['perspective-origin']= '50% '+dh*100+'%';
 
 for(const o of coins){
          let theta=Math.PI*2*(o.angle+t)/360;
          let sin=Math.cos(theta);
          var tx=(1+sin)/2;
         o.style['z-index']=Math.floor(tx*n);
         let alpha=(o.angle+t)%360;
          o.style.transform="rotateY("+(o.angle+t)+"deg) rotateZ(180deg) rotateX(90deg) translate(0px,"+holder.offsetWidth/2.5+"px) translateZ("+0*200+"px)";
}
if(!stop) {
    t=theo.x;
  t=t%360;
}else{
  return
}

tt++;

window.requestAnimationFrame(loop);

  // body...
}