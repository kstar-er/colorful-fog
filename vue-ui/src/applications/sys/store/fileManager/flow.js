
const flow = {
  namespaced: true,
  state: {
    tableHeader: [
      {
        title: "产品代码",
        dataKey: "productCode",
        key: 'productCode',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "产品名称",
        dataKey: "productName",
        key: 'productName',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "仓库名称",
        dataKey: "warehouseName",
        key: 'warehouseName',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "操作类型",
        dataKey: "recordType",
        key: 'recordType',
        width: 200,
        type: 'select',
        isShow: true,
        isFixed: false,
        options: [{
          value: 'stock_main',
          label: '仓库'
        }, {
          value: 'stock_position',
          label: '库位'
        }]
      }, {
        title: "流水变动类型",
        dataKey: "optType",
        key: 'optType',
        width: 200,
        type: 'select',
        isShow: true,
        isFixed: false,
        options: [{
          label: '添加',
          value: '添加'
        }, {
          label: '减少',
          value: '减少'
        }]
      }, {
        title: "变动数量",
        dataKey: "num",
        key: 'num',
        width: 200,
        type: 'none',
        isShow: true,
        isFixed: false
      }, {
        title: "单据类型",
        dataKey: "orderType",
        key: 'orderType',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "单据号",
        dataKey: "orderCode",
        key: 'orderCode',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "商家名称",
        dataKey: "merchantName",
        key: 'merchantName',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "仓位名称",
        dataKey: "warehousePositionName",
        key: 'warehousePositionName',
        width: 200,
        type: 'none',
        isShow: true,
        isFixed: false
      }, {
        title: "条码",
        dataKey: "barCode",
        key: 'barCode',
        width: 200,
        type: 'none',
        isShow: true,
        isFixed: false
      }, {
        title: "备注",
        dataKey: "remark",
        key: 'remark',
        width: 200,
        type: 'none',
        isShow: true,
        isFixed: false
      }, {
        title: "创建者",
        dataKey: "createBy",
        key: 'createBy',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "创建时间",
        dataKey: "createTime",
        key: 'createTime',
        width: 200,
        type: 'date',
        isShow: true,
        isFixed: false
      }, {
        title: "更新者",
        dataKey: "updateBy",
        key: 'updateBy',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "更新时间",
        dataKey: "updateTime",
        key: 'updateTime',
        width: 200,
        type: 'date',
        isShow: true,
        isFixed: false
      }
    ],
    defaultTableHeader: [
      {
        title: "产品代码",
        dataKey: "productCode",
        key: 'productCode',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "产品名称",
        dataKey: "productName",
        key: 'productName',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "仓库名称",
        dataKey: "warehouseName",
        key: 'warehouseName',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "操作类型",
        dataKey: "recordType",
        key: 'recordType',
        width: 200,
        type: 'select',
        isShow: true,
        isFixed: false,
        options: [{
          value: 'stock_main',
          label: '仓库'
        }, {
          value: 'stock_position',
          label: '库位'
        }]
      }, {
        title: "流水变动类型",
        dataKey: "optType",
        key: 'optType',
        width: 200,
        type: 'select',
        isShow: true,
        isFixed: false,
        options: [{
          label: '添加',
          value: '添加'
        }, {
          label: '减少',
          value: '减少'
        }]
      }, {
        title: "变动数量",
        dataKey: "num",
        key: 'num',
        width: 200,
        type: 'none',
        isShow: true,
        isFixed: false
      }, {
        title: "单据类型",
        dataKey: "orderType",
        key: 'orderType',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "单据号",
        dataKey: "orderCode",
        key: 'orderCode',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "商家名称",
        dataKey: "merchantName",
        key: 'merchantName',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "仓位名称",
        dataKey: "warehousePositionName",
        key: 'warehousePositionName',
        width: 200,
        type: 'none',
        isShow: true,
        isFixed: false
      }, {
        title: "条码",
        dataKey: "barCode",
        key: 'barCode',
        width: 200,
        type: 'none',
        isShow: true,
        isFixed: false
      }, {
        title: "备注",
        dataKey: "remark",
        key: 'remark',
        width: 200,
        type: 'none',
        isShow: true,
        isFixed: false
      }, {
        title: "创建者",
        dataKey: "createBy",
        key: 'createBy',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "创建时间",
        dataKey: "createTime",
        key: 'createTime',
        width: 200,
        type: 'date',
        isShow: true,
        isFixed: false
      }, {
        title: "更新者",
        dataKey: "updateBy",
        key: 'updateBy',
        width: 200,
        type: 'text',
        isShow: true,
        isFixed: false
      }, {
        title: "更新时间",
        dataKey: "updateTime",
        key: 'updateTime',
        width: 200,
        type: 'date',
        isShow: true,
        isFixed: false
      }
    ]
  },
  getters: {
  },
  mutations: {
    updateTableHeader(state, newTableHeader) {
      state.tableHeader.length = 0
      state.tableHeader.push(...newTableHeader)
    }
  },
  actions: {
  }
}
export default flow