# lib 디렉토리 구조
1. data
    1) datasource : dio 객체 관리
    2) model : database table을 참조하여 작성, get/set, json parse 등 처리
    3) repository : url 및 dio 호출, app_constants 에 url 상수로 등록
2. helper
    1) date_converter
    2) email_checker
    3) json_converter
    4) price_converter
3. localization
   다국어 적용
   example : getTranslated('CONTENTS_HINT', context)
   다국어 json 파일 위치 : assets/language/ko.json
4. provider
   백엔드 api 연동
   data - repository 호출 - response 로 json parse 하여 model 에 담아서 사용
5. theme
   dark / light 테마 제공
6. util
    1) app_constants : base_url, url, 상수 등록
    2) images : assets 에 있는 이미지 경로 등록
7. view
    1) basewidget : appbar, button, dialog, dropdown, radio, textarea, textfield 등의 기본 위젯 등록
    2) screen : 아래 참조, 사용자에게 보여줄 화면을 구성

# lib/screen 디렉토리 구조
1. chat
2. disposal : 폐차 화면
3. home : 메인 화면
    1) widget
4. myprocess : 내 진행 현황 화면
5. onboarding : 온보딩 화면
6. review : 이용 후기 화면
7. setting : 설정 화면
8. splash : 스플래시 화면

# backend call 구조
provider 패턴은 하나의 객체만 유지
1. provider 패턴 호출 순서
    1) screen
    2) provider
    3) repo
    4) model
2. provider 패턴 등록
    1) di_container
    2) main

# 각종 계정 정보(비밀번호 담당자 문의)
1. 구글플레이 개발자 계정
   wrc9448@gmail.com
2. 애플 개발자 계정
   wrc9448@gmail.com
3. aws 계정
   wrc9448@naver.com
4. 공공데이터 포털
   wrc9448

# 인프라 정보(aws)
1. nodejs
2. pm2
3. nginx
   /etc/nginx/
4. ubuntu 22.04 : aws 웹으로 터미널 접근
5. 52.79.240.88
6. mysql : sudo mysql, config.json 에 접속정보 있음
7. /home/ubuntu/project/pyechago_web : git url (https://gitlab.com/jsoftware1/projects/pyechago/pyechago_web)

```shell
sudo apt update
sudo apt upgrade
mysql -uworldrecycling -p
cd project/pyechago_web/
sudo apt install npm
npm install
vi .env
mkdir config
vi config/config.json
sudo apt install mysql-server
sudo systemctl start mysql.service
sudo mysql
sudo mysql -uworldrecycling -p
npm start
sudo npm i -g nodemon
sudo npm i -g pm2
sudo npm i -g sequelize-cli
sudo apt install nginx
sudo vi /etc/nginx/sites-available/pcgo
sudo vi /etc/nginx/nginx.conf 
pm2 init simple
vi ecosystem.config.js 
cd seeders/
rm 00.supplierusers.js 02.carinfo.js 03.clients.js 04.process.js 05.request.js imageSetting.js notice.js parts.js review.js users.js 
sequelize init
sequelize db:seed:all
vi .sequelizerc
npm start
sudo service nginx status
vi /etc/nginx/nginx.conf 
ln /etc/nginx/sites-available/pcgo /etc/nginx/sites-enabled/pcgo
sudo ln /etc/nginx/sites-available/pcgo /etc/nginx/sites-enabled/pcgo
sudo service nginx restart
```

# 관리자 페이지 접속 정보
admin / admin
