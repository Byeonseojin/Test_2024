<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BEST 맛집</title>
    <link rel="stylesheet"  href="css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        .search-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            width: 100%; /* 너비 100% */
            justify-content: center; /* 가로 중앙 정렬 */
        }

        .container2 {
            width: 70%;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .restaurant-card {
            width: 300px;
            margin-bottom: 20px;
        }

        .restaurant-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .search-container {
            display: flex; /* 검색창과 버튼을 가로로 배치 */
            margin-bottom: 20px;
        }

        .graph-container {
            margin-top: 50px;
        }

        /* 그래프 스타일 추가 */
        .bar {
            fill: steelblue;
        }

        .bar:hover {
            fill: orange;
        }

        .axis-label {
            font-size: 14px;
        }

        /* 그래프 스타일 추가 */
        .bar {
            fill: steelblue;
        }

        .bar:hover {
            fill: orange;
        }

        .axis-label {
            font-size: 14px;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <!-- 로고 이미지 추가 -->
            <div class="logo">
                <img src="../imgs/mmm_logo2.png" alt="MMM">
            </div>
        </div>
    </div>
    <!-- 사이드바 -->
    <div id="sidebar" class="col-lg-5 sidebar">
        <span id="login"><a href="#" class="login">로그인</a></span>
        <span id="join"><a href="#" class="join">회원가입</a></span>
        <ul id="ul1">
            <li><a href="#" class="item"><div>인기키워드</div></a></li>
            <li><a href="#" class="item"><div>인기 Top 코스</div></a></li>
            <li><a href="#" class="item"><div>Best맛집</div></a></li>
            <li><a href="#" class="item"><div>커뮤니티</div></a></li>
            <li><a href="#" class="item"><div>후기글 모음</div></a></li>
            <li><a href="#" class="item"><div>FAQ</div></a></li>
            <hr class="sidebar-hr">
            <li><div class="sidebar-mypage">마이페이지</div>
                <ul id="ul2">
                    <li><a href="#" class="item2"><div class="mypageItem">개인정보 수정</div></a></li>
                    <li><a href="#" class="item2"><div class="mypageItem">찜코스</div></a></li>
                    <li><a href="#" class="item2"><div class="mypageItem">커뮤니티</div></a></li>
                </ul>
            </li>
            <hr class="sidebar-hr">
            <li><div class="sidebar-insta">인스타추천</div></li>
            <li><div class="instaImg"><img src="../imgs/instagram.png " width="30" height="30"></div></li>
        </ul>
    </div>
    <div class="container2">
        <div class="row search-container">
            <div class="col-md-6 offset-md-3">
                <input type="text" class="form-control" placeholder="지역을 검색하세요...">
                <button class="btn btn-outline-secondary" type="button" onclick="searchRestaurants()">검색</button>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="restaurant-card" id="restaurant1">
                    <img src="맛집이미지주소1" alt="맛집이름1" class="restaurant-img">
                    <h3>맛집이름1</h3>
                </div>
                <svg id="graph1" width="200" height="200"></svg>
            </div>
            <div class="col-md-4">
                <div class="restaurant-card" id="restaurant2">
                    <img src="맛집이미지주소2" alt="맛집이름2" class="restaurant-img">
                    <h3>맛집이름2</h3>
                </div>
                <svg id="graph2" width="200" height="200"></svg>
            </div>
            <div class="col-md-4">
                <div class="restaurant-card" id="restaurant3">
                    <img src="맛집이미지주소3" alt="맛집이름3" class="restaurant-img">
                    <h3>맛집이름3</h3>
                </div>
                <svg id="graph3" width="200" height="200"></svg>
            </div>
        </div>
    </div>

    <div class="menu-toggle">&#9776;</div>
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <script>
        // 맛집 데이터
        const restaurants = [
            { id: 'restaurant1', name: '맛집이름1', ageDistribution: [
                    { ageGroup: '10대', count: 10 },
                    { ageGroup: '20대', count: 20 },
                    { ageGroup: '30대', count: 15 },
                    { ageGroup: '40대 이상', count: 5 }
                ]},
            { id: 'restaurant2', name: '맛집이름2', ageDistribution: [
                    { ageGroup: '10대', count: 15 },
                    { ageGroup: '20대', count: 25 },
                    { ageGroup: '30대', count: 10 },
                    { ageGroup: '40대 이상', count: 8 }
                ]},
            { id: 'restaurant3', name: '맛집이름3', ageDistribution: [
                    { ageGroup: '10대', count: 8 },
                    { ageGroup: '20대', count: 18 },
                    { ageGroup: '30대', count: 22 },
                    { ageGroup: '40대 이상', count: 12 }
                ]}
            // 이하 맛집 데이터 계속 추가
        ];

        // 각 맛집에 대한 그래프 ID
        const graphIds = ['graph1', 'graph2', 'graph3'];

        // 원형 그래프 그리기 함수 (restaurantId 대신 index 사용)
        function drawPieChart(index) {
            const restaurant = restaurants[index];
            const data = restaurant.ageDistribution;

            // SVG 설정 (해당 맛집의 그래프 ID 사용)
            const svg = d3.select(`#${graphIds[index]}`);
            svg.selectAll("*").remove(); // 기존 그래프 요소 제거
            const width = +svg.attr("width");
            const height = +svg.attr("height");
            const radius = Math.min(width, height) / 2;
            const g = svg.append("g")
                .attr("transform", `translate(${width / 2},${height / 2})`);

            // 색상 스케일
            const color = d3.scaleOrdinal()
                .domain(data.map(d => d.ageGroup))
                .range(d3.schemeCategory10);

            // 파이 레이아웃
            const pie = d3.pie()
                .value(d => d.count)
                .sort(null);

            // 아크 생성
            const arc = d3.arc()
                .innerRadius(0)
                .outerRadius(radius);

            // 파이 조각 그리기
            g.selectAll(".arc")
                .data(pie(data))
                .enter().append("g")
                .attr("class", "arc")
                .append("path")
                .attr("d", arc)
                .attr("fill", d => color(d.data.ageGroup));

            // 텍스트 추가 (옵션)
            const labelArc = d3.arc()
                .outerRadius(radius - 40)
                .innerRadius(radius - 40);

            g.selectAll(".arc")
                .append("text")
                .attr("transform", d => `translate(${labelArc.centroid(d)})`)
                .attr("dy", "0.35em")
                .text(d => d.data.ageGroup);
        }

        // 맛집 카드 클릭 이벤트 처리 (클릭 시 해당 그래프만 다시 그림)
        document.querySelectorAll('.restaurant-card').forEach((card, index) => {
            card.addEventListener('click', () => {
                drawPieChart(index); // 클릭된 맛집의 index를 전달
            });
        });

        // 초기 그래프 그리기 (모든 맛집에 대해 그래프 그림)
        restaurants.forEach((_, index) => {
            drawPieChart(index);
        });
    </script>
</div>
<div class="menu-toggle">&#9776;</div>
</body>
<script src="../js/main.js"></script>
</html>