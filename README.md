# sprint-CloudWatch

## step 1

테라폼으로 vpc, launch-template, autoscaling, user-data ...
```
terraform init
terraform apply
```
## step 2 - 1 (직접생성)
### asg-alarm.tf로 경보 생성 후 sns 연결필요.

AWS console에서 경보생성
[AWS 경보생성 hands-on](https://docs.aws.amazon.com/ko_kr/AmazonCloudWatch/latest/monitoring/US_AlarmAtThresholdEC2.html)

지표선택 CPUUtilization

지표 및 조건 지정 p95
[CloudWatch 통계 정의 참조](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html)

Scale-in 조건: CPU 40% 이하
Scale-out 조건: CPU 50% 이상
지표수집기간 5분

경보상태 SNS 주제 생성
생성시 email 아무거나..(필요없으나 여기서 생성시 필수항목)

경보생성 완료

## step 2 - 2 (테라폼으로 생성후 연결)
### Scale-in, out 각각 sns 추가해줄것.
경보 - 작업 - 편집 - 바로 다음 누르고 - 알림 추가
알림 - 새 주제 생성 - email 아무거나 - 주제 생성

## step 3
Lambda 함수 생성
런타임 python 3.x
블루프린트 `cloudwatch-alarm-to-slack-python` 기반 코드작성됨.

code: urclass 참조 후 `username`부분 자기이름으로 수정 (참고: username=봇이름)

환경 변수 등록

KEY | VALUE
:-:|:-:
HOOK_URL | `https://discord.com/api/webhooks/**************1336/o9yLba95y4asEZywwhZYTqH_RvSUFSV1BPlUjq57ydboPc60xDhJ2lZ28xwNdAwQBYPg`


트리거에 sns 연결

## step 4

ec2 연결 

`session-manager`가 없으신분들은 아래와 같이 수동변경 하거나, 테라폼의 시작템플릿에 `key_name: "MyKeyPair"` 등록

1. 시작템플릿에서 편집 - 새로운버전 생성 - pem 사용체크

2. 오토스케일링에서 인스턴스 새로고침 - 새로고침 시작 - 일치 건너띄기 체크해제 - 원하는구성 시작 템플릿 업데이트 체크 - 인스턴스 새로고침 시작(5분정도 걸림)

3. ec2 연결 후 `$ stress -c 1 --timeout 300s` 입력

![](https://velog.velcdn.com/images/jm1225/post/447d1df1-ac5a-4838-9fda-744b75f026d8/image.png)

![](https://velog.velcdn.com/images/jm1225/post/18859bbc-ab92-413a-8349-33a8aa7422dd/image.png)

![](https://velog.velcdn.com/images/jm1225/post/268b76e5-7fd9-4363-916d-8782ae7caeca/image.png)

![](https://velog.velcdn.com/images/jm1225/post/e4aac2b1-cea0-465e-be0b-b466cc3b4105/image.png)
