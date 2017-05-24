<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<PagedList<HaoPianYiMvc2.Models.Merchant>>" %>

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
            <th></th>
            <th>
                MerchantId
            </th>
            <th>
                MerchantName
            </th>
            <th>
                MerchantData
            </th>
            <th>
                MerchantPhotoUrl
            </th>
            <th>
                MerchantEnglish
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.MerchantId }) %> |
          
                <%= Html.ActionLink("Delete", "Delete", new { id=item.MerchantId })%>
            </td>
            <td>
                <%= Html.Encode(item.MerchantId) %>
            </td>
            <td>
                <%= Html.Encode(item.MerchantName) %>
            </td>
            <td>
                <%= Html.Encode(item.MerchantData) %>
            </td>
            <td>
                <%= Html.Encode(item.MerchantPhotoUrl) %>
            </td>
            <td>
                <%= Html.Encode(item.MerchantEnglish) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

