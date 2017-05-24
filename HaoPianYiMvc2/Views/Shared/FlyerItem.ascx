<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<HaoPianYiMvc2.Models.Flyer>" %>
<div style="border: 2px solid gray; overflow:auto; padding: 5px; margin-bottom: 2px;">
    <div style="font-weight: bolder">
        <span id="status_link">
            <%= Html.Encode(StringValueDictionary.StatusStr[Model.Status])%>
        </span><span style="color: Red">
            <%= Html.Encode(StringValueDictionary.TypeStr[Model.Type])%>: </span><span style="color: Black">
                <%= Html.Encode(Model.Title) %>&nbsp 计算单价：<%= Html.Encode(String.Format("{0:F}", Model.Price)) %>
                @</span> <span style="color: Blue">
                    <%= Html.ActionLink(Model.Merchant.MerchantName, "ListFlyersOfThisMerchant", "Merchant", new { id=Model.MerchantId}, null)%>
                </span>
    </div>
    <div>
        <span style="font-weight: lighter; color: Blue;">
            <%=Html.ActionLink("评论("+Html.Encode(Model.Reviews.Count) +")", "Detail", "Home", new { id = Model.flyerId }, null)%>:
            <%=Html.Label("点击("+Model.ClickCount+"):") %>
          </span><span style="">由 &nbsp
                <%= Html.Encode(Html.getMemberUserNamebyUserId(Model.PostedBy)) %> &nbsp于
                <%= Html.Encode(String.Format("{0:g}", Model.CreateDate)) %>
                发布 </span>
    </div>
    <div style="padding-top: 10px;">
 <span>  
        <span style="margin-left:10px;">
        <a href='<%=Url.Action("Direct", "Home", new { sendUrl = Model.SendUrl, id = Model.flyerId }) %>', target="_blank" >
        <img alt="thumnail" align="right" border="0" src='<%=Url.Content("~/Photo/"+Model.ImgUrl) %>' /></a>
        <%= Html.ActionLink(Model.SendUrl, "Direct", "Home", new { sendUrl = Model.SendUrl, id = Model.flyerId }, new { target="_blank"})%>
        </span><br />
        
        描述：
        <%= Html.Encode(Model.Description) %></span> 
        优惠代码：
        <%= Html.Encode(Model.Promote.PromoteCode) %>
        分类：
        <%=Html.Encode(Model.Category.CategoryName)%>
    </div>
    <br />
</div>
