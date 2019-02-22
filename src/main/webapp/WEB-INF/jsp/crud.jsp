<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/semantic.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>

<style type="text/css">
.main-container {
	margin: 10px 50px;
}

td {
	width: auto;
}

td.min {
	width: 1%;
	white-space: nowrap;
}
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
		<div class="ui mini form">
			<div class="two fields">
				<div class="field" id="userNameField">
					<label>이름 </label> <input placeholder="Use Name" type="text"
						name="userName">
				</div>
				<div class="field" id="userIdField">
					<label>아이디 </label> <input placeholder="User Id" type="text"
						name="userId">
				</div>
			</div>
			<div class="ui blue add button">ADD</div>
			<div class="pagination-radio-set"
				style="margin: 15px 0 0 0; float: right;">
				<div class="ui form" id="rowsPerPage">
					<div class="inline fields">
						<label>Rows per Page</label>
						<div class="field">
							<div class="ui radio checkbox" data-id="five-pages">
								<input type="radio" value="5" name="pagination-name" id="input-five-pages"
									${pnav.rowsPerPage eq 5 ? "checked='checked'":""}> <label>5</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox" data-id="ten-pages">
								<input type="radio" value="10" name="pagination-name" id="input-ten-pages" ${pnav.rowsPerPage eq 10 ? "checked='checked'":""}>
								<label>10</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox" data-id="fifteen-pages">
								<input type="radio" value="15" name="pagination-name"
									id="input-fifteen-pages" ${pnav.rowsPerPage eq 15 ? "checked='checked'":""}> <label>15</label>
							</div>
						</div>
						<div class="field">
							<div class="ui radio checkbox" data-id="twenty-pages">
								<input type="radio" value="20" name="pagination-name"
									id="input-twenty-pages" ${pnav.rowsPerPage eq 20 ? "checked='checked'":""}> <label>20</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<table class="ui table celled compact" id="crudTableList">
			<thead>
				<tr>
					<th style="text-align: center;">#</th>
					<th style="text-align: center;">이름</th>
					<th style="text-align: center;">아이디</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${crudList}" var="crudList" varStatus="stat">
					<tr data-id="${crudList.id}">
						<td class="min" style="text-align: center;">${crudList.id}</td>
						<td class="userNameTd" style="text-align: center;">${crudList.userName}</td>
						<td class="userIdTd" style="text-align: center;">${crudList.userId}</td>
						<td class="min"><div
								class="ui compact small delete icon button">
								<i class="trash icon"></i>
							</div></td>
						<td class="min"><div
								class="ui compact small edit icon button">
								<i class="edit icon"></i>
							</div></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<br> <br> <br>
		<center>
			<div class="ui pagination menu">
				<a class="active item"> 1 </a> <a class="item"> 2 </a> <a
					class="item"> 3 </a> <a class="item"> 4 </a>
			</div>
		</center>
	</div>

	<script type="text/javascript">
		var $rowsPerPage;
		var pagination = {rowsPerPage: ${pnav.rowsPerPage}, pageNo:${pnav.currPage}}
		$(function() {
			$rowsPerPage = $("#rowsPerPage");
			
			$rowsPerPage.find(".ui.radio.checkbox").checkbox({
				onChecked: function() {
					var newRowsPerPage = $(this).val();
					pagination.pageNo = 0;
					pagination.rowsPerPage = newRowsPerPage;
					console.log(newRowsPerPage);
	/* 				loadPagingURI(); */
				}
			})
		});

		$(function() {
			$("#crudTableList").find("tr .ui.delete.button").click(function() {//삭제버튼 클릭 시
				//Api.init();
				if (confirm("정말 삭제하시겠습니까?")) {
					alert("삭제됨!");
					var $this = $(this);
					var crudId = $this.closest("tr").data("id");

					CrudApi.deleteCrud(crudId, function(response) {
						if (response) {
							console.log("crud delete response = " + response);
							window.location.reload(); //reload하여 수정된 결과를 출력
						}
					});
				} else {
					alert("삭제취소!");
				}

			});
		});

		$(function() {
			$(".ui.add.button").click(
					function() {
						console.log("add button clicked");
						var userName = $("#userNameField").find(
								'input[name="userName"]').val();
						var userId = $("#userIdField").find(
								'input[name="userId"]').val();

						CrudApi.insertCrud(userName, userId,
								function(response) {
									if (response) {
										console.log("crud insert response = "
												+ response);
										window.location.reload(); //reload하여 수정된 결과를 출력
									}
								})
					});
		});

		$(function() {
			$(".ui.edit.button")
					.click(
							function() {
								var $this = $(this);
								var crudId = $this.closest("tr").data("id");

								var $userNameTd = $this.closest("tr").find(
										'td[class="userNameTd"]');
								var $userIdTd = $this.closest("tr").find(
										'td[class="userIdTd"]');

								if ($this.find('i').hasClass("edit")) {
									var currentUserName = $userNameTd.text();
									var currentUserId = $userIdTd.text();

									$this.find('i').removeClass("edit")
											.addClass("save");

									$userNameTd.text('');
									$userIdTd.text('');
									$userNameTd
											.append('<div class="ui fluid input"><input type="text" placeholder="User Name" name="td-userName"></form>');
									$userIdTd
											.append('<div class="ui fluid input"><input type="text" placeholder="User Id" name="td-userId"></div>');
									$userNameTd.find(
											'input[name="td-userName"]').val(
											currentUserName);
									$userIdTd.find('input[name="td-userId"]')
											.val(currentUserId);

								} else {
									var changedUserName = $userNameTd.find(
											'input[name="td-userName"]').val();
									var changedUserId = $userIdTd.find(
											'input[name="td-userId"]').val();
									$this.find('i').removeClass("save")
											.addClass("edit");

									CrudApi
											.editCrud(
													changedUserName,
													changedUserId,
													crudId,
													function(response) {
														if (response) {
															console
																	.log("crud edit response = "
																			+ response);
															window.location
																	.reload();
														}
													})
								}

								console.log("edit button clicked");
							});
		});

		var CrudApi = {
			errorHandler : function(jqXHR, textStatus, errorText) {
				alert("communication error!");
			},
			deleteCrud : function(crudId, callback) {
				console.log("CrudApi.deleteCrud test");
				//Api.sendGet(ApiURL.rsvnBase + '/get/byid/' + reservationId, callback);
				Api.sendGet(ApiURL.crudBase + '/delete/' + crudId, callback);
			},
			insertCrud : function(userName, userId, callback) {
				console.log("CrudApi.insertCrud test");
				Api.sendGet(ApiURL.crudBase + '/insert/' + userName + '/'
						+ userId, callback);
			},
			editCrud : function(changedUserName, changedUserId, crudId,
					callback) {
				console.log("CrudApi.editCrud test");
				Api.sendGet(ApiURL.crudBase + '/edit/' + changedUserName + '/'
						+ changedUserId + '/' + crudId, callback);
			}
		};

		/* var PaginationApi = {
			sendRowsPerPage : function(rowsPerPage, callback) {
				console.log("PaginationApi.sendRowsPerPage test");
				Api.sendGet(ApiURL.crudBase + '/p/' + rowsPerPage, callback);
			}
		} */

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
			sendGet : function(url, callback) {
				$.getJSON(url, callback).fail(
						function(d, textStatus, error) {
							//console.log("getJSON failed!");
							console.error("getJSON failed, status: "
									+ textStatus + ", error: " + error);
						}).done(function() {
					console.log("success");
				});
			}
		};

		var ApiURL = {
			crudBase : '/api/crud'
		};
	</script>
</body>
</html>