<%@ Page Language="C#" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="wojilu" %>
<%@ Import Namespace="wojilu.sample.Domain" %>
<%@ Import Namespace="wojilu.View" %>
<div>
    <ul>
        <%
            List<Article> list = v.data( "list" ) as List<Article>;
            foreach (Article x in list) {
        %>
        <li class="articleItem">
            <div style="font-weight: bold; margin-top: 10px;">
                <%= x.Title %>
            </div>
            <div><%= x.Content %></div>
        </li>
        <%}%>
    </ul>
</div>
