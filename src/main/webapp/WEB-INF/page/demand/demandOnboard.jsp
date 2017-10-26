<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>PMO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link href="<%=path%>/css/bootstrap-cerulean.min.css" rel="stylesheet">

<link href="<%=path%>/css/charisma-app.css" rel="stylesheet">
<link
	href='<%=path%>/bower_components/fullcalendar/dist/fullcalendar.css'
	rel='stylesheet'>
<link
	href='<%=path%>/bower_components/fullcalendar/dist/fullcalendar.print.css'
	rel='stylesheet' media='print'>
<link href='<%=path%>/bower_components/chosen/chosen.min.css'
	rel='stylesheet'>
<link href='<%=path%>/bower_components/colorbox/example3/colorbox.css'
	rel='stylesheet'>
<link
	href='<%=path%>/bower_components/responsive-tables/responsive-tables.css'
	rel='stylesheet'>
<link
	href='<%=path%>/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css'
	rel='stylesheet'>
<link
	href='<%=path%>/bower_components/bootstrap-val/bootstrapValidator.css'
	rel='stylesheet'>
<link href='<%=path%>/css/jquery.noty.css' rel='stylesheet'>
<link href='<%=path%>/css/noty_theme_default.css' rel='stylesheet'>
<link href='<%=path%>/css/elfinder.min.css' rel='stylesheet'>
<link href='<%=path%>/css/elfinder.theme.css' rel='stylesheet'>
<link href='<%=path%>/css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='<%=path%>/css/uploadify.css' rel='stylesheet'>
<link href='<%=path%>/css/animate.min.css' rel='stylesheet'>
<link href='<%=path%>/css/bootstrap-datetimepicker.css' rel='stylesheet'>
<link href='<%=path%>/css/bootstrap-datetimepicker.min.css'
	rel='stylesheet'>

<!-- jQuery -->
<script src="<%=path%>/bower_components/jquery/jquery.min.js"></script>

<link rel="shortcut icon" href="<%=path%>/img/favicon.ico">

