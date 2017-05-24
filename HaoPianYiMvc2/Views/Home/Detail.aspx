<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HaoPianYiMvc2.Models.Flyer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="overflow: auto">
        <div style="font-weight: bolder">
            <span style="color: Red">
                <%= Html.Encode(StringValueDictionary.TypeStr[Model.Type])%>: </span><span style="color: Black">
                    <%= Html.Encode(Model.Title) %>&nbsp 计算单价：<%= Html.Encode(String.Format("{0:F}", Model.Price)) %>
                    @</span> <span style="color: Blue">
                        <%= Html.ActionLink(Model.Merchant.MerchantName, "ListFlyersOfThisMerchant", "Merchant", new { id=Model.MerchantId}, null)%>
                    </span>
        </div>
        <div style="padding-top: 10px;">
            <a href='<%=Url.Content("/"+Model.flyerId+"/"+Model.SendUrl) %>'>
                <img alt="thumnail" align="right" border="0" src='<%=Url.Content("~/Photo/"+Model.ImgUrl) %>' /></a>
            <%= Html.ActionLink( Model.SendUrl, "/"+Model.flyerId+"/"+Model.SendUrl, "Redirect") %><br />
            描述：
            <%= Html.Encode(Model.Description) %><br />
            优惠代码：
            <%= Html.Encode(Model.Promote.PromoteCode) %><br />
            分类：
            <%=Html.Encode(Model.Category.CategoryName)%>
        </div>
    </div>
    <hr class="seperator" />

    <div id="review_section">
            <%Html.RenderPartial("ReviewMessage", Model.Reviews.AsQueryable().OrderByDescending(p=>p.ReviewDate).ToPagedList(0,10), new ViewDataDictionary(ViewData)); %>
    </div>
 
</asp:Content>
