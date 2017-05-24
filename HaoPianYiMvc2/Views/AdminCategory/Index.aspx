<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<PagedList<HaoPianYiMvc2.Models.Category>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
        <%=Html.Pager(Model, new PagerOptions{PageIndexParameterName="id"}) %>
    </p>
    <table>
        <tr>
           
            <th>
                流水号
            </th>
            <th>
                分类名称
            </th>
            <th>
                描述
            </th>
            <th>
            操作
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
       
            <td>
                <%= Html.Encode(item.CategoryId) %>
            </td>
            <td>
                <%= Html.Encode(item.CategoryName) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.CategoryId }) %>
                |
                <%= Html.ActionLink("Delete", "Delete", new { id=item.CategoryId })%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

