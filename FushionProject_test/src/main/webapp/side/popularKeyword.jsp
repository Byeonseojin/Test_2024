<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>인기 키워드</title>
    <link rel="stylesheet"  href="..css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        .keyword-container {
            width: 90%;
            margin-left: 400px;
            margin-top: 100px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .keyword-header {
            display: block;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .keyword-header h2 {
            margin: 0;
        }

        .keyword-list {
            list-style: none;
            padding: 0;
            max-height: 200px; /* 최대 높이 지정 */
            overflow-y: auto; /* 넘치는 부분에 스크롤 표시 */
        }

        .keyword-list li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            cursor: pointer;
        }

        .keyword-list li:last-child {
            border-bottom: none;
        }
        #mbtiButton{
            width: 100px;
        }
        #ageButton{
            width: 100px;
        }
    </style>
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
    <!-- 사이드바 -->
<%@ include file="../sidebar.jsp" %>

    <div class="container-keyoword">
        <div class="col-lg-9">
            <div class="keyword-container">
                <div class="keyword-header">
                    <h2>인기 키워드</h2>
                    <button class="btn btn-secondary" id="mbtiButton">MBTI 선택</button>
                    <button class="btn btn-secondary" id="ageButton">연령 선택</button>
                </div>
                <div id="keywordList">
                </div>
                <!-- 필터 버튼 추가 -->
                <div class="text-center">
                    <button onclick="filterKeywords()">필터</button>
                </div>
            </div>
        </div>
    </div>
    <div class="menu-toggle">&#9776;</div>
    <script>
        const keywordListDiv = document.getElementById("keywordList");
        const mbtiButton = document.getElementById("mbtiButton");
        const ageButton = document.getElementById("ageButton");

        const mbtiOptions = [
            "ISTJ", "ISFJ", "INFJ", "INTJ", "ISTP", "ISFP", "INFP", "INTP",
            "ESTP", "ESFP", "ENFP", "ENTP", "ESTJ", "ESFJ", "ENFJ", "ENTJ"
        ];

        const ageOptions = ["10대", "20대", "30대", "40대 이상"];

        mbtiButton.addEventListener("click", function() {
            showOptions(mbtiOptions, "mbti");
        });

        ageButton.addEventListener("click", function() {
            showOptions(ageOptions, "age");
        });

        const keywords = [
            { keyword: '키워드1', mbti: 'ISTJ', age: '10대' },
            { keyword: '키워드2', mbti: 'INTJ', age: '20대' },
            { keyword: '키워드3', mbti: 'ENFP', age: '30대' },
            // ... (나머지 키워드 데이터)
        ];

        function showOptions(options, type) {
            keywordListDiv.innerHTML = "";

            const ul = document.createElement("ul");
            ul.classList.add("keyword-list");

            options.forEach(option => {
                const li = document.createElement("li");
                li.textContent = option;
                li.addEventListener("click", function() {
                    filterKeywords(option, type);
                });
                ul.appendChild(li);
            });

            keywordListDiv.appendChild(ul);
        }

        function filterKeywords(selectedOption, type) {
            const filteredKeywords = keywords.filter(keyword => {
                return keyword[type] === selectedOption;
            });

            displayKeywords(filteredKeywords);
        }

        function displayKeywords(keywordArray) {
            keywordListDiv.innerHTML = "";

            if (keywordArray.length === 0) {
                const noKeywordMessage = document.createElement("p");
                noKeywordMessage.textContent = "해당 조건에 맞는 키워드가 없습니다.";
                keywordListDiv.appendChild(noKeywordMessage);
            } else {
                const keywordList = document.createElement("ul");
                keywordList.classList.add("keyword-list"); // 스타일 적용을 위한 클래스 추가

                keywordArray.forEach((keyword, index) => {
                    const keywordItem = document.createElement("li");
                    keywordItem.textContent = `${index + 1}. ${keyword.keyword}`;
                    keywordList.appendChild(keywordItem);
                });

                keywordListDiv.appendChild(keywordList);
            }
        }

        displayKeywords(keywords);
    </script>
</body>
</html>