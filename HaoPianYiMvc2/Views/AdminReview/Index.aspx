<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master"
    Inherits="System.Web.Mvc.ViewPage<PagedList<HaoPianYiMvc2.Models.Review>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        评论</h2>
    <p>
        
        <%=Html.Pager(Model, new PagerOptions{PageIndexParameterName="id"}) %>
    </p>
    <table>
        <tr>
            <th>
            </th>
            <th>
                ReviewId
            </th>
            <th>
                FlyerId
            </th>
            <th>
                UserID
            </th>
            <th>
                ReviewDate
            </th>
            <th>
                Content
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.ReviewId }) %>
                |
                <%= Html.ActionLink("Delete", "Delete", new { id=item.ReviewId })%>
            </td>
            <td>
                <%= Html.Encode(item.ReviewId) %>
            </td>
            <td>
                <%= Html.Encode(item.FlyerId) %>
            </td>
            <td>
                <%= Html.Encode(item.UserID) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.ReviewDate)) %>
            </td>
            <td>
                <%= Html.Encode(item.Content) %>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>