</head>
<script>
var path='<%=path%>';
</script>
<body>
	<!-- topbar starts -->
	<c:import url="/service/manage/top" />
	<!-- topbar ends -->
	<div class="ch-container">
		<div class="row">
			<!-- left menu starts -->
			<c:import url="/service/manage/left" />
			<!-- left menu ends -->
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-user"></i> 员工入职需求变更
								</h2>
							</div>
							<div id="demandInfo" class="box-content">

								<form id="demandForm" method="post" class="form-horizontal">
									<div class="form-group">
									    <input type="hidden" name="candidateId" id="candidateId" value="${demand.candidateId}"/>
									</div>
									<div class="group">
										<div class="group">
											<label class="col-sm-2 control-label">RR #</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="rr"
													value="${demand.rr }" id="rr" />
											</div>
										</div>
										<div class="group">
											<label class="col-sm-2 control-label">Job Code</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="jobCode"
													value="${demand.jobCode }" id="jobCode" />
											</div>
										</div>
									</div>
									</br>
									</br>
									</br>
									<div class="group">
										<label class="col-lg-2 control-label">Department</label>
										<div class="col-lg-4">
											<select class="form-control" name="hsbcDept.hsbcDeptName"
												id="department" >
												<option value="${demand.hsbcDept.hsbcDeptName }">${demand.hsbcDept.hsbcDeptName }</option>
											</select>
										</div>
									</div>
									<div class="group">
										<label class="col-sm-2 control-label">Sub - Department</label>
										<div class="col-sm-4">
											<select class="form-control" name="hsbcDept.hsbcSubDeptName"
												data-bv-notempty data-bv-notempty-message="请选择角色"
												id="sub_department" data-bv-group=".group">
												<option value="${demand.hsbcDept.hsbcSubDeptName }">${demand.hsbcDept.hsbcSubDeptName }</option>
											</select>
										</div>
									</div>
									</br>
									</br>
									</br>

									<div id="successAlert" class="alert alert-success"
										style="display: none;"></div>
									<div class="group">
										<label class="col-sm-2 control-label">Planned Onboard
											date</label>
										<div class="col-md-4">
											<div class="input-group date form_datetime col-sm-12"
												data-link-field="dt_set_order_time_input">
												<input class="form-control" type="text" disabled="disabled"
													id="plannedOnboardDate1" name="plannedOnboardDate1" value="${demand.plannedOnboardDate }"> <span
													class="input-group-addon"><span
													class="glyphicon glyphicon-th"></span></span> <input type="hidden"
													id="plannedOnboardDate2" name="plannedOnboardDate2" />
											</div>
										</div>
									</div>
									<label class="col-lg-2 control-label">Tech/Skill</label>
									<div class="col-lg-4">
										<select class="form-control" name="skill" data-bv-notempty
											data-bv-notempty-message="请选择角色" id="skill"
											data-bv-group=".group">
											<option value="${demand.skill }">${demand.skill }</option>
										</select>
									</div>
									</br>
									</br>
									</br>


									<div class="group">
										<label class="col-sm-2 control-label">交付部</label>
										<div class="col-sm-4">
											<select class="form-control" name="csSubDept"
												data-bv-notempty id="scSubDeptName" >
												<option value="${demand.csSubDept }">${demand.csSubDept }</option>
											</select>
										</div>
									</div>
									<%-- <div class="group">
										<label class="col-sm-2 control-label">Staff Name</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="candidateName"
												value="${demand.candidateName }" id="requestor" />
										</div>
									</div> --%>
									<div class="group">
										<label class="col-sm-2 control-label">HR Priority</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="hrPriority"
												value="${demand.hrPriority }" id="hrPriority" />
										</div>
									</div>
									</br>
									</br>
									</br>

									<div class="group">
										<label class="col-lg-2 control-label">Position</label>
										<div class="col-lg-4">
											<select class="form-control" name="position"  id="position">
												<option value="${demand.position }">${demand.position }</option>
											</select>
										</div>
									</div>
									<div class="group">
										<label class="col-sm-2 control-label">Requestor</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="requestor"
												value="${demand.requestor }" id="requestor" />
										</div>
									</div>
									</br>
									</br>
									</br>

									<div class="group">
										<label class="col-sm-2 control-label">Location</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="location"
												value="${demand.location }" id="location" />
										</div>
									</div>
									<div class="group">
										<label class="col-sm-2 control-label">Req published
											Date</label>
										<div class="col-sm-4">
											<input type="text" class="form-control"
												name="reqPublishedDate" value="${demand.reqPublishedDate }"
												id="reqPublishedDate" />
										</div>
									</div>
									</br>
									</br>
									</br>

									<div class="group">
										<label class="col-sm-2 control-label">Ageing</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="ageing"
												value="${demand.ageing }" id="ageing" />
										</div>
									</div>
									<div class="group">
										<label class="col-sm-2 control-label">No. of Profiles
											Sent to HSBC</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="profilesNo"
												value="${demand.profilesNo }" id="profilesNo" />
										</div>
									</div>
									</br>
									</br>
									</br>

									<div class="group">
										<label class="col-sm-2 control-label">No of Profiles
											Interviewed</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="interviewedNo"
												value="${demand.interviewedNo }" id="interviewedNo" />
										</div>
									</div>
									<div class="group">
										<label class="col-sm-2 control-label">Proposed Date of
											Joining</label>
										<div class="col-sm-4">
											<input type="text" class="form-control"
												name="proposedJoiningDate"
												value="${demand.proposedJoiningDate }"
												id="proposedJoiningDate" />
										</div>
									</div>
									</br>
									</br>
									</br> 
									<div class="group">
										<label class="col-sm-2 control-label">OnboardDate</label>
										<div class="col-md-4">
											<div class="input-group date form_datetime col-sm-12"
												data-link-field="dt_set_order_time_input">
												<input class="form-control" type="text" disabled="disabled"
													id="onboardDate1" name="onboardDate1" value="${demand.onboardDate }"> <span
													class="input-group-addon"><span
													class="glyphicon glyphicon-th"></span></span> <input type="hidden"
													id="onboardDate2" name="onboardDate2" />
											</div>
										</div>
									</div>
									<div class="group">
										<label class="col-sm-2 control-label">DoNumber</label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="doNumber"
												value="${demand.doNumber }" id="doNumber" />
										</div>
									</div>
									</br>
									</br>
									</br>
									<div class="form-group">
									    <div style="text-align:center;width:100%;">
									    <input type="button" value="修&nbsp;&nbsp;改"
										name="subscribe" id="sub_search" href="#"
										class="button btn btn-primary" data-dismiss="modal"
										onclick="updateDemandOnboard()"
										style="background-color: #D5D5D5; border: 0 none; border-radius: 4px; color: #FFFFFF; cursor: pointer; display: inline-block; font-size: 15px; font-weight: bold; height: 32px; line-height: 32px; margin: 0 5px 10px 0; padding: 0; text-align: center; text-decoration: none; vertical-align: top; white-space: nowrap; width: 100px; margin:auto ;">
									    </div>
								</div>
								<br/><br/>
							</form>
							
							<form action="" id="onBoardForm" method="post" target="_blank">
									<input id="candId" name="candId" type="hidden" />
								</form>
							</div>
							
						</div>
					</div>
				</div>
				<!--/row-->
				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>

		<hr>
		<c:import url="/service/manage/footer" />

	</div>

	<script
		src="<%=path%>/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="<%=path%>/bower_components/bootstrap-val/bootstrapValidator.min.js"></script>

	<!-- library for cookie management -->
	<script src="<%=path%>/js/jquery.cookie.js"></script>
	<!-- calender plugin -->
	<script src='<%=path%>/bower_components/moment/min/moment.min.js'></script>
	<script
		src='<%=path%>/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='<%=path%>/js/jquery.dataTables.min.js'></script>

	<!-- select or dropdown enhancer -->
	<script src="<%=path%>/bower_components/chosen/chosen.jquery.min.js"></script>
	<!-- plugin for gallery image view -->
	<script
		src="<%=path%>/bower_components/colorbox/jquery.colorbox-min.js"></script>
	<!-- notification plugin -->
	<script src="<%=path%>/js/jquery.noty.js"></script>
	<!-- library for making tables responsive -->
	<script
		src="<%=path%>/bower_components/responsive-tables/responsive-tables.js"></script>
	<!-- tour plugin -->
	<script
		src="<%=path%>/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
	<!-- star rating plugin -->
	<script src="<%=path%>/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="<%=path%>/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="<%=path%>/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="<%=path%>/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="<%=path%>/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="<%=path%>/js/charisma.js"></script>
	<script type="text/javascript" src="<%=path %>/js/pmo/employeeOnborad.js"></script>
	<script type="text/javascript" src="<%=path%>/js/pmo/loadHSBCDept.js"></script>
	<script type="text/javascript"
		src="<%=path%>/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>

</body>
</html>


