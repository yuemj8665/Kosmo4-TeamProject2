<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
	$(function() {
		$('#select').change(function() {
			$('#textEmail').val($('#select').val());
		})
	});	
</script>

<div class="site-section" style="padding: 2em;">
	<div id="container">
		<div class="col-lg-10 col-xl-9 mx-auto">
			<h1 class="text-center my-5">정보 수정</h1>
			<div class="myInfoRevise mx-5">
				<form action="<c:url value='/.kosmo'/>" method="post" autocomplete="off">
				<div class="reviseTit">
					기본 정보
					<p class="requiredTxt">
						<span>*</span> 표시는 필수정보입니다
					</p>
				</div>
				<div class="writeType1">
					<ul>
						<li>
							<div class="left text-center pt-3">
								<p class="tit star">성명</p>
							</div>
							<div class="right">
								<div class="txt">드릴 말</div>
							</div>
						</li>

						<li>
							<div class="left text-center pt-3">
								<p class="tit star">생년월일</p>
							</div>
							<div class="right">

								<p class="txt">1111.11.11</p>
							</div>
						</li>

						<li>
							<div class="left text-center pt-3">
								<p class="tit star">휴대폰번호</p>
							</div>
							<div class="right">
								<div class="txt">
									000-0000-0000<a href="#" class="blackBt changeBt">변경</a>
								</div>
							</div>
						</li>

						<li>
							<div class="left text-center pt-3">
								<p class="tit star">비밀번호</p>
							</div>
							<div class="right">
								<div class="txt">
									<a href="#" class="blackBt passBt changeBt" id="pwChgBtn">변경</a>
								</div>
							</div>
						</li>

						<li>
							<div class="left text-center pt-3">
								<p class="tit star">성별</p>
							</div>
							<div class="right">
								<div class="radioBox">
									<label for="gender1">남성 <input type="radio"
										id="gender1" name="gender" value="M"></label>
								</div>
								<div class="radioBox">
									<label for="gender2">여성 <input type="radio"
										id="gender2" name="gender" value="F"></label>
								</div>
							</div>
						</li>

						<li>
							<div class="left text-center pt-3">
								<p class="tit star">E-mail</p>
							</div>
							<div class="right inputArea">
								<div class="form-inline">
									<div class="input-area">
										<input class="form-control" type="text" id="emailId" name="EMAIL_ID" value=""
											placeholder="이메일 입력">
									</div>
									<span class="mx-2">@</span>
									<div class="input-area">
										<input class="form-control" type="text" id="textEmail"
											name="OHSE_DTL_ADR" placeholder="이메일을 선택하세요.">
									</div>
									<select class="form-control" id="select">
										<option disabled selected>E-Mail 선택</option>
										<option>naver.com</option>
										<option>hanmail.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
									</select>
								</div>
							</div>
						</li>

						<li>
							<div class="left text-center pt-3">
								<p class="tit">주소</p>
							</div>
							<div class="right inputArea">
								<div class="mb-2">
									<a id="addrSearch" class="grayBt">주소 검색</a>
									<div class="input-area">
										<input class="form-control" type="text" id="addr0" name="addr0" value=""
											placeholder="11111">
									</div>
								</div>
								<div class="form-inline">
									<div class="input-area col-md-5">
										<input class="form-control"  type="text" id="addr1" name="addr1" placeholder="주소">
									</div>
									<div class="input-area col-md-5">
										<input class="form-control"  type="text" id="addr2" name="addr2" placeholder="상세주소">
									</div>
								</div>
							</div>
						</li>
					</ul>
					<div class="text-center">
						<input type="submit" class="yellowBt" value="확인">
						<button type="button" class="yellowBt" >이전</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>


