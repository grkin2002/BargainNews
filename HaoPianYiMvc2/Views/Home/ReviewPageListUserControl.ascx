<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PagedList<HaoPianYiMvc2.Models.Review>>" %>

<%int i = 1; foreach (var item in Model)
      { %>
<div style="border-bottom: 1px dashed black; overflow: auto; margin-bottom: 5px;
    padding: 5px;">
    <div>
        <span>(<%=i++   %>)&nbsp&nbsp Posted:<%= Html.Encode(Html.getMemberUserNamebyUserId(item.UserID)) %>&nbsp&nbsp
            Posted Date:<%= Html.Encode(String.Format("{0:g}", item.ReviewDate)) %>
        </span>
        <br />
    </div>
    <div>
        <%= Html.Encode(item.Content) %>
    </div>
</div>
<% }    %>

<%=Html.AjaxPager(Model, "PagedListReview",  new {  FlyerId = ViewData["FlyerId"].ToString() }, new PagerOptions { PageIndexParameterName = "pageIndex" }, new AjaxOptions { UpdateTargetId = "review_page" }, null)
 %>