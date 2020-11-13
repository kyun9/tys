```sql
create databases test;
create users;
cerate user 'test1'@'%' identified 'test1234';

```



```
applicationContext.xml
	jndi
	transction
		annotaion 설정
			-- rollbakc 처리; 3개처리중 2개성공 1개 이상있을때
	sqlSessionFactory
		db connection
		mybatisConfig.xml route
		mapper route
	sqlSession
		
		
			
		

```

```
xmlns:tx= "http://www.springframework.org/schema/tx"
xmlns:jndi= "http://www.springframework.org/schema/jee"

<jndi:jndi-lookup jndi-name="jdbc/test" resource-ref ="true" id ="dataSourceNm">
    <bean id ="txManagerDB" class ="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <property name="dataSourve" ref ="dataSourceNm" />
    </bean>
<tx:annotation-driven transaction-manager="txManagerDb" />

```



server.xml -> context안에

```xml
<Resource auth="Container" 
	driverClassName="com.mysql.cj.jdbc.Driver" name="jdbc/text"
	password="root"
	type="javax.sql.DataSource"
	url="jdbc:mysql://127.0.0.1:3306/tys_db?serverTimezone=UTC"
	username="root"
>

```





컨트롤러 - 데이터 받아오기 @responseBody

비동기식으로 중복체크 == 값을 줌;;

​	ex 비밀번호 틀리면 0001, 다틀리면 0002, 5번 실패하면 0003

​		그냥 controller안에서 카운트를 올리면된다.

카운트올리고 처리하는 부분은 service에서 진행



##### AJAX 방식

1. SERIALIZE 해서 객체로 받기

2. JSON객체를 만들어서 주고받기

3. FORM태그로해서 주고받기



​	beforeSend - 대용량데이터 처리시 비동기과정중에 하는것 = 로딩바

​					success나 error결과가 나오면 로딩바 멈춰주면된다.



##### session

>  request.getSession().setAttribute()) 세션집어넣기, setMaxInactiveInterval() 세션 유지시간







```mapper
# 쿼리가 ?로 인식
$ 쿼리를 값이 매핑으로 인식 (테이블명같이 변동이 안되는것에 사용)
```







1. 로그인/로그아웃 금요일
2. 회원등록/수정 월요일
3.  interceptor 화요일
4. 합치기





회원등록 (ajax (아이디 중복체크, 비밀번호 확인), 사진업로드) ,

interceptor핸들링,

회원관리 수정





