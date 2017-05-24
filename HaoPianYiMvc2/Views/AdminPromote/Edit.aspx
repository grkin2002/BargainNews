<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<HaoPianYiMvc2.Models.Promote>" %>

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
                <%= Html.LabelFor(model => model.PromoteCode) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.PromoteCode) %>
                <%= Html.ValidationMessageFor(model => model.PromoteCode) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.PromoteDescription) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.PromoteDescription) %>
                <%= Html.ValidationMessageFor(model => model.PromoteDescription) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.URL) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.URL) %>
                <%= Html.ValidationMessageFor(model => model.URL) %>
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

