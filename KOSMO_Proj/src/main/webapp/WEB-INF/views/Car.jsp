<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
   $(function(){
      $('tbody tr').each(function(i){
         $(this).click(function(){
        	var id = $(this).attr('id');
            location.href="Carview.kosmo?no="+id;
            
         });
         
      });
   });
</script>
<div class="site-section carpool_section" style="padding: 2em;">
	<div class="container">
		<div class="carool-head row">
			<!-- 검색 폼 -->
			<form class="carool-form">
				<div class="form-inline">
					<div class="form-row">
						<!-- 카풀 유형  -->
						<div class="form-group">
							<select name="select" class="form-control cp_select">
								<option>전체</option>
								<option>타세요</option>
								<option>태워주세요</option>
							</select>
						</div>
						<!-- 출발지, 도착지 입력 -->
						<div class="form-group">
							<img class="form-image" src="/baby/Bootstrap/images/2.jpg" title="출발지" alt="출발지">
							<input class="form-control" type="text" name="src_key_1" 
								title="출발지를 입력해주세요" placeholder="서울">
						</div>
						<div class="form-group">
							<img class="form-image" src="/baby/Bootstrap/images/3.jpg" title="도착지" alt="도착지">
							<input class="form-control" type="text" name="src_key_2" 
								title="도착지를 입력해주세요" placeholder="경기도">
						</div>
					</div>
					<input type="submit" value="검색" class="btn btn-secondary">
				</div>
			</form>
			<div class="btn-group btn-group-toggle ml-auto" data-toggle="buttons">
				<label class="btn btn-secondary active">
					<input type="radio" name="options" id="option1" autocomplete="off" value="전체" checked > 전체
				</label>
					<label class="btn btn-secondary">
					<input type="radio"
					name="options" id="option2" autocomplete="off" value="타세요"> 타세요
				</label>
				<label class="btn btn-secondary">
					<input type="radio"
					name="options" id="option3" autocomplete="off" value="태워주세요"> 태워주세요
				</label>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table cp_table">
				<thead>
					<tr class="text-center">
						<th scope="col">프로필</th>
						<th scope="col">출발</th>
						<th scope="col"></th>
						<th scope="col">도착</th>
						<th scope="col">유형</th>
						<th scope="col">자리/금액</th>
					</tr>
				</thead>
				
				<tbody class="text-center">
					<c:if test="${empty list }" var="result">
						<tr>
							<td colspan="6">
								<h6 class="cp_type">등록된 글이 없습니다</h6>
							</td>
						</tr>
					</c:if>
					<c:if test="${! result}">
						<c:forEach var="item" items="${list}">
							<tr id="${item.cp_No }">
								<th scope="row">
									<figure class="profile">
										<img src="./Bootstrap/images/3.jpg" alt="프로필" class="picture">
										<figcaption class="name"></figcaption>
									</figure>
								</th>
								<td>
									<div class="start_con">
										<h6>${item.startPoint}</h6>
										<span class="cp_time">${item.date}</span>
									</div>
								</td>
								<td class="px-1 py-3">
									<img src="/baby/resources/images/arrow.jpg" alt="프로필" class="arrow">
								</td>
								<td>
									<div class="end_con">
										<h6>${item.endPoint}</h6>
										<span class="cp_time"></span>
									</div>
								</td>
								<td>
									<h6 class="cp_type">${item.type }</h6> <span class="cp_time"></span>
								</td>
								<td>
									<h6 class="cp_type">2자리</h6> <span class="cp_time">${item.price}원</span>
								</td>
							</tr>
							<!-- tr 반복 -->
						</c:forEach>
					</c:if>
					
				</tbody>
			</table>
		</div>
	</div>		
</div>


