$(function() {
	queryPercentage();
	loadManageEvaSecondDUList();

});

function queryPercentage(){
	$.ajax({
		url:path+'/service/performanceManageEva/queryPercentage',
		dataType:"json",
		data:{},
		async:true,
		cache:false,
		type:"post",
		success:function(sta){		
			$("#percentA").html(sta["percentA"]);						
			$("#percentBplus").html(sta["percentBplus"]);
			$("#percentB").html(sta["percentB"]);
			$("#percentC").html(sta["percentC"]);
			$("#percentD").html(sta["percentD"]);
			$("#percentSum").html(sta["percentSum"]);			
			$("#empA").html(sta["empA"]);						
			$("#empBplus").html(sta["empBplus"]);
			$("#empB").html(sta["empB"]);
			$("#empC").html(sta["empC"]);
			$("#empD").html(sta["empD"]);
			$("#empSum").html(sta["empSum"]);	
		}
	})
}

function loadManageEvaSecondDUList(){
    var queryUrl = path+'/service/performanceManageEva/queryManageEvaSecondDUList';
    var columns = [{
			        	checkbox: true,  
			            visible: true                 //是否显示复选框  
			        }, {
			            title: 'SL',
			            formatter:function(value,row,index){
				           	return "<span>" + (index+1) + "</span>";
			           }
			        }, {
			            field: 'rm',
			            title: 'RM'
			        }, {
			            field: 'year',
			            title: 'Year'
			        }, {
			            field: 'quarter',
			            title: 'Quarter'
			        }, {
			            field: 'status',
			            title: '状态'
			        },{
			            title: 'Detail',
			            formatter:function(value,row,index){            	
			            	return "<a href='performanceManageEvaSecondQuery.html' class='btn btn-info btn-small'><i class='glyphicon glyphicon-edit'></i></a>" ;
			            }
			        }];

    var table = $('#manageEvaSeondDUList').bootstrapTable({
        url: queryUrl,                      //请求后台的URL（*）
        method: 'GET',                      //请求方式（*）
//        toolbar: '#toolbar',              //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: false,                   //是否显示分页（*）
        sortable: true,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
        pageSize: 10,                     //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        search: false,                      //是否显示表格搜索
        strictSearch: false,
        showColumns: false,                  //是否显示所有的列（选择显示的列）
//        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect : true, // 是否启用点击选中行
//        height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
        showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                  //是否显示父子表
        singleSelect:false, 				//禁止多选_____
        //得到查询的参数
        queryParams : function (params) {
        	return {
        		pageSize: params.limit,
        		pageNumber: params.offset/params.limit+1
            };
        },
        columns: columns
        ,onLoadSuccess: function (sta) {
			console.log("in onLoadSuccess");
			console.log(JSON.stringify(sta));				
        }
        ,onLoadError: function (status, res) { //加载失败时执行
          console.log( res);
          console.log("error.status:" + status);
        },
        onDblClickRow: function (row, $element) {
           
        }
        
    });
}

