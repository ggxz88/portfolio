# minishop
Spring MVC Web Project

# 
  - 이름 : 박희선
  - 이메일 : ggxz88@naver.com

# 기본 설명
소규모 사진 판매 쇼핑몰을 주제로 만든 웹사이트입니다.<br> 
Spring Framework기반의 JAVA 웹 개인 프로젝트입니다. <br>
이 프로젝트에 대한 자세한 설명은 별도의 문서로 작성하였습니다. <br>
설명서를 참고 하시려면 아래의 링크를 눌러주세요.<br> 
[설명서.pdf](https://github.com/ggxz88/minishop/files/5080780/default.pdf)

배포 : http://3.129.190.114:8080/
※관리자로 사용 시 먼저 http://3.129.190.114:8080/user/setup 에서 관리자 등록부터 해야합니다.

# 제작 동기 및 개발 목표
  - 제작 동기
    - 쇼핑몰 개발이 학습한 내용을 종합적으로 검증하고 인증하는 가장 적합한 방식이라고 생각 
	  - 개념으로만 배웠던 내용들을 실제로 프로젝트에 적용하며 경험을 축적
	  - 가장 큰 이유는 취업을 위한 준비 과정

  - 개발 목표 
	  - 웹 및 프로그래밍 언어에 대한 전반적인 이해 수준 증명
	  - 목적에 따라 특정 기능을 구현하고 설계하는 응용 능력 증명
	  - 프로젝트 전반을 책임지고 새로운 기술에 적응하는 개발자의 태도 증명

# 개요 및 개발 환경
  - 프로젝트 개요 
    - 프로젝트명 : IMAGE SHOP
	  - 개발 기간 : 2020년 07월 03일 ~ 2020년 07월 25일(개발)
    
  - 개발 환경
    - Window 10
	  - Tomcat Server 9.0
	  - JDK 1.8
	  - MySQL 8.0.20

  - 구현 기술 
	  - Spring Framework 5.0.7.RELEASE
	  - Servlet 3.1
	  - MyBatis 3.4.6
	  - HTML5, CSS3, JavaScript, Ajax
  
  - LIB
	  - JQuery 2.1.4
	    
# 주요 가정 및 기능
  - 주요 가정
    - 개인 운영 또는 소규모 운영을 목적으로 함
    - 회원제로 운영
    - 관리자 계정 별도 존재
  
  - 주요 기능
    - 회원 정보 : 등록(아이디 중복 확인, 비밀번호 일치 확인), 보기, 목록, 수정(정보, 비밀번호), 삭제(탈퇴)
    - 관리자 등록
    - 로그인, 로그아웃, 아이디/비밀번호 찾기(이메일)
    - 관리자/마이페이지
    - 회원 게시판 : 등록, 보기, 목록, 수정, 삭제, 페이징, 검색
    - 댓글 : 등록, 목록, 수정, 삭제
    - 상품 : 등록, 보기, 목록, 수정, 삭제, 순위, 페이징, 검색
    - 후기 : 등록, 목록, 수정, 삭제
    - 공지사항 : 등록, 보기, 목록, 수정, 삭제, 페이징, 검색
    - 홍보 배너 : 등록, 보기, 목록, 수정, 삭제
    - 장바구니 : 등록, 목록, 삭제, 전체 삭제
    - 코인(쇼핑몰 화폐) : 충전, 충전 내역, 사용 내역
    - 구매 상품 : 목록, 보기, 상품 다운로드 
    - 기타 : 로그인 성공 로그, 서비스 성능 로그(AOP), 접근 로그(Interceptor)
    
# 후기
  - 프로젝트로부터 느낀 점 : 간단해 보이는 기능이라도 이를 구현하는 것은 매우 복잡했고, 기반 지식과 기술이 상당히 많이 필요하다는 것을 느꼈습니다. 이를 통해 충분한 학습이 필요하다는 것을 느꼈습니다.
한편, 혼자 프로젝트를 수행하며 조언을 해줄 멘토가 없었기 때문에 개발에 더 어려움을 느꼈었던 것 같습니다. 그리고 개인이 개발하는 것에서 기능 구현에 한계를 느꼈기 때문에 여러 명이 개발을 하는 것이 다양하고 복잡한 기능을 실현할 수 있다고 느꼈습니다. 하지만 새로운 학습을 하는 측면에는 많은 성과를 얻었습니다.
  - 아쉬웠던 점 및 개선할 점 : 프로젝트를 수행하면서 초기 설계가 매우 중요하다는 것을 느꼈는데, 설계를 자세하게 하지 않고 개발을 하다 보니 효율이 많이 떨어져서 아쉬웠습니다. 이번 프로젝트를 발판으로 삼아 다음에 프로젝트를 수행 할 때는 설계를 자세하게 하여 개발의 효율성이 높아질 수 있도록 노력해야겠다고 느꼈습니다. 
한편, 리눅스를 통하여 배포를 하는 과정에서 데이터베이스, AWS, 리눅스 등의 배포 관련 지식이 많이 부족하여 배포를 하는데 어려움을 느꼈고, 부족한 실력으로 개발을 하다 보니 일부 원하던 기능과 다채로운 기능을 구현하지 못한 것이 아쉬웠습니다. 이러한 경험을 토대로 관련 지식을 함양하도록 노력해야겠다고 생각했습니다.
