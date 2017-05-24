<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<PagedList<HaoPianYiMvc2.Models.Flyer>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Flyer管理页面</h2>
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
        <%=Html.Pager(Model, new PagerOptions{PageIndexParameterName="id"}) %>
    </p>
    <% foreach (var item in Model)
       { %>
    <div style="border: 1px dashed blue;">
        <table width="750">
            <tr>
                <td>
                    (
                    <%= Html.Encode(item.flyerId) %>
                    ) <strong>
                        <%= Html.Encode(item.Title) %></strong> (Click:
                    <%= Html.Encode(item.ClickCount) %>
                    / View:
                    <%= Html.Encode(item.ViewCount) %>)
                </td>
                <td align="right">
                    <%= Html.ActionLink("编辑", "Edit", new { id=item.flyerId }) %>
                    |
                    <%= Html.ActionLink("删除", "Delete", new { id=item.flyerId })%>
                </td>
            </tr>
        </table>
        <table width="750">
            <tr>
                <th>
                    优惠类型
                </th>
                <th>
                    coupon代码
                </th>
                <th>
                    分类
                </th>
                <th>
                    商家
                </th>
                <th>
                    History
                </th>
                <th>
                    发布时间
                </th>
                <th>
                    发布人
                </th>
                <th>
                    撤销时间
                </th>
                <th>
                    计算价格
                </th>
                <th>
                    折扣
                </th>
                <th>
                    状态
                </th>
                <th>
                    有效
                </th>
            </tr>
            <tr>
                <td>
                    <%= Html.Encode(StringValueDictionary.TypeStr[item.Type])%>
                </td>
                <td>
                    <%= Html.Encode(item.Promote.PromoteCode) %>
                </td>
                <td>
                    <%= Html.Encode(item.Category.CategoryName) %>
                </td>
                <td>
                    <%= Html.Encode(item.Merchant.MerchantName) %>
                </td>
                <td>
                    <%= Html.Encode(item.HistoryId) %>
                </td>
                <td>
                    <%= Html.Encode(String.Format("{0:g}", item.CreateDate)) %>
                </td>
                <td>
                   <%= Html.getMemberUserNamebyUserId(item.PostedBy)%>
                   
                </td>
                <td>
                    <%= Html.Encode(String.Format("{0:g}", item.ExpireDate)) %>
                </td>
                <td>
                    <%= Html.Encode(String.Format("{0:F}", item.Price)) %>
                </td>
                <td>
                    <%= Html.Encode(item.Discount) %>%
                </td>
                <td>
                    <%= Html.Encode(StringValueDictionary.StatusStr[item.Status])%>
                </td>
                <td>
                    <%= Html.Encode(item.Valid) %>
                </td>
            </tr>
        </table>
        <table width="750">
            <tr>
                <td rowspan="2" style="width:105px">
                   <img alt="thumnail" src='<%=Url.Content("~/Photo/"+item.ImgUrl) %>' />
                </td>
                <td>
                    <%= Html.ActionLink( item.SendUrl, "/"+item.flyerId+"/"+item.SendUrl, "Redirect") %>
                </td>
            </tr>
            <tr>
                
                <td>
                    <%= Html.Encode(item.Description) %>
                </td>
            </tr>
        </table>
    </div>
    <hr class="seperator" />
    <% } %>
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>
</asp:Content>
