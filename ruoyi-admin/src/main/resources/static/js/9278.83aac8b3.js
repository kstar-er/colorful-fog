"use strict";(self.webpackChunksystem=self.webpackChunksystem||[]).push([[9278],{79278:function(e,t,l){l.r(t),l.d(t,{default:function(){return v}}),l(57658);var s=l(73396),a=l(87139),r=l(44870);t=e=>((0,s.dD)("data-v-ccf07282"),e=e(),(0,s.Cn)(),e);const o={key:0},i={class:"jx-dialog-header"},n=["id"],d=t((()=>(0,s._)("div",null," 字段名称： ",-1))),c=["onClick"],u={class:"mt10"},p=t((()=>(0,s._)("div",null," 运算规则： ",-1))),g={class:"mt10"},m=t((()=>(0,s._)("div",null," 表达式： ",-1))),y={ref:"expression",class:"expression"},f={key:0,class:"mt10"},k={class:"mt10"};t={__name:"createFun",props:{isShow:{type:Boolean,default:!1},confirmText:{type:String,default:"确定"},list:{type:Object,default:()=>[]},defaultExpresion:{type:String,default:""}},emits:["closeDialog","inputDone","emitOpenDialog"],setup(e,{emit:t}){const l=e;var{}=(0,s.FN)();(0,s.YP)((()=>l.isShow),(()=>{if(l.isShow){_.length=0;var e=l.defaultExpresion;let s=0,a="";var t=[];for(let l=0;l<e.length;)"$"===e[l]?(s=1,l+=2):s&&"}"===e[l]?(t.push(a),a="",e[l+1]&&t.push(e[l+1]),l+=2,s=0):(s?a+=e[l]:t.push(e[l]),l++);t.forEach((e=>{var t;-1==="()+-*/".indexOf(e)?(t=l.list.find((t=>(t?.resultCode??t?.collectResultCode)===e)),_.push({name:t?.resultName??t?.collectResultName,code:t?.resultCode??t?.collectResultCode})):_.push({name:e,type:"danger"})}))}}));const v=()=>{t("closeDialog")},h=()=>{let e="";_.forEach((t=>{t.type?e+=t.name:e+=`\${${t.code}}`})),t("inputDone",e)},_=(0,r.qj)([]),b=(e,t)=>{"danger"===t?_.push({name:e,type:t}):_.push({name:e?.resultName??e?.collectResultName,code:e?.resultCode??e?.collectResultCode})},C=(0,s.Fl)({get(){return l.isShow},set(){}});return(t,l)=>{const r=(0,s.up)("el-button"),w=(0,s.up)("el-tag"),x=(0,s.up)("xButton");var D=(0,s.up)("el-dialog");return e.isShow?((0,s.wg)(),(0,s.iD)("div",o,[(0,s.Wm)(D,{modelValue:C.value,"onUpdate:modelValue":l[6]||(l[6]=e=>C.value=e),top:"4%","close-on-click-modal":!1,"close-on-press-escape":!1,"show-close":!1,"lock-scroll":""},{header:(0,s.w5)((({titleId:e,titleClass:l})=>[(0,s._)("div",i,[(0,s._)("h4",{id:e,class:(0,a.C_)(l)},[(0,s.Uk)(" 构造计算表达式 "),(0,s.WI)(t.$slots,"customOperation")],10,n),(0,s.Wm)(r,{class:"dialog-close-btn",type:"danger",icon:"CloseBold",circle:"",plain:"",onClick:v})])])),default:(0,s.w5)((()=>[(0,s._)("div",null,[(0,s._)("div",null,[d,((0,s.wg)(!0),(0,s.iD)(s.HY,null,(0,s.Ko)(e.list,(e=>((0,s.wg)(),(0,s.iD)("div",{key:e.id,ref_for:!0,ref:"tag"+e.id,class:"mr20 mt10 tag",style:{cursor:"pointer"},onClick:t=>b(e)},(0,a.zw)(e?.resultName??e?.collectResultName),9,c)))),128))]),(0,s._)("div",u,[p,(0,s._)("div",{ref:"add",class:"mr20 mt10 tag",type:"danger","disable-transitions":!1,style:{cursor:"pointer",background:"rgb(252, 156, 172)"},onClick:l[0]||(l[0]=e=>b("(","danger"))}," ( ",512),(0,s._)("div",{ref:"add",class:"mr20 mt10 tag",type:"danger","disable-transitions":!1,style:{cursor:"pointer",background:"rgb(252, 156, 172)"},onClick:l[1]||(l[1]=e=>b(")","danger"))}," ) ",512),(0,s._)("div",{ref:"add",class:"mr20 mt10 tag",type:"danger","disable-transitions":!1,style:{cursor:"pointer",background:"rgb(252, 156, 172)"},onClick:l[2]||(l[2]=e=>b("+","danger"))}," + ",512),(0,s._)("div",{ref:"subtract",class:"mr20 mt10 tag",type:"danger","disable-transitions":!1,style:{cursor:"pointer",background:"rgb(252, 156, 172)"},onClick:l[3]||(l[3]=e=>b("-","danger"))}," - ",512),(0,s._)("div",{ref:"multiply",class:"mr20 mt10 tag",type:"danger","disable-transitions":!1,style:{cursor:"pointer",background:"rgb(252, 156, 172)"},onClick:l[4]||(l[4]=e=>b("*","danger"))}," * ",512),(0,s._)("div",{ref:"divide",class:"mr20 mt10 tag",type:"danger","disable-transitions":!1,style:{cursor:"pointer",background:"rgb(252, 156, 172)"},onClick:l[5]||(l[5]=e=>b("/","danger"))}," / ",512)]),(0,s._)("div",g,[m,(0,s._)("div",y,[0===_.length?((0,s.wg)(),(0,s.iD)("div",f," 暂无公式 ")):(0,s.kq)("",!0),((0,s.wg)(!0),(0,s.iD)(s.HY,null,(0,s.Ko)(_,((e,t)=>((0,s.wg)(),(0,s.j4)(w,{key:e.name,class:"mr6 mt10",closable:"",type:e.type||"primary",style:{cursor:"pointer"},onClose:e=>{var l;l=t,_.splice(l,1)}},{default:(0,s.w5)((()=>[(0,s.Uk)((0,a.zw)(e.name),1)])),_:2},1032,["type","onClose"])))),128))],512)])]),(0,s._)("div",k,[(0,s.Wm)(x,{type:"primary",style:{float:"right","margin-right":"10px"},onClick:h},{default:(0,s.w5)((()=>[(0,s.Uk)((0,a.zw)(e.confirmText),1)])),_:1}),(0,s.Wm)(x,{type:"danger",style:{float:"right","margin-right":"10px"},onClick:v},{default:(0,s.w5)((()=>[(0,s.Uk)(" 取消 ")])),_:1})])])),_:3},8,["modelValue"])])):(0,s.kq)("",!0)}}};var v=(0,l(40089).Z)(t,[["__scopeId","data-v-ccf07282"]])}}]);