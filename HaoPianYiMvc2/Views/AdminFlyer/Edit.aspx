<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<HaoPianYiMvc2.Models.Flyer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit</h2>
    <% using (Html.BeginForm())
       {%>
    <%= Html.ValidationSummary(true) %>
    <p>
        <input type="submit" value="Save" />
    </p>
    <fieldset>
        <legend>请填写</legend>
        <div class="editor-field">
            <%= Html.LabelFor(model => model.Title) %>&nbsp&nbsp&nbsp
            <%= Html.TextBoxFor(model => model.Title, new { style = "width:400px", required = "true" })%>
            <%= Html.ValidationMessageFor(model => model.Title) %>
            &nbsp&nbsp&nbsp<br />
            <%= Html.LabelFor(model => model.HistoryId) %>&nbsp&nbsp&nbsp
            <%= Html.TextBoxFor(model => model.HistoryId) %>
            <%= Html.ValidationMessageFor(model => model.HistoryId) %>
        </div>
        <hr class="seperator" />
        <div class="editor-field">
            <%= Html.LabelFor(model => model.Type) %>
            <select id="Type">
                <option value="0">Deal</option>
                <option value="1">Coupon</option>
                <option value="2">Free</option>
                <option value="3">Rebate</option>
            </select>
            &nbsp&nbsp&nbsp
            <%= Html.LabelFor(model => model.PromoteId) %>
            <!--   Html.DropDownListFor(model => model.PromoteId, new SelectList((List<Promote>)ViewData["Promote"], 
           "PromoteId", "PromoteCode", Model.PromoteId)) Create的时候还没有PromoteId，所以会出现NullPointer的错误 -->
            <%=Html.DropDownListFor(model => model.PromoteId, new SelectList((List<Promote>)ViewData["Promote"], "PromoteId", "PromoteCode"))%>
            <%= Html.ValidationMessageFor(model => model.PromoteId) %>
            &nbsp&nbsp&nbsp
            <%= Html.LabelFor(model => model.MerchantId) %>
            <%=Html.DropDownListFor(model => model.MerchantId, new SelectList((List<Merchant>)ViewData["Merchant"], "MerchantId", "MerchantName"))%>
            <%= Html.ValidationMessageFor(model => model.MerchantId) %>
            &nbsp&nbsp&nbsp
            <%= Html.LabelFor(model => model.CategoryId) %>
            <%=Html.DropDownListFor(model=>model.CategoryId,new SelectList((List<Category>)ViewData["Category"],"CategoryId","CategoryName")) %>
            <%= Html.ValidationMessageFor(model => model.CategoryId) %>
        </div>
        <hr class="seperator" />
        <div class="editor-field">
            <%= Html.LabelFor(model => model.PostedBy) %>
            <%= Html.Encode(Html.getMemberUserNamebyUserId(Model.PostedBy)) %>
            <%= Html.TextBoxFor(model => model.PostedBy, new { Type="hidden", @Value=Html.getGuidOfCurrentUser()})%>
            <%= Html.ValidationMessageFor(model => model.PostedBy) %>
            &nbsp&nbsp&nbsp<br />
            <%= Html.LabelFor(model => model.CreateDate) %>
            <%= Html.TextBoxFor(model => model.CreateDate) %>
            <%= Html.ValidationMessageFor(model => model.CreateDate) %>
            &nbsp&nbsp&nbsp
            <%= Html.LabelFor(model => model.ExpireDate) %>
            <%= Html.TextBoxFor(model => model.ExpireDate) %>
            <%= Html.ValidationMessageFor(model => model.ExpireDate) %>
            &nbsp&nbsp&nbsp
        </div>
        <hr class="seperator" />
        <div class="editor-field">
            <%= Html.LabelFor(model => model.Price) %>
            <%= Html.TextBoxFor(model => model.Price) %>
            <%= Html.ValidationMessageFor(model => model.Price) %>
            &nbsp&nbsp&nbsp
            <%= Html.LabelFor(model => model.Discount) %>
            <%= Html.TextBoxFor(model => model.Discount) %>
            <%= Html.ValidationMessageFor(model => model.Discount) %>
            &nbsp&nbsp&nbsp
        </div>
        <hr class="seperator" />
        <div class="editor-field">
            <%= Html.LabelFor(model => model.SendUrl) %>
            <%= Html.TextBoxFor(model => model.SendUrl, new { style = "Width:600px" })%>
            <%= Html.ValidationMessageFor(model => model.SendUrl) %>
        </div>
        <hr class="seperator" />
        <div class="editor-field">
            <%= Html.LabelFor(model => model.ClickCount) %>
            <%= Html.TextBoxFor(model => model.ClickCount) %>
            <%= Html.ValidationMessageFor(model => model.ClickCount) %>
            &nbsp&nbsp&nbsp
            <%= Html.LabelFor(model => model.ViewCount) %>
            <%= Html.TextBoxFor(model => model.ViewCount) %>
            <%= Html.ValidationMessageFor(model => model.ViewCount) %>
            &nbsp&nbsp&nbsp
            <%= Html.LabelFor(model => model.Status) %>
            <select id="Status">
                <option value="0">在售/On sale</option>
                <option value="1">过期/Expire</option>
                <option value="2">售完/Soldout</option>
            </select>
            <%= Html.ValidationMessageFor(model => model.Status) %>
            &nbsp&nbsp&nbsp
            <%= Html.LabelFor(model => model.Valid) %>
            <%= Html.CheckBoxFor(model => model.Valid) %>
            <%= Html.ValidationMessageFor(model => model.Valid) %>
        </div>
        <hr class="seperator" />
        <br class="clear" />
        <div>
            <%= Html.LabelFor(model => model.Description) %><br />
            <%= Html.TextBoxFor(model => model.Description, new { Style="width:70%; height:100px; "})%>
            <%= Html.ValidationMessageFor(model => model.Description) %>
        </div>
        <hr class="seperator" />
        <div>
            <%= Html.TextBoxFor(model => model.ImgUrl, new { type="hidden"})%>
            <%= Html.ValidationMessageFor(model => model.ImgUrl) %>
            <% Html.RenderPartial("PhotoUpload"); %>
        </div>
    </fieldset>
    <p>
        <input type="submit" value="Save" />
    </p>
    <% } %>
    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
