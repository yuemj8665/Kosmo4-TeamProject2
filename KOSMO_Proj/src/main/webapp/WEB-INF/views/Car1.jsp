<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <!-- 카풀map시작-->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fc37be4712f8b89b167cddbc490382f"></script>
<style>

.carview_title {
  border-top: 3px solid #4fbdc4;
}
.carview_title .title_img {
  height: 60px;
  line-height: 60px;
  padding-left: 62px;
  display:inline-block;
  color: #4fbdc4;
  font-weight: bold;
  font-size: 18px;
  background-image: url("/baby/resources/images/car_icon.png");
  background-repeat: no-repeat;
  background-size: contain;
  
}
.carview_title .title_text {
  display:inline-block; 
  color: #9d9d9d;
  font-size: 16px;
  font-weight: bold;
  margin-left: 20px;
  
}
.table-responsive th {
  width: 100px;
}
.table-responsive td {
  width: 300px;
}
.table-responsive tbody th {
  text-align: center;
}

.table-responsive thead td {
  vertical-align: middle;
  font-size: 15px;
}
.table-responsive thead span {
  margin-right: 5px;
}
.carview_sub {
  height:300px;
  margin-bottom: 40px;
  border: 1px solid #4ebdc4;
  border-radius: 3px;
  border-bottom-width: 3px;
}

.carview_sub .carview_profile {
  padding: 15px 10px;
  text-align: center;
  border-radius: 3px;
  color: #303333;
  background-color: #edf7f8;
}
.carview_content {
  padding-right: 0;
}

.carview_profile .btn-info{
  border-radius: 10px;
}


.carview_coment h2{
  border-top: 3px solid #4fbdc4;
  height: 35px;
  line-height: 35px;
  text-indent: 5px;
  color: #4fbdc4;
  font-size: 16px;
}

.carview_coment .coment {
  min-height: 130px;
  padding: 10px;
  line-height: 20px;
  border: 1px solid #e1e1e1;
  border-radius: 5px;
  font-size: 13px;
}
.list_btn {
  margin-top: 35px;
}
.list_btn button {
  border-radius: 5px;
}
.box_map{
   height: 400px;
   width: 100%;
}
</style>

<div class="site-section" style="padding: 2em;">
   <div class="container">
      <div class="row no-gutter">
         <!-- 프로필 -->
         <div class="col-md-2">
            <div class="carview_sub">
               <div class="carview_profile">
                  <figure class="profile">
                     <img src="./Bootstrap/images/3.jpg" title="박진념" alt="프로필"
                        class="picture">
                     <figcaption class="name">${dto.name }</figcaption>
                  </figure>
                  <button type="button" class="btn btn-info">메시지 보내기</button>
               </div>
            </div>
         </div>
         <div class="carview_content col">
            <div class="carview_title">
               <h1 class="title_img">단기 카풀</h1>
               <h2 class="title_text">태워주세요</h2>
            </div>
            <input type="hidden" value="${dto.start_Xpos }" id="s_xpos">
            <input type="hidden" value="${dto.start_Ypos }" id="s_ypos">
            <input type="hidden" value="${dto.end_Xpos }" id="e_xpos">
            <input type="hidden" value="${dto.end_Ypos }" id="e_ypos">
            <div class="table-responsive">
               <table class="table table-bordered">
                  <thead class="table-borderless">
                     <tr>
                        <th class="pl-4">
                           <span>출발</span>
                           <img src="/baby/Bootstrap/images/2.jpg" title="출발지" alt="출발지">
                        </th>
                        <td>${dto.startPoint }</td>
                        <th class="pl-4">
                           <span>도착</span>
                           <img src="/baby/Bootstrap/images/3.jpg" title="출발지" alt="출발지">
                        </th>
                        <td>${dto.endPoint }</td>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <th>경유지</th>
                        <td>성남시 정자1동 정자역</td>
                        <th>출발일시</th>
                        <td>${dto.date}</td>
                     </tr>
                     <tr>
                        <th>목적</th>
                        <td>${dto.type }</td>
                        <th>비용</th>
                        <td>${dto.price }원</td>
                     </tr>
                     <tr>
                        <th>좌석수</th>
                        <td>3/3</td>
                        <th>대인배상</th>
                        <td>가입</td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <!-- 지도 -->
			<div id="map" class="box_map"></div>
            <!-- 추가내용 -->
            <div class="carview_coment">
               <h2>추가내용</h2>
               <div class="coment">${dto.content}</div>
            </div>
            <div class="list_btn text-center">
               <a href="Carindex.kosmo"><button type="button" class="btn btn-info">목록 보기</button></a>
            </div>
         </div>         
      </div>
   </div>
</div>
<script src="Bootstrap/js/CarpoolMap.js"></script>
<script>
console.log("추울력")
	console.log("${dto.end_Xpos}")
	console.log("${dto.end_Ypos}")
</script>
