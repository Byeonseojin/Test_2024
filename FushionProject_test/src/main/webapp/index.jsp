<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/main.css?after">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <!-- 로고 이미지 추가 -->
            <div class="logo">
                <img src="${pageContext.request.contextPath}/imgs/mmm_logo2.png" alt="MMM">
            </div>
        </div>
    </div>
    <%@ include file="sidebar.jsp" %>
    <div class="col-lg-12 content">
        <!-- 지도 -->
        <div id="map-container">
            <div class="search-container">
                <input type="text" id="keyword" placeholder="장소를 검색하세요">
                <button id="map-search-btn" type="submit">검색</button>
            </div>
            <div class="map" id="map"></div>
        </div>
        <!-- 선택 폼 -->
        <form id="select" method="post" action="/your-post-endpoint">
            <br>
            <label>선택된 지역:</label>
            <span id="selected-location-text"> </span><br><br>

            <label for="mbti">MBTI:</label>
            <select id="mbti" name="mbti">
                <option value="" disabled selected>선택해주세요</option>
                <option value="ISTJ">ISTJ</option>
                <option value="ISFJ">ISFJ</option>
                <option value="INFJ">INFJ</option>
                <option value="INTJ">INTJ</option>
                <option value="ISTP">ISTP</option>
                <option value="ISFP">ISFP</option>
                <option value="INFP">INFP</option>
                <option value="INTP">INTP</option>
                <option value="ESTP">ESTP</option>
                <option value="ESFP">ESFP</option>
                <option value="ENFP">ENFP</option>
                <option value="ENTP">ENTP</option>
                <option value="ESTJ">ESTJ</option>
                <option value="ESFJ">ESFJ</option>
                <option value="ENFJ">ENFJ</option>
                <option value="ENTJ">ENTJ</option>
            </select><br><br>

            <label for="age">나이:</label>
            <input type="number" id="age" name="age" min="1" style="width: 50px;"><br><br>

            <label for="people">인원수:</label>
            <input type="number" id="people" name="people" min="1" style="width: 50px;"><br><br>

            <!-- 차 유무 선택 -->
            <label>차 유무:</label><br><br>
            <input type="radio" id="car_yes" name="car" value="yes">
            <label for="car_yes">O</label><br>
            <input type="radio" id="car_no" name="car" value="no" checked>
            <label for="car_no">X</label><br><br>
            <div id="courseContainer">
                <div class="course">
                    <label for="course1">코스 1:</label>
                    <select id="course1" name="course1">
                        <option value="" disabled selected>코스 선택</option>
                        <option value="식사">식사</option>
                        <option value="카페">카페</option>
                        <option value="활동">활동</option>
                    </select>
                </div><br>
                <div class="course">
                    <label for="course2">코스 2:</label>
                    <select id="course2" name="course2">
                        <option value="" disabled selected>코스 선택</option>
                        <option value="식사">식사</option>
                        <option value="카페">카페</option>
                        <option value="활동">활동</option>
                    </select>
                </div><br>
                <div class="course">
                    <label for="course3">코스 3:</label>
                    <select id="course3" name="course3">
                        <option value="" disabled selected>코스 선택</option>
                        <option value="식사">식사</option>
                        <option value="카페">카페</option>
                        <option value="활동">활동</option>
                    </select>
                </div><br>
            </div>

            <button type="button" id="addCourseBtn">코스 추가</button><br><br>
            <button type="button" id="deleteCourseBtn">코스 삭제</button><br><br>
            <button type="submit" id="select-searchBtn">완료</button>
        </form>
    </div>
    <!-- 토글 버튼 -->
    <div class="menu-toggle">&#9776;</div>
</div>
</body>
<script src="js/main.js"></script>
<script src="js/toggle.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9cbf5990fedd620733bc2f5c173f35fb&libraries=services"></script>
</html>
