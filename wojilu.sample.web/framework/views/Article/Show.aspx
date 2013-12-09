<%@ Page Language="C#" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="wojilu" %>
<%@ Import Namespace="wojilu.sample.Domain" %>
<%@ Import Namespace="wojilu.View" %>

<%
    Article a = v.data("a") as Article;
%>

<div>
    <h4 class="titleh2"><%= a.Title %></h4>
    <div><%= a.Content %></div>
</div>