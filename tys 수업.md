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



##### AJAX 방식 3가지

1. SERIALIZE 해서 객체로 받기

2. JSON객체를 만들어서 주고받기

3. FORM태그로해서 주고받기



​	beforeSend - 대용량데이터 처리시 비동기과정중에 하는것 = 로딩바

​					success나 error결과가 나오면 로딩바 멈춰주면된다.



##### session

>  request.getSession().setAttribute()) 세션집어넣기, setMaxInactiveInterval() 세션 유지시간







```mapper
#{} 쿼리가 ?로 인식
${} 쿼리를 값이 매핑으로 인식 (테이블명같이 변동이 안되는것에 사용)
```







1. 로그인/로그아웃 금요일
2. 회원등록/수정 월요일
3.  interceptor 화요일
4. 합치기





회원등록 (ajax (아이디 중복체크, 비밀번호 확인), 사진업로드) ,

interceptor핸들링,

회원관리 수정



### 사진업로드

* 따로 AJAX를 통해 임시폴더를 만들고 사진을 관리(저장/삭제)할 필요가 없다.
* JS를 통해 URL형식으로 미리보기를 만들수 있다.
* 그리고나서 form태그의 등록을 통해 image의 value값을 보내주면된다.



### **Transactional** 

```java
@Transactional
public static void function{
	....
}
```

* 트랜잭션의 성질 ACID
  * 원자성
  * 일관성
  * 격리성
  * 지속성
* 사용이유 
  * 중간에 데이터처리에 있어서 전체적으로 트랜젹션을 관리할수 있따.
  * 만약 작동하다 중단될시 전체를 Rollback을 통해 원래 상태로 되돌린다.
  * 이상없이 완료가 되면 commit을 진행한다.



### sqlSession Batch처리

* 일반적인 sqlSession은 
  * sqlsession.open -> 1개 작업 ->sqlSession.close 순서대로 진행된다.
    * 만약 작업이 10000000개라면 어떨까?
    * sqlsession을 열고 닫으면서 10000000개의 작업을 수행해야된다.
  * 수행시간에 있어서 문제가 있을것이다.
  * Batch를 사용해서
    * sqlsession.open -> 10000000개 작업 ->sqlSession.close 을 수행할수 있따.
    * 문제가 생길시 Rollback을 진행한다.



### try catch

* method를 호출해주는쪽에 try catch를 통해 예외처리를 해주면된다.
* 각각해주면 좋지만 throw만 던져주고
* 최종적으로 받는 곳에서 일치하는 Exception마다 예외를 받아주면된다.



### 제약조건삭제

```sql
### 제약조건확인
select * from information_schema.table_constraints where information_schema.table_constraints.table_schema = "#{dbName}";

### 제약조건 삭제
ALTER TABLE #{table} DROP CONSTRAINT #{제약조건삭제};
```



### table 내용날리기

```sql
delete from #{table명} //테이블 안에 데이터초기화
truncate table users //테이블삭제
drop table users //테이블삭제
```



### 두 table을 join해서 출력하고싶을때

```
mapper에서 조인하고
vo에서 필요한 부분만 변수를 두어서 객체로 관리한다.
```



