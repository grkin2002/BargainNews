<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PagedList<HaoPianYiMvc2.Models.Review>>" %>
<div id="review_page">
 
    <%Html.RenderPartial("ReviewPageListUserControl", Model, new ViewDataDictionary(ViewData)); %>
 
</div>
<hr class="seperator" />
<% if (Request.IsAuthenticated)
   {%>
<div style="width: 80%">
    <% using (Ajax.BeginForm("PostReview", "Home",
           new AjaxOptions
           {
               HttpMethod = "POST",
               UpdateTargetId = "review_section",
               InsertionMode = InsertionMode.Replace

           }))
       { %>
    <%=Html.Hidden("FlyerId", Convert.ToInt64(ViewData["FlyerId"]))%>
    <%= Html.TextArea("Content", null, new { Style = "width:80%; height:100px; overflow:scroll; " })%>
    <br />
    <button type="submit">
        发布</button>
    <span id="Span" style="display: none">
        <img src="../../images/load.jpeg" alt="loading" /></span>
    <% } %>
</div>
<%}
   else
   {
%>想发表评论么？请先去登录, 
还没有注册？点击这里注册<%=Html.ActionLink("注册", "Register","Account") %><%
      
                            using (Html.BeginForm("LogOn", "Account", new { returnUrl = Request.Url }))
                            { %>
<%= Html.ValidationSummary(true, "Login was unsuccessful. Please correct the errors and try again.")%>
<div>
    <fieldset>
        <legend>Account Information</legend>
        <div class="editor-label">
            用户名称：
        </div>
        <div class="editor-field">
            <%= Html.TextBox("UserName")%>
        </div>
        <div class="editor-label">
            用户密码：
        </div>
        <div class="editor-field">
            <%= Html.Password("Password")%>
        </div>
        <div class="editor-label">
            <%= Html.CheckBox("RememberMe")%>
            记住我
        </div>
        <p>
            <input type="submit" value="Log On" />
        </p>
    </fieldset>
</div>
<% }
   }  %>
