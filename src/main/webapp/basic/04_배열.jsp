<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>배열</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        /* 테이블 테두리 스타일 */
        .table-bordered th, .table-bordered td {
            border: 2px solid #d6a6e5; /* 테두리 색상 설정 */
        }
        .table-bordered th {
            background-color: #e9d3e7; /* 연한 파스텔톤 보라색 배경 */
        }
        .table-bordered tr:hover {
            background-color: #d1f2eb; /* 호버 시 연한 색상 */
        }
        /* 이미지 버튼 스타일 */
        .sort-button {
            width: 20px; /* 이미지 너비 */
            height: 20px; /* 이미지 높이 */
            cursor: pointer;
            margin-left: 5px;
            transition: transform 0.3s; /* 애니메이션 효과 추가 */
        }
        .sort-button.desc {
            transform: rotate(180deg); /* 내림차순일 때 이미지 회전 */
        }
    </style>
    <script>
        // 전역 변수로 정렬 방향을 설정
        let sortOrder = 'asc';

        // 등수 정렬 함수
        function sortTable() {
            const table = document.getElementById("scoreTable");
            const tbody = table.getElementsByTagName("tbody")[0];
            const rows = Array.from(tbody.getElementsByTagName("tr"));

            // 정렬
            rows.sort((a, b) => {
                const rankA = parseInt(a.cells[5].innerText); // 등수 A
                const rankB = parseInt(b.cells[5].innerText); // 등수 B
                return sortOrder === 'asc' ? rankA - rankB : rankB - rankA; // 오름차순 또는 내림차순 정렬
            });

            // 정렬된 행을 다시 tbody에 추가
            rows.forEach(row => tbody.appendChild(row));

            // 정렬 방향 변경 및 버튼 모양 변경
            sortOrder = sortOrder === 'asc' ? 'desc' : 'asc'; // 다음 정렬 방향 설정
            const sortButton = document.querySelector('.sort-button');
            sortButton.classList.toggle('desc'); // 클래스 토글로 모양 변경
        }
    </script>
</head>
<body>
	<% 	
		// 학생 이름 배열
		String[] uname= {"라일락","진달래","개나리","무궁화","홍길동"};
		
		// 각 과목 점수 배열
		int[] kor= {100, 50, 95, 80, 60}; // 국어 점수
		int[] eng= {100, 55, 95, 85, 40}; // 영어 점수
		int[] mat= {100, 60, 35, 90, 30}; // 수학 점수
		
		int size = uname.length; // 학생 수 저장
		
		// 평균 구하기
		double[] aver = new double[size]; // 평균 점수를 저장할 배열
		for (int i = 0; i < size; i++) {
			aver[i] = (kor[i] + eng[i] + mat[i]) / 3.0; // 각 학생의 평균 점수 계산
		}
		
		// 등수 구하기(평균으로)
		int[] rank = new int[size]; // 등수를 저장할 배열
		for (int i = 0; i < size; i++) {
			rank[i] = 1; // 기본 등수는 1
			for (int j = 0; j < size; j++) {
				if (aver[i] < aver[j]) {
					rank[i]++; // 평균이 더 낮으면 등수 증가
				}
			}
		}
	%>
	
	<table class="table table-bordered" id="scoreTable"> <!-- ID 추가 -->
        <thead>
            <tr>
                <th>이름</th> 
                <th>국어</th> 
                <th>영어</th> 
                <th>수학</th> 
                <th>평균</th> 
                
                <th>
                등수
                <button onclick="sortTable()">
                   <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
        			<path d="m280-400 200-200 200 200H280Z" fill="#6a5acd"/></svg> <!-- 이미지 정렬 버튼 -->
                </button> 
                </th>
            </tr>
        </thead>
        <tbody>
            <%
                // 학생 정보 출력
                for (int i = 0; i < size; i++) {
            %>
            <tr>
                <td><%= uname[i] %></td> <!-- 학생 이름 출력 -->
                <td><%= kor[i] %></td> <!-- 국어 점수 출력 -->
                <td><%= eng[i] %></td> <!-- 영어 점수 출력 -->
                <td><%= mat[i] %></td> <!-- 수학 점수 출력 -->
                <td><%= String.format("%.2f", aver[i]) %></td> <!-- 평균 점수 출력 (소수점 2자리) -->
                <td><%= rank[i] %></td> <!-- 등수 출력 -->
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
		
</body>
</html>
