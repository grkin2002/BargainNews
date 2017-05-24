<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<HaoPianYiMvc2.Models.Merchant>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
      
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.MerchantName) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.MerchantName) %>
                <%= Html.ValidationMessageFor(model => model.MerchantName) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.MerchantData) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.MerchantData) %>
                <%= Html.ValidationMessageFor(model => model.MerchantData) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.MerchantPhotoUrl) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.MerchantPhotoUrl) %>
                <%= Html.ValidationMessageFor(model => model.MerchantPhotoUrl) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.MerchantEnglish) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.MerchantEnglish) %>
                <%= Html.ValidationMessageFor(model => model.MerchantEnglish) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

