<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<HaoPianYiMvc2.Models.Review>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
  
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.FlyerId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.FlyerId) %>
                <%= Html.ValidationMessageFor(model => model.FlyerId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.UserID) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.UserID) %>
                <%= Html.ValidationMessageFor(model => model.UserID) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ReviewDate) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ReviewDate, String.Format("{0:g}", Model.ReviewDate)) %>
                <%= Html.ValidationMessageFor(model => model.ReviewDate) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Content) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Content) %>
                <%= Html.ValidationMessageFor(model => model.Content) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

