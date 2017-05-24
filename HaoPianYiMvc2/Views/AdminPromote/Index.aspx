<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<PagedList<HaoPianYiMvc2.Models.Promote>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Index</h2>
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
        <%=Html.Pager(Model, new PagerOptions{PageIndexParameterName="id"}) %>
    </p>
    <table>
        <tr>
            <th>
            </th>
            <th>
                PromoteId
            </th>
            <th>
                PromoteCode
            </th>
            <th>
                PromoteDescription
            </th>
            <th>
                URL
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.PromoteId }) %>|
                <%= Html.ActionLink("Delete", "Delete", new { id=item.PromoteId })%>
            </td>
            <td>
                <%= Html.Encode(item.PromoteId) %>
            </td>
            <td>
                <%= Html.Encode(item.PromoteCode) %>
            </td>
            <td>
                <%= Html.Encode(item.PromoteDescription) %>
            </td>
            <td>
                <%= Html.Encode(item.URL) %>
            </td>
        </tr>
        <% } %>
    </table>
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>
</asp:Content>
