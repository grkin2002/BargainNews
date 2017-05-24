<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<HaoPianYiMvc2.Models.Review>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ReviewId</div>
        <div class="display-field"><%= Html.Encode(Model.ReviewId) %></div>
        
        <div class="display-label">FlyerId</div>
        <div class="display-field"><%= Html.Encode(Model.FlyerId) %></div>
        
        <div class="display-label">UserID</div>
        <div class="display-field"><%= Html.Encode(Model.UserID) %></div>
        
        <div class="display-label">ReviewDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.ReviewDate)) %></div>
        
        <div class="display-label">Content</div>
        <div class="display-field"><%= Html.Encode(Model.Content) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%= Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

