<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">


<style>

.form1 {
  position: relative;
  width: 300px;
  margin: 0 auto;
}
.d1 {background: #ef8c48;}

.d1 input {
  width: 100%;
  height: 42px;
  padding-left: 5px;
  border: 2px solid #7BA7AB;
  border-radius: 5px;
  outline: none;
  background: #ffffff;
  color: #000000;
}
.d1 button {
  position: absolute; 
  top: 0;
  right: 0px;
  width: 42px;
  height: 42px;
  border: none;
  background: #7BA7AB;
  border-radius: 0 5px 5px 0;

}
.d1 button:before {
  content: "\f002";
  font-family: FontAwesome;
  font-size: 16px;
  color: #ffffff;
}
</style>

</head>
<body>
<div class="d1">
<br><br>
  <form class="form1">
  <input type="text" placeholder="search...">
  <button type="submit" onClick="location.href='/cafe/search'"></button>
  </form>
  <br><br>
</div>
</body>
</html>