<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>白名单管理</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="${pageContext.request.contextPath }/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/css_Jevons.css"></link>
    <script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
</head>

<body data-type="widgets">
     <!-- 菜单 -->
			<c:import url="../manage/menu.jsp"></c:import>


        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">白名单管理</div>
                            </div>
                            <div class="widget-body  am-fr">
                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6" style="width: 320px">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button onclick="window.location.href='toAddWhiteList.action'" 
                                                type="button" class="am-btn am-btn-default am-btn-success">
                                                <span class="am-icon-plus"></span>新增白名单</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
 								<form action="whiteList.action" method="post">

 								<div class="am-u-sm-12 am-u-md-12 am-u-lg-3" style="width: 150px">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                       <input name="carNum" value="${page.carNum }" 
                                        type="text" class="am-form-field " placeholder="车牌号查询">
                                    </div>
                                </div>
                                 <div class="am-u-sm-12 am-u-md-12 am-u-lg-3" style="width: 150px">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" name="startDate" value="${page.startDate }"
                                        class="am-form-field tpl-form-no-bg" placeholder="生效日期" 
                                        data-am-datepicker=""  >
                                    </div>
                                </div>
                                 <div class="am-u-sm-12 am-u-md-12 am-u-lg-3" style="width: 50px">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <span class="am-input-group-btn">
                                        	<!-- 查询按钮 -->
                                            <button  onclick="query();" class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button"></button>
                                        </span>
                                    </div>
                                </div>
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>序号</th>
                                                <th>车牌号码</th>
                                                <th>生效日期</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                         <c:forEach items="${page.pageList }" var="white" varStatus="s">
                                            <tr class="gradeX">
                                                <td>${page.curPageIndex + s.index}</td> 
												<td>${white.carNum }</td>
												<td>${white.startDate }</td>
                                                <td>
                                                    <div class="tpl-table-black-operation">
                                                    
                                                        <a href="deleteWhite.action?whiteId=${white.whiteId }&curPage=${page.curPage}"
                                                        	onclick = "return deleteConfirm();" 
                                                        	class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                          </c:forEach>
                                          
                                        </tbody>
                                    </table>
                                </div>

                                <div class="am-u-lg-12 am-cf">

                                    <div class="am-fr div1">
                                        <ul class="am-pagination tpl-pagination myul">
                                            <li>当前</li>
                                            <li><a>${page.curPage}</a></li>
                                            <li>总页数</li>
                                            <li><a>${page.totalPage}</a></li>
                                            <li>总条数</li>
                                            <li><a>${page.totalRecord}</a></li>
                                        </ul>
                                    </div>
	
                                    <div class="am-fr div2">
                                        <ul class="am-pagination tpl-pagination">
                                        <!--      上一页 -->
                                        <c:if test="${page.curPage == 1 }">
								   			 <li class="am-disabled"><a href="#">上页</a></li>
								   		</c:if>
								   		<c:if test="${page.curPage > 1 }">
								   			 <li class="am-active"><a onclick="lastpage();">上页</a></li>
								   		</c:if>
                                  	   <!--      下一页 -->
                                        <c:if test="${page.curPage == page.totalPage }">
								   			 <li class="am-disabled"><a href="#">下页</a></li>
								   		</c:if>
								   		<c:if test="${page.curPage <  page.totalPage }">
								   			 <li class="am-active"><a onclick="nextpage();">下页</a></li>
								   		</c:if> 
                                        </ul>
                                    </div>
                                    
                                    <input type="hidden" name ="curPage" value="${page.curPage}" id="curPage"/>
                                    

                                </div>
                                
                                
                                
							</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath }/assets/js/amazeui.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/amazeui.datatables.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/app.js"></script>
	<!-- JEVONS的JAVASCRIPT -->
	<script src="${pageContext.request.contextPath }/js/js_Jevons.js"></script>
</body>
<script type="text/javascript">

	var msg = "${msg == null ? "" : msg}";
	if(msg != ""){
		alert(msg);
	}

	function nextpage(){
		document.getElementById("curPage").value = ${page.curPage +1};
		$("form").submit();
	}
	function lastpage(){
		document.getElementById("curPage").value = ${page.curPage -1};
		$("form").submit();
	}
	function query(){
		document.getElementById("curPage").value = 1;
		$("form").submit();
	}
</script>
</html>