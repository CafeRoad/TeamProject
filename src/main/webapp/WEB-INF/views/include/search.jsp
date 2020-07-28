<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">


<style>
* {box-sizing: border-box;}
body{margin: 0;}
div {padding: 30px 0}
form {
  position: relative;
  width: 300px;
  margin: 0 auto;
}
.d1 {background: #ed7d31;}

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

<div class="d1">
<br>
  <form action="/cafe/search">
  <input type="text" name="search" placeholder="search..."/>
  <button type="submit"></button>
  </form>
  <br>
</div>
