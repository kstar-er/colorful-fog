"use strict";(self.webpackChunksystem=self.webpackChunksystem||[]).push([[9904],{31103:function(e,a,t){t.d(a,{V:function(){return l.V},o:function(){return s}}),t(57658);var l=t(81081);class s extends t(20566).Z{constructor({modules:e="",selectUri:a="/",deleteUri:t="/",selectOneUri:l="/",pageSize:s=20,tableHeader:o}={}){super({modules:e,selectUri:a,deleteUri:t,selectOneUri:l,pageSize:s,tableHeader:o})}forMatData(e,a){switch(e){case"sex":return+a?"女":"男";case"status":return+a?"停用":"正常";case"avatar":return"点击浏览";default:return a&&0<a.toString().length||"number"==typeof a?a:"-"}}createTreeData(e){let a=[];return e.forEach((t=>{var l;t.label=t.deptName,t.value=t.deptId,t.checked=!1,a.push((l=t,e.forEach((e=>{e.parentId===l.deptId&&l.children.push(e)})),l))})),a[0]}async getRole(){var{code:e,data:a,msg:t}=(await l.K.post("/system/role/list",{}))["data"];return 200===e?{code:e,data:a}:t}async getRoleById(e){var{code:e,data:a,msg:t}=(await l.K.get("/system/user/authRole/"+e))["data"];return 200===e?{code:e,data:a}:t}async getDept(){var{data:e,code:a}=(await l.K.post("/system/dept/list",{}))["data"];if(200===a)return this.createTreeData(e)}async addUser(e){let a="";a=e.commission?"/system/user?commission="+e.commission:"/system/user";var{code:e,data:t,msg:s}=(await l.K.post(a,e))["data"];return 200===e?{code:e,data:t}:s}async getUser(e){var{code:e,data:a,msg:t,roleIds:s,roles:o}=(await l.K.get("/system/user/"+e))["data"];return 200===e?{code:e,data:a,roleIds:s,roles:o}:t}async deleteUser(e){var{code:e,data:a,msg:t}=(await l.K.delete("/system/user/"+e))["data"];return 200===e?{code:e,data:a}:t}async updateUser(e){let a="";a=e.commission?"/system/user?commission="+e.commission:"/system/user";var{code:e,data:t,msg:s}=(await l.K.put(a,e))["data"];return 200===e?{code:e,data:t}:s}async changeStatus(e){var{code:e,data:a,msg:t}=(await l.K.put("system/user/changeStatus",e))["data"];return 200===e?{code:e,data:a}:t}async changePsw(e){var{code:e,data:a,msg:t}=(await l.K.put("system/user/resetPwd",e))["data"];return 200===e?{code:e,data:a}:t}async initData(e=this,a){var{data:t,code:s}=(await l.K.post(`${e.selectUri}?pageNum=${e.currentPage}&pageSize=`+e.pageSize,e.searchData))["data"];200===s&&(e.total=t.total,e.tableData.length=0,t.rows?e.tableData.push(...t.rows.map((e=>(e.deptName=e.dept?e.dept.deptName:null,e)))):e.tableData.push(...t),a?.clearSelection())}async getAgencyLogin(){var{code:e,data:a,msg:t}=(await l.K.get("/xindian/agency/loginUser"))["data"];return 200===e?{code:e,data:a}:t}}},51881:function(e,a){a.Z={name:"",key:"",policy:"eyJleHBpcmF0aW9uIjoiMzAyMi0wMS0wMVQxMjowMDowMC4wMDBaIiwiY29uZGl0aW9ucyI6W1siY29udGVudC1sZW5ndGgtcmFuZ2UiLDAsMTA0ODU3NjAwMF1dfQ==",OSSAccessKeyId:"LTAI5t7u1jzmji9stQ5LzCpe",success_action_status:"200",signature:"tF/dwb/qvoQjHffu0kq5FWQq9KY="}},87283:function(e,a,t){t.r(a),t.d(a,{default:function(){return S}}),t(57658);var l=t(73396),s=t(44870),o=t(87139),r=t(88490),n=t(44385),i=t(6094),u=t(94666),d=t(12862),c=t(31103),m=t(82261),p=t(78631),g=t(67603),h=t(51881),f=t(79774);const v={class:"data-filter"},w={class:"extend-handle"},y={class:"extend-handle-left"},b=["id"];a={__name:"userManagement",setup(e){const a=(0,l.Q2)("authority"),t=(0,s.iH)(h.Z),S=(0,l.FN)()["proxy"],k=(0,s.iH)(!1),D=(0,s.iH)(null),U=(0,s.iH)(!1),E=()=>{D.value=new c.o({modules:"userManagement",selectUri:"/system/user/list"}),D.value.initTableHeader(),D.value.initData(this,S.$refs.table)},x=((0,l.wF)((()=>{E()})),async({userId:e},a)=>{W.formInputEl[0].disabled=!0,W.formInputEl[1].disabled=!0,W.formInputEl[2].disabled=!0;e=await D.value.getUser(e);var t=(W.formSelectEl[0].options.length=0,await D.value.getRole());200===t.code&&(W.formSelectEl[0].options.length=0,t.data.rows.forEach((e=>{var{roleId:e,roleName:a}=e;W.formSelectEl[0].options.push({label:a,value:e})})),$.value=e.data.user,$.value.roleIds=$.value.admin?1:e.data.roleIds[0],0===a&&(W.formSelectEl[0].disabled=!0),W.isShow=!0)}),C=async()=>{W.formInputEl[0].disabled=!1,W.formInputEl[1].disabled=!1,W.formInputEl[2].disabled=!1;var e=await D.value.getRole();200===e.code&&(W.formSelectEl[0].options.length=0,e.data.rows.forEach((e=>{var{roleId:e,roleName:a}=e;W.formSelectEl[0].options.push({label:a,value:e})})),$.value={status:"0",sex:"0",roleIds:[]},W.isShow=!0)},I=e=>{let a={...e};S.$prompt("请输入新的密码","提示",{confirmButtonText:"确定",cancelButtonText:"取消"}).then((({value:e})=>{a.password=e,D.value.changePsw(a).then((e=>{200===e.code&&S.$message.success("修改成功"),D.value.initData(this,S.$refs.table)}))})).catch((()=>{}))},_=e=>{D.value.search(e,this,S.$refs.table)},T=(e,t)=>[(0,l.h)("div",{class:"table-handel-div"},[(0,l.wy)((0,l.h)(m.ElButton,{class:"hover-animation",onClick:()=>{x(e,t)},title:"编辑",type:"primary",icon:"Edit",text:!0,style:"padding:0;margin:0;background:transparent"},{default:()=>""}),[[a,"system:user:edit"]]),(0,l.wy)((0,l.h)(m.ElButton,{class:"hover-animation",onClick:()=>{I(e)},title:"重置密码",type:"success",icon:"Key",text:!0,style:"padding:0;margin:0;background:transparent"},{default:()=>""}),[[a,"system:user:resetPwd"]])]),(0,l.h)(m.ElButton,{style:"margin: 0 10px",onClick:()=>{H(e)},title:"重置密码",type:"primary",link:!0},{default:()=>"登录日志"})],H=({userName:e})=>{f.Z.push("/system/loginRecord?userName="+e)},$=(0,s.iH)({}),z=(0,s.iH)(""),B=(0,s.iH)(""),W=(0,s.qj)({isShow:!1,formInputEl:[{title:"用户账号",key:"userName",element:"input",rules:[{required:!0,message:"该项不能为空",trigger:"blur"}]},{title:"密码",key:"password",element:"input",type:"password"},{title:"确认密码",key:"repeatPassword",element:"input",type:"password"},{title:"用户昵称",key:"nickName",element:"input",rules:[{required:!0,message:"该项不能为空",trigger:"blur"}]},{title:"手机号码",key:"phonenumber",element:"input"},{title:"用户邮箱",key:"email",element:"input"}],formSelectEl:[{title:"用户角色",key:"roleIds",element:"select",options:[],rules:[{required:!0,message:"该项不能为空",trigger:"blur"}],change:e=>{}},{title:"性别",key:"sex",element:"radio",options:[{label:"男",value:"0"},{label:"女",value:"1"}],rules:[{required:!0,message:"该项不能为空",trigger:"blur"}]},{title:"账号状态",key:"status",element:"radio",options:[{label:"正常",value:"0"},{label:"停用",value:"1"}],rules:[{required:!0,message:"该项不能为空",trigger:"blur"}]}],formTextAreaEl:[{title:"备注",key:"remark",element:"input",type:"textarea"}],formUploadEl:[{title:"上传头像",key:"avatar",element:"input",onSuccess:()=>{$.value.avatar=`https://jxwlapp.oss-cn-guangzhou.aliyuncs.com/xindian/avatar/${z.value}.`+B.value,S.$refs.dialogForm.updateDialogInput({avatar:`https://jxwlapp.oss-cn-guangzhou.aliyuncs.com/xindian/avatar/${z.value}.`+B.value})},beforeUpload:e=>($.value.avatar?z.value=$.value.avatar.split("avatar/")[1].split(".")[0]:z.value=Date.parse(new Date),B.value=e.type.split("/")[1],t.value.name="test",t.value.key=`xindian/avatar/${z.value}.`+B.value,!0)}],emitOpenDialog:e=>{M(e)},inputDone:async e=>{var a={...e};a.roleIds=[a.roleIds],a.userId?200===(await D.value.updateUser(a)).code&&(S.$message.success("更新成功"),D.value.initData(this,S.$refs.table),W.isShow=!1):e.repeatPassword!==e.password?S.$message.error("两次密码不一样"):200===(await D.value.addUser(a)).code&&(S.$message.success("新增成功"),D.value.initData(this,S.$refs.table),W.isShow=!1)}}),V=({forMatValue:e,column:a,rowData:t})=>"status"===a.key?[(0,l.h)(p.OX,{modelValue:!+t.status,onChange:e=>{S.$alert(`是否变更用户账号状态，当前： ${e?"停用":"启用"} ，变更为：`+(e?"启用":"停用"),"提示",{type:"error",showCancelButton:!0,cancelButtonText:"再想想",confirmButtonText:"确认",confirmButtonClass:"delete-confirm-btn",callback:a=>{"cancel"!==a&&(t.status=e?"0":"1",D.value.changeStatus(t).then((e=>{200===e.code&&S.$message.success("修改成功"),D.value.initData(this,S.$refs.table)})))}})}})]:e,M=async e=>{},Z=()=>{U.value=!1,document.body.style.overflow="auto",document.removeEventListener("touchmove",(e=>{e.preventDefault()}),!0)},j={avatar:{class:"link",onClick:e=>{U.value=!0,imgList.length=0,imgList.push(e.avatar),document.body.style.overflow="hidden",document.addEventListener("touchmove",(e=>{e.preventDefault()}),!1)}}},q=(0,s.qj)({isShow:!1,dataSource:null,doSearch:e=>{},chooseRow:e=>{}});return(e,a)=>{const p=(0,l.up)("CircleCloseFilled"),h=(0,l.up)("el-icon");var f=(0,l.up)("el-drawer"),E=(0,l.Q2)("authorityHandle");return(0,l.wg)(),(0,l.iD)("div",null,[(0,l._)("div",v,[(0,l.Wm)(d.Z,{"filter-items":D.value.tableHeader,onSearch:_},null,8,["filter-items"])]),(0,l._)("div",w,[(0,l._)("div",y,[(0,l.wy)(((0,l.wg)(),(0,l.j4)((0,s.SU)(m.ElButton),{class:"handle-btn mr12",color:"#4a78bd",style:{color:"#666"},plain:"",onClick:C},{default:(0,l.w5)((()=>[(0,l.Uk)(" 新增 ")])),_:1})),[[E,"system:user:query"]])])]),(0,l.Wm)(u.Z,{ref:"table","need-end-handle":"","need-check-box":!1,"end-handle-width":180,total:D.value.total,"current-page":D.value.currentPage,"page-size":D.value.pageSize,"table-data":D.value.tableData,columns:D.value.tableHeader,loading:(0,s.SU)(c.V)&&!W.isShow,"default-end-handle":!1,"customize-end-handle":T,"cell-handle":j,"for-mat-data":D.value.forMatData,"need-customize-cell-renderer":!0,"customize-cell-renderer":V,onSelectionChange:a[0]||(a[0]=e=>D.value.selectionChange(e,D.value,(0,s.SU)(S).$refs.table)),onRefresh:a[1]||(a[1]=e=>D.value.initData(D.value,(0,s.SU)(S).$refs.table)),onEditRow:x,onCurrentChange:a[2]||(a[2]=e=>D.value.currentPageChange(e,D.value,(0,s.SU)(S).$refs.table)),onSizeChange:a[3]||(a[3]=e=>D.value.pageSizeChange(e,D.value,(0,s.SU)(S).$refs.table)),onEditTableHeader:a[4]||(a[4]=e=>k.value=!0)},null,8,["total","current-page","page-size","table-data","columns","loading","for-mat-data"]),(0,l.Wm)(f,{modelValue:k.value,"onUpdate:modelValue":a[6]||(a[6]=e=>k.value=e),"show-close":!1},{header:(0,l.w5)((({titleId:e,titleClass:t})=>[(0,l._)("h4",{id:e,class:(0,o.C_)(t)}," 通过拖拽设置您喜欢的表头顺序 ",10,b),(0,l.Wm)((0,s.SU)(m.ElButton),{type:"danger",onClick:a[5]||(a[5]=e=>k.value=!1)},{default:(0,l.w5)((()=>[(0,l.Wm)(h,{class:"el-icon--left"},{default:(0,l.w5)((()=>[(0,l.Wm)(p)])),_:1}),(0,l.Uk)(" 关闭 ")])),_:1})])),default:(0,l.w5)((()=>[(0,l._)("div",null,[(0,l.Wm)(i.Z,{"is-show-edit-table-header":k.value,modules:"userManagement"},null,8,["is-show-edit-table-header"])])])),_:1},8,["modelValue"]),W.isShow?((0,l.wg)(),(0,l.j4)(n.Z,{key:0,ref:"dialogForm",width:"60%",loading:(0,s.SU)(c.V),"my-client":t.value,"form-data":$.value,"is-show":W.isShow,title:"请填写相关信息","form-input-el":W.formInputEl,"form-select-el":W.formSelectEl,"form-text-area-el":W.formTextAreaEl,"form-upload-el":W.formUploadEl,"form-time-and-number":W.formTimeAndNumber,onCloseDialog:a[7]||(a[7]=e=>W.isShow=!1),onEmitOpenDialog:W.emitOpenDialog,onInputDone:W.inputDone},null,8,["loading","my-client","form-data","is-show","form-input-el","form-select-el","form-text-area-el","form-upload-el","form-time-and-number","onEmitOpenDialog","onInputDone"])):(0,l.kq)("",!0),q.isShow?((0,l.wg)(),(0,l.j4)(r.Z,{key:1,ref:"dialogSearch","append-table-style":{background:"#126f9e",color:"#fff",borderColor:"rgba(192, 192, 192,.5)"},width:"60%","search-input-placeholder":"输入搜索","is-show":q.isShow,"data-source":q.dataSource,title:"选择数据","is-show-search-input":"",loading:(0,s.SU)(c.V),onCloseDialog:a[8]||(a[8]=e=>q.isShow=!1),onDoDialogSearch:q.doSearch,onChooseRow:q.chooseRow},null,8,["append-table-style","is-show","data-source","loading","onDoDialogSearch","onChooseRow"])):(0,l.kq)("",!0),U.value?((0,l.wg)(),(0,l.j4)((0,s.SU)(g.WZ),{key:2,"url-list":e.imgList,onClose:Z},null,8,["url-list"])):(0,l.kq)("",!0)])}}};var S=(0,t(40089).Z)(a,[["__scopeId","data-v-80765eb0"]])},6094:function(e,a,t){t.d(a,{Z:function(){return p}}),t(57658);var l=t(73396),s=t(44870),o=t(49242),r=t(87139),n=t(98249),i=t(40130),u=t(46623);const d={class:"container"},c={class:"drag-box"},m={class:"drag-btn"};a={__name:"dynamicHeader",props:{isShowEditTableHeader:{type:Boolean,default:!1},modules:{type:String,default:""},filterList:{type:Array,default:()=>[]}},emits:["updateCompleted"],setup(e,{emit:a}){const t=e,{_state:p,commit:g}=(0,u.oR)(),h=p.data[t.modules].defaultTableHeader,f=(0,s.qj)([]),v=(0,s.iH)(!1),w=((0,l.wF)((()=>{(f.length=0)===t.filterList.length?f.push(...p.data[t.modules].tableHeader):p.data[t.modules].tableHeader.forEach((e=>{t.filterList.includes(e.key)||f.push(e)}))})),e=>{v.value=!1}),y=()=>{i.T.confirm("重置之后保存的数据将会丢失，是否继续？","提示",{confirmButtonText:"继续",cancelButtonText:"取消",type:"warning"}).then((()=>{f.length=0,f.push(...JSON.parse(JSON.stringify(h))),g(t.modules+"/updateTableHeader",f),i.T.alert("修改成功！刷新后生效","提示",{type:"warning",icon:"InfoFilled",confirmButtonText:"立即刷新",callback:e=>{a("updateCompleted"),location.reload()}}),a("updateCompleted")})).catch((()=>{}))},b=()=>{i.T.confirm("确认保存？","提示",{confirmButtonText:"继续",cancelButtonText:"取消",type:"warning"}).then((()=>{0!==t.filterList.length&&p.data[t.modules].tableHeader.forEach((e=>{t.filterList.includes(e.key)&&f.push(e)})),g(t.modules+"/updateTableHeader",f),i.T.alert("设置成功！刷新后生效","提示",{type:"warning",icon:"InfoFilled",confirmButtonText:"立即刷新",callback:e=>{a("updateCompleted"),location.reload()}})})).catch((()=>{}))};return(e,a)=>{const t=(0,l.up)("el-tag"),i=(0,l.up)("el-checkbox");var u=(0,l.up)("el-button");return(0,l.wg)(),(0,l.iD)("div",d,[(0,l._)("div",c,[(0,l.Wm)((0,s.SU)(n.J),{list:f,"chosen-class":"chosen",group:"name","force-fallback":"true",animation:"500","fallback-tolerance":4,onStart:a[0]||(a[0]=e=>v.value=!0),onEnd:w},{default:(0,l.w5)((()=>[(0,l.Wm)(o.W3,null,{default:(0,l.w5)((()=>[((0,l.wg)(!0),(0,l.iD)(l.HY,null,(0,l.Ko)(f,(e=>((0,l.wg)(),(0,l.iD)("div",{key:e.key||e.prop,class:"item"},[(0,l.Wm)(t,{size:"large"},{default:(0,l.w5)((()=>[(0,l.Uk)((0,r.zw)(e.title||e.label),1)])),_:2},1024),(0,l._)("div",null,[(0,l.Wm)(i,{modelValue:e.isFixed,"onUpdate:modelValue":a=>e.isFixed=a,label:"固定在左边",size:"large"},null,8,["modelValue","onUpdate:modelValue"]),(0,l.Wm)(i,{modelValue:e.isShow,"onUpdate:modelValue":a=>e.isShow=a,label:"是否展示",size:"large"},null,8,["modelValue","onUpdate:modelValue"])])])))),128))])),_:1})])),_:1},8,["list"])]),(0,l._)("div",m,[(0,l.Wm)(u,{type:"warning",onClick:y},{default:(0,l.w5)((()=>[(0,l.Uk)(" 重置 ")])),_:1}),(0,l.Wm)(u,{type:"primary",onClick:b},{default:(0,l.w5)((()=>[(0,l.Uk)(" 保存 ")])),_:1})])])}}};var p=(0,t(40089).Z)(a,[["__scopeId","data-v-4c5f22fa"]])}}]);