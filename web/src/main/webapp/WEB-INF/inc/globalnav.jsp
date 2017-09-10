<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top tbsheader">
    <div class="col-md-12" style="border-top:5px solid #0766a8;"></div>
    <div class="col-md-12" style="background-color:#eeeeee;text-align:right">
        <div class="container">
           <div class="row">
             <div class="col-md-12">
				<sec:authorize access="isAnonymous()">
		            <ul class="topright">
		              <li><a href="<c:url value="/signup.flow"/>" class="topright">注册</a></li>
		              <li><a href="<c:url value="/login.html"/>" class="topright">登录</a></li>
		            </ul>			
		        </sec:authorize>
				<sec:authorize access="isAuthenticated()">
				   <ul class="topright">
				      <span class="greeting">Hi <sec:authentication property="principal.firstName" /></span>
		              <li style="width:100px;"><a href="<c:url value="/account/basic.html"/>">我的服务宝</a></li>
		              <li><a href="<c:url value="/j_spring_security_logout"/>">退出</a></li>
		            </ul>
				</sec:authorize>	            
             </div>
           </div>
        </div>
    </div>
    <div class="container">
        <div class="col-md-3 tbslogo">
            <a href="<c:url value="/index.html"/>"><img src="/images/logo.png" class="img-responsive" style="width:150px"></a>
        </div>
        <div class="col-md-6 topsearch">
            <div> 
                <div class="input-group tbssearch">
                  <input type="text" class="form-control" placeholder="输入店铺名称、关键字">
                  <span class="input-group-btn">
                    <input class="btn btn-default" type="submit" value="搜 索">
                    </span>
                </div><!-- /input-group -->
            </div>
            <div>
                &nbsp;&nbsp;<a href="#" class="tbssearchword">房地产商</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tbssearchword">美容美发</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tbssearchword">大学直通车</a>
            </div>
        </div>
        <div class="col-md-3 tbstele">
            <div class="row">
                <div class="col-md-12 tbs-telelphone-call">服务热线电话</div>
                <div class="col-md-12 tbs-telelphone"><span class="glyphicon glyphicon-phone-alt" aria-hidden="true" style="font-size:23px;left:-10px;color:#ed8f5b"></span>604-998-1889</div>
            </div>
        </div>
    </div>
    <div style="background-color:#414040;">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>        
                <div class="tbshiddenname">三桥服务</div>
            </div>

            <div class="collapse navbar-collapse js-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown dropdown-large">
                        
                        <a href="<c:url value="/index.html"/>" class="tbs-nav-blue tbs-nav-home"><span class="glyphicon glyphicon-home" aria-hidden="true" style="font-size:17px;line-height: 28px;color:#ffffff"></span></a>
                    </li>
                    <li class="dropdown dropdown-large">
                        <a href="#" class="dropdown-toggle tbs-nav-grass" data-toggle="dropdown">居家生活</a>
                        <ul class="dropdown-menu dropdown-menu-large row tbs-nav-grass">
                            <li class="col-sm-4">
                                <ul>
                                    <li class="dropdown-header">Glyphicons</li>
                                    <li><a href="#">Available glyphs</a></li>
                                    <li class="disabled"><a href="#">How to use</a></li>
                                    <li><a href="#">Examples</a></li>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">Dropdowns</li>
                                    <li><a href="#">Example</a></li>
                                    <li><a href="#">Aligninment options</a></li>
                                    <li><a href="#">Headers</a></li>
                                    <li><a href="#">Disabled menu items</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-4">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-4">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-large">
                        <a href="#" class="dropdown-toggle tbs-nav-green" data-toggle="dropdown">房屋相关</a>
                        <ul class="dropdown-menu dropdown-menu-large row tbs-nav-green">
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-large">
                        <a href="#" class="dropdown-toggle tbs-nav-yellow" data-toggle="dropdown">教育培训</a>
                        <ul class="dropdown-menu dropdown-menu-large row tbs-nav-yellow">
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-large">
                        <a href="#" class="dropdown-toggle tbs-nav-orange" data-toggle="dropdown">汽车相关</a>
                        <ul class="dropdown-menu dropdown-menu-large row tbs-nav-orange">
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-large">
                        <a href="#" class="dropdown-toggle tbs-nav-pink" data-toggle="dropdown">商务服务</a>
                        <ul class="dropdown-menu dropdown-menu-large row tbs-nav-pink">
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-large">
                        <a href="#" class="dropdown-toggle tbs-nav-blue" data-toggle="dropdown">休闲娱乐</a>
                        <ul class="dropdown-menu dropdown-menu-large row tbs-nav-blue">
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                            <li class="col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Navbar</li>
                                    <li><a href="#">Default navbar</a></li>
                                    <li><a href="#">Buttons</a></li>
                                    <li><a href="#">Text</a></li>
                                    <li><a href="#">Non-nav links</a></li>
                                    <li><a href="#">Component alignment</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div><!-- /.nav-collapse -->
    </div>
</nav>