$(function () {
	//加载线下运营报表
    loadOfflineReport();
});


//线下运营报表
function loadOfflineReport(){
	
    var queryUrl = path+'/service/offlineOper/querySummary';
	//var queryUrl = path+'/json/test.json';
    var table = $('#OfflineReport').bootstrapTable({
        url: queryUrl,                      //请求后台的URL（*）
        method: 'GET',                      //请求方式（*）
        toolbar: '#toolbar',              //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        //fixedColumns: true,
        //fixedNumber: 6,
        singleSelect : true,                // 单选checkbox 
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: true,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
        pageSize: 10,                     //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        search: false,                      //是否显示表格搜索
        strictSearch: true,
        showColumns: false,                  //是否显示所有的列（选择显示的列）
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
        showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                  //是否显示父子表
        //得到查询的参数
        queryParams : function (params) {
        	return {
        		pageSize: params.limit,
        		pageNumber: params.offset/params.limit+1,
            };
        },
        columns: [
        {
        	checkbox: true,  
            visible: true                 //是否显示复选框  
        },
        {
            field: 'departmentName',
            title: 'DepartMent',
            sortable: true
        },
        {
            field: 'type',
            title: 'Type',
            sortable: true
        },
        {
            field: 'remark',
            title: 'Remark',
            sortable: true
        },
        {
            field: 'months',
            title: '1月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month1;
            }
        },
        {
            field: 'months',
            title: '2月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month2;
            }
        },{
            field: 'months',
            title: '3月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month3;
            }
        },{
            field: 'months',
            title: '4月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month4;
            }
        },{
            field: 'months',
            title: '5月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month5;
            }
        },{
            field: 'months',
            title: '6月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month6;
            }
        },{
            field: 'months',
            title: '7月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month7;
            }
        },{
            field: 'months',
            title: '8月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month8;
            }
        },{
            field: 'months',
            title: '9月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month9;
            }
        },{
            field: 'months',
            title: '10月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month10;
            }
        },{
            field: 'months',
            title: '11月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month11;
            }
        },{
            field: 'months',
            title: '12月',
            sortable: true,
            formatter : function(value,row, index){   //主要配置在这里
                return value.month12;
            }
        }
        ],
        onLoadSuccess: function () {
        	var data = $('#OfflineReport').bootstrapTable('getData', true);
            //合并单元格
            mergeCells(data, "departmentName", 1, $('#OfflineReport'));
        },
        onLoadError: function () {
        	
        },
        onDblClickRow: function (row, $element) {
           
        }
        
    });
}

/**
 * 合并单元格
 * @param data  原始数据（在服务端完成排序）
 * @param fieldName 合并属性名称
 * @param colspan   合并列
 * @param target    目标表格对象
 */
function mergeCells(data,fieldName,colspan,target){
    //声明一个map计算相同属性值在data对象出现的次数和
    var sortMap = {};
    for(var i = 0 ; i < data.length ; i++){
        for(var prop in data[i]){
            if(prop == fieldName){
                var key = data[i][prop]
                if(sortMap.hasOwnProperty(key)){
                    sortMap[key] = sortMap[key] * 1 + 1;
                } else {
                    sortMap[key] = 1;
                }
                break;
            } 
        }
    }
    for(var prop in sortMap){
        console.log(prop,sortMap[prop])
    }
    var index = 0;
    for(var prop in sortMap){
        var count = sortMap[prop] * 1;
        $(target).bootstrapTable('mergeCells',{index:index, field:fieldName, colspan: colspan, rowspan: count});   
        index += count;
    }
}

