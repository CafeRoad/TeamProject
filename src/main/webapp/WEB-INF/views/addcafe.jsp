<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
  <fieldset>
    <legend>카페 등록 </legend>
    
    <div class="form-group">
      <label for="InputCafeId">이름</label>
      <input class="form-control" id="cafe_id" type="text" placeholder="Enter CafeId">
    </div>
    
    <div class="form-group">
      <label for="exampleInputHomepage1">홈페이지</label>
      <input class="form-control" id="homepage" aria-describedby="HomepageHelp" type="text" placeholder="Enter Homepage">
      <small class="form-text text-muted">예시:http://www.Homepage.com</small>
    </div>
    <div class="form-group">
      <label for="exampleSelectGu">구</label>
      <select class="form-control" id="gu">
        <option>강남구</option>
        <option>강동구</option>
        <option>강북구</option>
        <option>강서구</option>
        <option>관악구</option>
        <option>광진구</option>
        <option>구로구</option>
        <option>금천구</option>
        <option>노원구</option>
        <option>도봉구</option>
        <option>동대문구</option>
        <option>동작구</option>
        <option>마포구</option>
        <option>서대문구</option>
        <option>서초구</option>
        <option>성동구</option>
        <option>성북구</option>
        <option>송파구</option>
        <option>양천구</option>
        <option>영등포구</option>
        <option>용산구</option>
        <option>은평구</option>
        <option>종로구</option>
        <option>중구</option>
        <option>중랑구</option>
      </select>
    </div>
    <div class="form-group">
      <label for="InputAddress">나머지 주소</label>
      <input class="form-control" id="address" type="text" placeholder="Enter Address">
    </div>
    
    <div class="form-group">
      <label for="InputSNS">SNS</label>
      <input class="form-control" id="sns" type="text" placeholder="Enter sns">
    </div>

    <div class="form-group">
      <label for="exampleEvent">행사</label>
      <textarea class="form-control" id="event" rows="2"></textarea>
    </div>
    <div class="form-group">
      <label for="exampleIntro">카페 소개</label>
      <textarea class="form-control" id="intro" rows="2"></textarea>
    </div>
     
    </fieldset>
    <fieldset>
    <button class="btn btn-primary" type="submit">Submit</button>
    
    </fieldset>
</form>
</body>
</html>