<%@ Page Language="C#" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="wojilu" %>
<%@ Import Namespace="wojilu.sample.Controller" %>
<%@ Import Namespace="wojilu.sample.Domain" %>
<%@ Import Namespace="wojilu.View" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>wojilu cms : 文章管理系统</title>
<link href="~css/wojilu._common.css?v=#{cssVersion}" rel="stylesheet" type="text/css" />
<link href="~css/wojilu.cms.css?v=#{cssVersion}" rel="stylesheet" type="text/css" />
<script>var __funcList = []; var _run = function (aFunc) { __funcList.push(aFunc); }; var require = { urlArgs: 'v=#{jsVersion}' };</script>
</head>

<body>
    
    <script runat="server">
        
        public String getSelected( Category current, Category c ) {

            string selected = "class=\"selected\"";

            if (current == null) return "";
            if (current.Id == c.Id) return selected;
            return "";
        }
        
    </script>

<div id="bodyWrap">
	<div id="header">
    	<div id="logo"><a href="~/"><img src="~img/site/logo.gif" alt="" title="" border="0" /></a></div>
    	<div id="banner"></div>
    	<div id="userLogin"><a href="#{adminLink}">后台管理</a> <br /><a href="#{loginLink}">用户登录</a></div>
    </div>
    
    <div id="menu">
        <ul>
        <li #{homeSelected}><a href="~/">首页</a></li>
        
        <%
            Category current = ctx.getItem( "category" ) as Category;
            List<Category> categories = v.data( "categories" ) as List<Category>;
            foreach (Category x in categories)
            {
                String xlnk = link.to(new CategoryController().Show, x.Id);
                String xselected = getSelected( current, x );
        %>

        <li <%=xselected %>><a href="<%=xlnk %>"><%=x.Name %></a></li>       
        <% } %>     
        </ul>
    </div>
        
    #{layout_content}
    
     <div id="footer">
    	<div class="footerNav">
    	    <div>
    	        <%
	                List<Footer> footers = v.data("footers") as List<Footer>;
	                foreach (Footer x in footers)
	                {
	            %>

    	        <a href="<%=link.to( new FooterController().Show, x.Id ) %>"><%=x.Name %></a>
                <% } %>

    	    </div>
            <div style="margin-top:5px;color:#aaa;">页面运行时间：#{pageElapsedMilliseconds}</div> 
        </div>
        
     	<div class="copyright"><a href="http://www.wojilu.com"><img src="~img/site/wojilu.jpg" /></a></div>    
    </div> 

</div>
<script data-main="~js/main" src="~js/lib/require-jquery-wojilu.js?v=#{jsVersion}"></script>
</body>
</html>