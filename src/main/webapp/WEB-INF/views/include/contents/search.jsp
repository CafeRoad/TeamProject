<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style type="text/css">
 
.box_search_1{
  margin: 0px auto;
  width: 300px;
  height: 50px;
  }
  
.box_search_1 input#search{
  width: 300px;
  height: 50px;
  background: #ffffff;
  border: none;
  font-size: 10pt;
  float: left;
  color: #262626;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
 
   
  -webkit-transition: background .55s ease;
  -moz-transition: background .55s ease;
  -ms-transition: background .55s ease;
  -o-transition: background .55s ease;
  transition: background .55s ease;
}

.box_search_1 input#search::-webkit-input-placeholder {
   color: #dcdcdc;
}
 
.box_search_1 input#search:-moz-placeholder { /* Firefox 18- */
   color: #dcdcdc;  
}
 
.box_search_1 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #dcdcdc;  
}
 
.box_search_1 input#search:-ms-input-placeholder {  
   color: #dcdcdc;  
}

.box_search_1 .icon{

  position: absolute;
  top: 50%;
  margin-left: 17px;
  margin-top: -10px;
  z-index: 1;
  color: #4f5b66;
}

.box_search_1 input#search:hover, .box_search_1 input#search:focus, .box_search_1 input#search:active{
    outline:none;
    background: #FFDAB9;
  }
</style>
	<!-- Two -->
	<section id="two" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
			<div class="box_search_1">
				<div class="search">
					<span class="icon"><i class="fa fa-search"></i></span>
      				<input type="search" id="search" placeholder="Search..." />
				</div>
			</div>
			</header>
		</div>
	</section>