"use strict";(self.webpackChunksystem=self.webpackChunksystem||[]).push([[4471],{29288:function(e,a,t){t.d(a,{B6:function(){return g},Nm:function(){return u},V_:function(){return o.V},WJ:function(){return i},Xw:function(){return l},Z$:function(){return p},aX:function(){return m},bz:function(){return w},dn:function(){return d},fm:function(){return v},g9:function(){return n},gV:function(){return h},kN:function(){return y},o2:function(){return r},u0:function(){return c},v8:function(){return f}}),t(57658);var o=t(81081),s=(a=t(20566),t(68521));class r extends a.Z{constructor({modules:e="",selectUri:a="/",deleteUri:t="/",selectOneUri:o="/",pageSize:s=20,tableHeader:r}={}){super({modules:e,selectUri:a,deleteUri:t,selectOneUri:o,pageSize:s,tableHeader:r})}forMatData(e,a){return"executionUnit"!==e?"executionTime"!==e&&e&&a&&(-1!==e.indexOf("Time")||-1!==e.indexOf("Date"))?(new s.x).timeStamp2Time(a,"yyyy-MM-dd hh:mm:ss"):a&&0<a.toString().length||"number"==typeof a?a:"-":{DAILY:"每日生成一次",MONTHLY:"每月生成一次"}[a]}createTreeData(e){let a=[];return Object.keys(e).forEach((t=>{a.push({name:t,children:e[t]})})),a}async initData(e=this,a){e.tableData.length=0;var{data:t,code:s}=(await o.K.post(`${e.selectUri}?currentPage=${e.currentPage}&pageSize=`+e.pageSize,e.searchData))["data"];200===s&&(e.tableData=e.createTreeData(t),e.total=e.tableData.length)}currentPageChange(e,a=this,t){a.currentPage=e,a.initData(a,t)}pageSizeChange(e,a=this,t){a.currentPage=1,a.pageSize=e,a.initData(a,t)}search(e,a=this,t){a.searchData=e,a.currentPage=1,a.initData(a,t,!0)}async getSolutionList(){var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeMain/getGroupType"))["data"];return 200===e?{code:e,data:a}:t}async getDetail(e){var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeMain/selectOneById?id="+e))["data"];return 200===e?{data:a,code:e}:t}async deleteSchemeMain(e){var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeMain/deleteSchemeMain",e))["data"];return 200===e?{data:a,code:e}:t}async refreshBill(e){var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeMain/flash",e))["data"];return 200===e?{data:a,code:e}:t}async createBill(e){var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeMain/create",e))["data"];return 200===e?{data:a,code:e}:t}async getBelongTable(e){var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeUser/geBelongTable",e))["data"];return 200===e?{data:a,code:e}:t}async getUserAndScheme(e){var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeUser/getUserAndScheme",e))["data"];return 200===e?{data:a,code:e}:t}async addSchemeToUser(e){var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeUser/add",e))["data"];return 200===e?{data:a,code:e}:t}}const c=async e=>{var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeDetail/updateSchemeDetailBatch",e))["data"];return 200===e?{data:a,code:e}:t},l=async e=>{var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeDetail/updateDisplay",e))["data"];return 200===e?{data:a,code:e}:t},n=async e=>{var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeDetail/addSchemeDetailBatch",e))["data"];return 200===e?{data:a,code:e}:t},d=async e=>{var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeDetail/deleteSchemeDetail",e))["data"];return 200===e?{data:a,code:e}:t},i=async e=>{var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeMain/updateSchemeMain",e))["data"];return 200===e?{data:a,code:e}:t},u=async e=>{var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeMain/selectOneById?id="+e))["data"];return 200===e?{data:a,code:e}:t},h=async e=>{var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/schemeMain/addSchemeMain",e))["data"];return 200===e?{data:a,code:e}:t},m=async e=>{var{code:e,data:a,msg:t}=(await o.K.post("/colorful-fog/condition/add",e))["data"];return 200===e?{data:a,code:e}:t},g=async e=>{var{data:e,code:a,message:t}=(await o.K.post("/colorful-fog/condition/delete",e))["data"];return 200===a?{data:e,code:a}:t},p=async e=>{var{data:e,code:a,message:t}=(await o.K.post("/colorful-fog/schemeUser/bindUserBatch",e))["data"];return 200===a?{data:e,code:a}:t},f=async e=>{var{data:e,code:a,message:t}=(await o.K.post("/colorful-fog/schemeUser/addOrUpdateBatch",e))["data"];return 200===a?{data:e,code:a}:t},w=async e=>{var{data:e,code:a,message:t}=(await o.K.post("/colorful-fog/schemeUser/delete",e))["data"];return 200===a?{data:e,code:a}:t},v=async e=>{var{data:e,code:a,message:t}=(await o.K.post("/colorful-fog/schemeMain/testScheme",e))["data"];return 200===a?{data:e,code:a}:t},y=async e=>{var{data:e,code:a,message:t}=(await o.K.post("/colorful-fog/schemeDetail/copyField",e))["data"];return 200===a?{data:e,code:a}:t}},72664:function(e,a,t){t.r(a),t.d(a,{default:function(){return U}}),t(57658);var o=t(73396),s=t(87139),r=t(44870),c=t(81081),l=t(88490),n=t(12862),d=t(29288),i=t(22483);a=e=>((0,o.dD)("data-v-88171770"),e=e(),(0,o.Cn)(),e);const u={style:{height:"100%",background:"#fff"}},h={class:"data-filter"},m={class:"content"},g={class:"left"},p={style:{"margin-bottom":"14px"}},f={class:"custom-tree-node"},w={class:"right"},v=a((()=>(0,o._)("div",{class:"extend-handle"},[(0,o._)("div",{class:"extend-handle-left"})],-1))),y={class:"list"},b=a((()=>(0,o._)("div",{class:"list-item",style:{"border-top":"1px solid #cacaca","background-color":"#126f9e",color:"white","font-size":"15px","font-weight":"bold"}},[(0,o._)("div",{class:"label"}," 用户名称 "),(0,o._)("div",{class:"value mr6 ml6"}," 绑定的方案 ")],-1))),S=["title"],D={class:"value"},k={class:"options"},C={class:"flex-center mt20 mb20"};a={__name:"programmeDetail",setup(e){(0,i.tv)();const a=(0,o.FN)()["proxy"],t=(0,r.iH)(null),U=(0,r.qj)({label:"tableName",children:"children",disabled:"disabled",isLeaf:"isLeaf",class:"class"}),_=(0,r.qj)([]);(0,o.wF)((()=>{(async()=>{t.value=new d.o2({modules:"project",selectUri:"/eam/projectInformation/select",tableHeader:[{title:"用户名称",dataKey:"userName",key:"userName",width:300,type:"text",isShow:!0,isFixed:!1}]}),t.value.getBelongTable().then((e=>{_.length=0,_.push(...e.data.map((e=>({...e,id:e.table}))))}))})()}));let K="";const M=(0,r.iH)(null),N=(e,o)=>{a.$refs.tree.setCheckedKeys([],!1),a.$refs.tree.setCheckedNodes([e],!1),K=Object.assign({},e),t.value.tableData.length=0,e=M.value.returnFilterValue().userName,e&&z(e)},z=e=>{e={userName:e,tableName:K.id},t.value.getUserAndScheme(e).then((e=>{200===e.code&&(t.value.tableData.length=0,t.value.tableData.push(...e.data.map((e=>({end:5,...e})))),t.value.pageSize=t.value.tableData.length,t.value.total=t.value.tableData.length)}))},x=e=>{e.userName&&z(e.userName)},P=()=>{var e=_.map((e=>e.id));a.$refs.tree.setCheckedKeys(e)},T=(0,r.qj)({isShow:!1,dataSource:null,searchPlaceholde:"",doSearch:e=>{},chooseRow:e=>{}});return(e,i)=>{const j=(0,o.up)("el-button");var B=(0,o.up)("el-tree");const O=(0,o.up)("el-tag"),$=(0,o.up)("arrow-down"),H=(0,o.up)("arrow-up"),L=(0,o.up)("el-icon");var F=(0,o.up)("el-pagination"),I=(0,o.Q2)("loading");return(0,o.wg)(),(0,o.iD)("div",u,[(0,o._)("div",h,[(0,o.Wm)(n.Z,{ref_key:"searchInfo",ref:M,"filter-items":t.value.tableHeader,onSearch:x},null,8,["filter-items"])]),(0,o._)("div",m,[(0,o._)("div",g,[(0,o._)("div",p,[(0,o.Wm)(j,{type:"warning",size:"small",onClick:P},{default:(0,o.w5)((()=>[(0,o.Uk)(" 全选 ")])),_:1})]),(0,o.Wm)(B,{ref:"tree",data:_,"show-checkbox":"","check-on-click-node":"","node-key":"id",props:U,onCheck:N},{default:(0,o.w5)((({node:e})=>[(0,o._)("span",f,[(0,o._)("span",null,(0,s.zw)(e.label),1)])])),_:1},8,["data","props"])]),(0,o.wy)(((0,o.wg)(),(0,o.iD)("div",w,[v,(0,o._)("div",y,[b,((0,o.wg)(!0),(0,o.iD)(o.HY,null,(0,o.Ko)(t.value.tableData,((e,r)=>((0,o.wg)(),(0,o.iD)("div",{key:r,class:(0,s.C_)([e.appendClass,"list-item"])},[(0,o._)("div",{class:"label",title:e.userName},(0,s.zw)(e.userName),9,S),(0,o._)("div",D,[((0,o.wg)(!0),(0,o.iD)(o.HY,null,(0,o.Ko)(e.schemeMainList.slice(0,e.end),((t,r)=>((0,o.wg)(),(0,o.j4)(O,{key:t,class:(0,s.C_)(["mr6 ml6",e.appendClass?"mb10":""]),closable:"",onClose:o=>{var s,c,l;s=t,c=r,l=e,a.$alert("是否确认移除该方案？","提示",{type:"info",icon:"InfoFilled",confirmButtonText:"确定",callback:e=>{"confirm"===e&&(0,d.bz)([s.id]).then((e=>{200===e.code&&(a.$message.success("删除成功"),l.schemeMainList.splice(c,1),l.schemeMainList.length<=5)&&(l.appendClass="",l.end=5)}))}})}},{default:(0,o.w5)((()=>[(0,o.Uk)((0,s.zw)(t.schemeName),1)])),_:2},1032,["class","onClose"])))),128))]),(0,o._)("div",k,[5<e.schemeMainList.length?((0,o.wg)(),(0,o.j4)(j,{key:0,type:"success",link:"",onClick:a=>{var t;"all"===(t=e).appendClass?(t.appendClass="",t.end=5):(t.appendClass="all",t.end=t.schemeMainList.length)}},{default:(0,o.w5)((()=>[(0,o.Uk)((0,s.zw)(e.appendClass?"收起":"查看全部")+" ",1),(0,o.Wm)(L,{class:"el-icon--right"},{default:(0,o.w5)((()=>[e.appendClass?((0,o.wg)(),(0,o.j4)(H,{key:1})):((0,o.wg)(),(0,o.j4)($,{key:0}))])),_:2},1024)])),_:2},1032,["onClick"])):(0,o.kq)("",!0),(0,o.Wm)(j,{type:"warning",link:"",onClick:o=>(async(e,o)=>{T.useChoose=!0,"schemeName"===e&&(T.searchPlaceholde="输入账单计划名称进行搜索",T.chooseRow=e=>{e.children||(e={schemeCode:e.schemeCode,archiveUserCode:o.userCode,archiveUserName:o.userName,tableName:K.id},t.value.addSchemeToUser(e).then((e=>{200===e.code&&(e=M.value.returnFilterValue()["userName"],z(e),a.$message.success("添加成功"),T.isShow=!1)})))},T.doSearch=e=>{T.dataSource.searchData={},e&&(T.dataSource.searchData.name=e),T.dataSource.initData()},T.dataSource=new d.o2({selectUri:"/colorful-fog/schemeMain/selectMenu",tableHeader:[{label:"账单名称",prop:"name",width:200},{label:"账单code",prop:"schemeCode",width:200},{label:"类型",prop:"billType",width:200}],pageSize:10}),T.dataSource.forMatData=(e,a)=>e[a.property]?"billType"===a.property?"PAY"===e[a.property]?"应付":"应收":e[a.property]??"-":"-",T.dataSource.initData=async(e=T.dataSource)=>{var{data:e,code:a}=(await c.K.post(`${e.selectUri}?currentPage=${e.currentPage}&pageSize=`+e.pageSize,e.searchData))["data"];200===a&&(T.dataSource.tableData.length=0,a=Object.entries(e).reduce(((e,a,t)=>(a={name:a[0],children:a[1],id:t+1,schemeCode:"-"},e.push(a),e)),[]),T.dataSource.tableData.push(...a),T.dataSource.total=T.dataSource.tableData.length)},await T.dataSource.initData(),T.isShow=!0)})("schemeName",e)},{default:(0,o.w5)((()=>[(0,o.Uk)(" 新增方案 ")])),_:2},1032,["onClick"])])],2)))),128))]),(0,o._)("div",C,[(0,o.Wm)(F,{"current-page":t.value.currentPage,"onUpdate:currentPage":i[0]||(i[0]=e=>t.value.currentPage=e),"page-size":t.value.pageSize,small:"",background:"",layout:"prev, pager, next, total",total:t.value.tableData.length,class:"mt-4"},null,8,["current-page","page-size","total"])])])),[[I,(0,r.SU)(d.V_)]])]),T.isShow?((0,o.wg)(),(0,o.j4)(l.Z,{key:0,ref:"dialogSearch","use-choose":!1,"append-table-style":{background:"#126f9e",color:"#fff",borderColor:"rgba(192, 192, 192,.5)"},width:"60%","search-input-placeholder":T.searchPlaceholde,"is-show":T.isShow,"data-source":T.dataSource,title:"选择数据","is-show-search-input":"",loading:(0,r.SU)(d.V_),onCloseDialog:i[1]||(i[1]=e=>T.isShow=!1),onDoDialogSearch:T.doSearch,onChooseRow:T.chooseRow},null,8,["append-table-style","search-input-placeholder","is-show","data-source","loading","onDoDialogSearch","onChooseRow"])):(0,o.kq)("",!0)])}}};var U=(0,t(40089).Z)(a,[["__scopeId","data-v-88171770"]])}}]);