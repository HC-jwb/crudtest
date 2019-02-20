<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" type="text/css" href="/css/semantic.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>

	<style type="text/css">
		.main-container{ margin: 10px 50px; }
	</style>
</head>
<body>
	<div class="ui menu inverted pink secondary main">
		<div class="ui container">
			<div class="active item">
				<a href="#"><i class="book large icon"></i>crud</a>
			</div>
		</div>
	</div>
		<div class="main-container">
			<table class="ui table celled compact" id="crudTalbeList">
				<thead>
					<tr>
						<th>고유식별번호</th>
						<th>유저이름</th>
						<th>아이디</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
<c:forEach items="${crudList}" var="crudList" varStatus="stat">				
					<tr data-id="${crudList.id}">
						<td>${crudList.id}</td>
						<td>${crudList.userName}</td>
						<td>${crudList.userId}</td>
						<td style="text-align: center;"><span class="ui red delete button">삭제</span></td>
					</tr>
</c:forEach>					
				</tbody>
				<div class="divider"></div>
			</table>
			<div class="ui blue add button">추가</div>
		</div>

		<script type="text/javascript">
			$(function(){
				$("#crudTalbeList").find("tr .ui.delete.button").click(function(){//삭제버튼 클릭 시
					//Api.init();
					if(confirm("정말 삭제하시겠습니까?")){
						alert("삭제됨!");
						var $this = $(this);
						var crudId = $this.closest("tr").data("id");

						CrudApi.deleteCrud(crudId, function(response){
							if(response){
								console.log("crud delete response = " + response);
								window.location.reload(); //reload하여 수정된 결과를 출력
							}
						});
					}else{
						alert("삭제취소!");
					}
					
				});
			});

			$(function(){
				$(".ui.add.button").click(function(){
					console.log("add button clicked");
				});
			});

			var CrudApi = {
				errorHandler: function(jqXHR, textStatus, errorText){
					alert("communication error!");
				}, 
				deleteCrud: function(crudId, callback){
					console.log("CrudApi.deleteCrud test");
					//Api.sendGet(ApiURL.rsvnBase + '/get/byid/' + reservationId, callback);
					Api.sendGet(ApiURL.crudBase + '/delete/' + crudId, callback);
				},
				createCrud: function(createId, callback){
					console.log("CrudApi.createCrud test");
					Api.sendGet(ApiURL.crudBase + '/create/' + crudId, callback);
				}
			};

			var Api = {
				// init: function(){
				// 	$.postJson = function(url, data, callback, errorHandler){
				// 		return jQuery.ajax({
				// 			'type': 'POST',
				// 			'url': url,
				// 			'contentType': 'application/json',
				// 			'data': JSON.stringify(data),
				// 			'dataType': 'json',
				// 			'success': callback,
				// 			'error': errorHandler
				// 		});
				// 	}
				// },
				sendGet: function(url, callback){
					$.getJSON(url, callback)
						.fail(function(d, textStatus, error){
						//console.log("getJSON failed!");
							console.error("getJSON failed, status: " + textStatus + ", error: " + error);
						})
						.done(function(){
							console.log("success");
						});
				}
			};

			var ApiURL = {
				crudBase: '/api/crud'
			};

			
		</script>
</body>
</html>