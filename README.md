# Smart cut
[22조] 부산/경남 1반 1조

## 프로젝트 소개
* **AI 모델을 활용한 헤어스타일 추천 서비스**
  * 개발기간 : 2022/11/28 ~ 2023/01/06
  * 팀원 : 이유옥, 마지혜, 이준혁, 문성균, 박노명, 김병수, 김정현

## 개발 배경
  * 평소 머리 스타일 선택에 어려움을 겪거나, 디자이너에게 원하는 스타일을 정확하게 표현하지 못하는 사람들을 위해 AI 모델(얼굴형 분석 기반)로 헤어스타일을 추천하는 서비스를 만들어보고자 하였다.

  * 미용실 가격표에 기재된 가격으로 예상하고 방문했지만, 기장 추가 / 머릿결 상태에 따른 시술 추가 / 머리숱에 따른 비용 추가 등 예상 금액을 초과한 비용이 청구되어 당황스러웠던 경험이 있다.  
  또한, 애써 예약하고 방문하였더니 시술을 거부하는 경우나 얼떨결에 원하지 않은 디자이너 추천 시술을 받은 경험이 있을 것이다.

  * 예약 서비스의 중개 수수료가 ‘카카오 헤어샵’ 기준 25% 정도로 매우 높다는 사실을 알게 되었다.  
 기존 서비스에서의 불편함을 개선하고, 소비자와 미용실(디자이너)이 상생할 수 있는 미용실 예약 앱을 만들어보고자 한다.

  * 관련기사   
  [카카오헤어샵, ‘첫방문 수수료 25%’ 네이버 플레이스보다 ‘10배 높아’](http://www.newsworker.co.kr/news/articleView.html?idxno=128771)

  * 미용실 예약 앱 시장조사 자료   
  https://acrobat.adobe.com/link/review?uri=urn:aaid:scds:US:5ed500c6-c1b2-373a-a8c6-e6336ebb1ab3

 ## 프로젝트 구성
  * 얼굴 분석 AI 서비스
  * 로그인
  * 회원가입
  * 샵 / 디자이너 페이지
  * 예약 / 채팅 서비스
  <img src="/uploads/ec6befe5d2f02ac95f58d33d69baec12/serviceflow.png" width="700" />

## Model Architecture

`2-TIER`

  <p align="left">
    <img src="/uploads/49403a059cc3d0c8b82197f9c41cad1f/architecture.png" width="700" />
  </p>

## UI/UX
 `[UI/UX]`  
https://www.figma.com/file/xI1FL8C4iymrSNvYi1LuMG/Smart-Cut?node-id=0%3A8239&t=oONe8M7kks2O6PRG-1
 
  <p align="left">
   <img src="/uploads/ce819c9e59bc48d1538ab9f682861e38/logo.JPG" width="200" />
  </p>
 
  <p align="left">
   <img src="/uploads/2bcc577a99351aa7e89bcb07c3325c8c/serviceexp.JPG" width="700" />
  </p>

  <p align="left">
   <img src="/uploads/c6f5db1bd68b4f5e9ad69344c5393b87/login_page.JPG" width="450" />
  </p>

  <p align="left">
   <img src="/uploads/168afe8d2296d89ac19ac03985eee8e3/join_page.JPG" width="450" />
  </p>

  <p align="left">
   <img src="/uploads/82977ad835cb4879bf1253bb2b8a7eb8/mail.jpg" width="700" />
  </p>

  <p align="left">
   <img src="/uploads/911cd420ccce39eafaa42aef4d526a98/changepw.JPG" width="700" />
  </p>

  <p align="left">
   <img src="/uploads/0b7dc830e75ddcb6edf2f5a101edd384/salondetail.JPG" width="700" />
  </p>  

  <p align="left">
   <img src="/uploads/fd5042acc091721dd10642c1ffbc66d2/Review.JPG" width="700" />
  </p>

  <p align="left">
   <img src="/uploads/e89ae4717fa44534e8b82717e5c74706/chatroom.JPG" width="450" />
  </p>

  <p align="left">
   <img src="/uploads/220e05960dc04c56a87a2565d8c399cc/reservation.JPG" width="700" />
  </p>

  <p align="left">
   <img src="/uploads/f01b232a136de6320adb6899c9057d60/profile.JPG" width="700" />
  </p>

  

## DataBase
  * ERD
   
   <img src="/uploads/89a713009d9ed8996b585c1902f21f7a/ERD.jpg" width="1000" />
   
   
## 모델 사용절차
 * 남성 사용자 화면  

  <p align="left">
   <img src="/uploads/623868e4c43bfc2cc8cb62d37fbe0e4d/mainman.JPG" width="700" />
  </p>

  <p align="left">
   <img src="/uploads/d4b86e825ac9156fabc8d75c564d9d08/AIman.JPG" width="700" />
  </p>

  <p align="left">
   <img src="/uploads/02323c70272b107e6e705e97bd6bf981/resultman.JPG" width="950" />
  </p>

  <p align="left">
   <img src="/uploads/d8ecfa036bd6bc26c91e4ce8301a8ef5/resultmain.JPG" width="700" />
  </p>

* 여성 사용자 화면

  <p align="left">
   <img src="/uploads/6a82d3a2a50635a17023de5303d479d8/mainwoman.JPG" width="450" />
  </p>

  <p align="left">
   <img src="/uploads/4dafa36633d10ea3397355dea429a547/aiwoman.JPG" width="700" />
  </p>

  <p align="left">
   <img src="/uploads/7110bf7ef4de68d9c26920253f085dbd/resultwoman.JPG" width="950" />
  </p>

  <p align="left">
   <img src="/uploads/220f511bf6692b5b893a51372cefd623/resultmain.JPG" width="700" />
  </p>

  

 
## SMART CUT 실행방법

 ### 사전 준비
 
 #### 소스코드 다운로드
 ```
 git clone http://aivle.co.kr/gitlab/aivle-2-ai/1-22/smart_cut.git
 cd smart_cut
 ```

 #### 초기 환경 설정
 
 * C++ 다운로드 및 설치

  https://visualstudio.microsoft.com/ko/thank-you-downloading-visual-studio/?sku=BuildTools

  링크 접속 후 Visual Studio 다운로드 -> Visual C++ 선택 후 설치

   
 * CMake 다운로드 및 설치  

  http://cmake.org/download  

  링크 접속 후 OS 버전에 맞는 CMake 다운로드 및 설치

  ```
  pip install cmake
  ```

   
 * dlib 설치

  http://dlib.net/    

  링크 접속 후 최신 버전 dlib 다운로드 및 C 드라이브에 압축 해제
  ```
  cd
  cd dlib-19.24
  python setup.py install
  pip install dlib
  ```
   
 * 전체 패키지 설지
  ```
  pip3 install -r requirements.txt
  ```

  * Mysql DB 생성(기본데이터 및 프로시저)
  ```
  mysql -u [사용자] -p
  source C:\smart_cut\20230102_smart_cut_dump.sql
  ``` 

 * 데이터베이스 모델 생성 및 적용
  ```
  python manage.py makemigrations
  python manage.py migrate
  ``` 
   
 * 로컬호스트 서버 구동
  ```
  python manage.py runserver
  ``` 
   
 ### 프로그램 실행  

 * SMART CUT 초기 페이지 (링크) 접속
 
    http://127.0.0.1:8000/users/logo/

    

 


## 개발 환경   
* Front

<p align="left">
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"/>
  <img src="https://img.shields.io/badge/Sass-CC6699?style=flat&logo=Sass&logoColor=white"/>
  <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white"/>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white" />
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white"/>
  <img src="https://img.shields.io/badge/Vue.js-4FC08D?style=flat&logo=Vue.js&logoColor=white" />
  <img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=Figma&logoColor=white" />

</p>

* Back

<p align="left">
  <img src="https://img.shields.io/badge/Django-092E20?style=flat&logo=Django&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white" />

</p>

* AI

<p align="left">
  <img src="https://img.shields.io/badge/Python-3776AB?style=flat&logo=Python&logoColor=white" />
  <img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=flat&logo=TensorFlow&logoColor=white" />
  <img src="https://img.shields.io/badge/OpenCV-5C3EE8?style=flat&logo=OpenCV&logoColor=white" />
  <img src="https://img.shields.io/badge/Keras-D00000?style=flat&logo=Keras&logoColor=white" />
  <img src="https://img.shields.io/badge/Dlib-008000?style=flat&logo=Dlib&logoColor=white" />
  <img src="https://img.shields.io/badge/NumPy-013243?style=flat&logo=NumPy&logoColor=white" />
  <img src="https://img.shields.io/badge/pandas-150458?style=flat&logo=pandas&logoColor=white" />

</p>

* Management tool & others

<p align="left">
  <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat&logo=Visual Studio Code&logoColor=white" />
  <img src="https://img.shields.io/badge/GitLab-FC6D26?style=flat&logo=GitLab&logoColor=white" />
  <img src="https://img.shields.io/badge/Redmine-B32024?style=flat&logo=Redmine&logoColor=white" />
  <img src="https://img.shields.io/badge/Google Colab-F9AB00?style=flat&logo=Google Colab&logoColor=white" />
  <img src="https://img.shields.io/badge/Microsoft Teams-6264A7?style=flat&logo=Microsoft Teams&logoColor=white" />
</p>
