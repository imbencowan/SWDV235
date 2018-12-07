<%--Ben Cowan 2018-11-16
SWDV235 Project 5--%>

<%--added drop down lists for the insert.
slightly more difficult was adding drop down lists for edits for the gridview. this would have been easier if i had set it up for this originally,
	 but i didn't want to ditch the datasource i had already set up.
so i added additional datasources for the drop down lists. this was easier then going back and redoing the whole thing more cleanly.
added a BorrowStatus table to the database so we could display descriptions for the borrowStatus
moved all the data sources to the bottom for better organization
moved 'delete' in to the same command field as 'edit', just one column now.
deleted the now empty command field 'delete' previously occupied
removed the disk id from the gridview, better formatting has made it irrelevant
moved disk type and genre over in the gridview
added a date format to release date in the gridview to finally get rid of the time--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Disks.aspx.cs" Inherits="Disk" %>

<asp:Content id="mainContent" ContentPlaceHolderID="main" runat="server">
	 <div>
		  <h1>Disk</h1>
		  <p>&nbsp;</p>

				<%--errors go here--%>
		  <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
		  
				<%--here is the grid view that displays the table--%>
		  <asp:GridView ID="GridDisk" runat="server" AutoGenerateColumns="False" DataKeyNames="diskID" DataSourceID="SqlDataSource1" 
					 CssClass="table table-bordered table-condensed" AllowSorting="True" AllowPaging="True" PageSize="8" 
					 OnRowDeleted="grdBorrower_RowDeleted" OnRowUpdated="grdCategories_RowUpdated" >
				<Columns>
					 <asp:TemplateField HeaderText="Disk Name" SortExpression="diskName">
						  <ItemTemplate>
								<asp:Label ID="diskName1" runat="server" Text='<%# Bind("diskName") %>'></asp:Label>
								
						  </ItemTemplate>
						  <EditItemTemplate>
								<asp:TextBox ID="tbxUpdateDiskName" runat="server" Text='<%# Bind("diskName") %>'></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbxUpdateDiskName" runat="server" 
									 ErrorMessage="* this  is required" ValidationGroup="Edit" ></asp:RequiredFieldValidator>
						  </EditItemTemplate>
					 </asp:TemplateField>
					 <asp:TemplateField HeaderText="Release Date" SortExpression="diskName">
						  <ItemTemplate>
								<asp:Label ID="releaseDate1" runat="server" Text='<%# Bind("releaseDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
						  </ItemTemplate>
						  <EditItemTemplate>
								<asp:TextBox ID="tbxUpdateReleaseDate" runat="server" Text='<%# Bind("releaseDate", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbxUpdateReleaseDate" runat="server" 
									 ErrorMessage="* this  is required" ValidationGroup="Edit" ></asp:RequiredFieldValidator>
								<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tbxUpdateReleaseDate" 
									 Operator="DataTypeCheck" Type="Date" ErrorMessage="Please enter a date in the form '2010-10-30'" 
									 ValidationGroup="Edit" ></asp:CompareValidator>
						  </EditItemTemplate>
					 </asp:TemplateField>
					 <asp:TemplateField HeaderText="Disk Type" SortExpression="typeName">
						  <ItemTemplate>
								<asp:Label ID="typeName1" runat="server" Text='<%# Bind("typeName") %>'></asp:Label>
						  </ItemTemplate>
						  <EditItemTemplate>
								<asp:DropDownList id="ddlDiskTypeEdit" datasourceid="SqlDataSource2"
									 datatextfield="description" DataValueField="diskTypeID" runat="server" 
									  SelectedValue='<%# Bind("diskTypeID") %>' >
							</asp:DropDownList>
						  </EditItemTemplate>
					 </asp:TemplateField>
					 <asp:TemplateField HeaderText="Genre" SortExpression="genreName">
						  <ItemTemplate>
								<asp:Label ID="genreName1" runat="server" Text='<%# Bind("genreName") %>'></asp:Label>
						  </ItemTemplate>
						  <EditItemTemplate>
								<asp:DropDownList id="ddlGenreEdit" datasourceid="SqlDataSource3"
									 datatextfield="description" DataValueField="genreTypeID" runat="server" 
									  SelectedValue='<%# Bind("genreID") %>' >
								</asp:DropDownList>
						  </EditItemTemplate>
					 </asp:TemplateField>
					 <asp:TemplateField HeaderText="Borrow Status" SortExpression="borrowStatus">
						  <ItemTemplate>
								<asp:Label ID="borrowStatus1" runat="server" Text='<%# Bind("borrowStatusName") %>'></asp:Label>
						  </ItemTemplate>
						  <EditItemTemplate>
								<asp:DropDownList id="ddlStatusEdit" datasourceid="SqlDataSource4"
									 datatextfield="description" DataValueField="StatusCode" runat="server" 
									  SelectedValue='<%# Bind("borrowStatus") %>' >
								</asp:DropDownList>
						  </EditItemTemplate>
					 </asp:TemplateField>
					 <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ValidationGroup="Edit" />
				</Columns>
				<PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
		  </asp:GridView>


	 </div>

		  <%--and here is our insert section in a details view--%>
	 <asp:detailsview ID="detailsView1" defaultMode="Insert" runat="server" 
		  CssClass="table table-bordered table-condensed" AutoGenerateRows="False" 
		  DataSourceID="SqlDataSource1" OnItemInserted="DetailsView1_ItemInserted">
		  <HeaderTemplate>
				<p>Submit information for a new disk below.</p>
		  </HeaderTemplate>
		  <Fields>
				<asp:TemplateField HeaderText="Disk TypeInsert">
						<InsertItemTemplate>
							<asp:DropDownList id="ddlDiskTypeInsert" datasourceid="SqlDataSource2"
								datatextfield="description" DataValueField="diskTypeID" runat="server" 
								 SelectedValue='<%# Bind("diskTypeID") %>' >
							</asp:DropDownList>
						</InsertItemTemplate>
			  </asp:TemplateField>
				<asp:TemplateField HeaderText="Genre">
						<InsertItemTemplate>
							<asp:DropDownList id="ddlGenreTypeInsert" datasourceid="SqlDataSource3"
								datatextfield="description" DataValueField="genreTypeID" runat="server" 
								 SelectedValue='<%# Bind("genreID") %>' >
							</asp:DropDownList>
						</InsertItemTemplate>
			  </asp:TemplateField>
				<asp:TemplateField HeaderText="Disk Name" SortExpression="diskName">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxDiskName" runat="server" Text='<%# Bind("diskName") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbxDiskName" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Release Date" SortExpression="releaseDate">
					 <InsertItemTemplate>
						  <asp:TextBox ID="tbxRelease" runat="server" Text='<%# Bind("releaseDate") %>'></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbxRelease" runat="server" 
								ErrorMessage="* this  is required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
						  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="tbxRelease" 
								Operator="DataTypeCheck" Type="Date" ErrorMessage="Please enter a date in the form '2010-10-30'" 
								ValidationGroup="Insert" ></asp:CompareValidator>
					 </InsertItemTemplate>
				</asp:TemplateField>			
				

				<asp:CommandField ShowInsertButton="True" ValidationGroup="Insert" />
		  </Fields>

	 </asp:detailsview>

				<%--here is the data source, with it's methods and parameters--%>
		  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>"
				DeleteCommand="exec spDeleteDisk @original_diskID, @original_diskTypeID, @original_genreID, @original_diskName, @original_releaseDate, @original_borrowStatus" 
				InsertCommand="exec spInsertDisk @diskTypeID, @genreID, @diskName, @releaseDate, '0'" 
				OldValuesParameterFormatString="original_{0}" 
				SelectCommand="SELECT * FROM [DiskView]" 
				UpdateCommand="exec spUpdateDisk @original_diskID, @diskTypeID, @genreID, @diskName, @releaseDate, @borrowStatus, @original_diskTypeID, @original_genreID, @original_diskName, @original_releaseDate, @original_borrowStatus">
				<DeleteParameters>
					 <asp:Parameter Name="original_diskID" Type="Int32" />
					 <asp:Parameter Name="original_diskTypeID" Type="Int32" />
					 <asp:Parameter Name="original_genreID" Type="Int32" />
					 <asp:Parameter Name="original_diskName" Type="String" />
					 <asp:Parameter DbType="Date" Name="original_releaseDate" />
					 <asp:Parameter Name="original_borrowStatus" Type="String" />
				</DeleteParameters>
				<InsertParameters>
					 <asp:Parameter Name="diskTypeID" Type="Int32" />
					 <asp:Parameter Name="genreID" Type="Int32" />
					 <asp:Parameter Name="diskName" Type="String" />
					 <asp:Parameter DbType="Date" Name="releaseDate" />
					 <%--<asp:Parameter Name="borrowStatus" Type="String" />--%>
				</InsertParameters>
				<UpdateParameters>
					 <asp:Parameter Name="diskTypeID" Type="Int32" />
					 <asp:Parameter Name="genreID" Type="Int32" />
					 <asp:Parameter Name="diskName" Type="String" />
					 <asp:Parameter DbType="Date" Name="releaseDate" />
					 <asp:Parameter Name="borrowStatus" Type="String" />
					 <asp:Parameter Name="original_diskID" Type="Int32" />
					 <asp:Parameter Name="original_diskTypeID" Type="Int32" />
					 <asp:Parameter Name="original_genreID" Type="Int32" />
					 <asp:Parameter Name="original_diskName" Type="String" />
					 <asp:Parameter DbType="Date" Name="original_releaseDate" />
					 <asp:Parameter Name="original_borrowStatus" Type="String" />
				</UpdateParameters>
		  </asp:SqlDataSource>

	 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" 
		  SelectCommand="SELECT * FROM [DiskType]"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" 
		  SelectCommand="SELECT * FROM [GenreType]"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DiskInventoryConnectionString %>" 
		  SelectCommand="SELECT * FROM [BorrowStatus]"></asp:SqlDataSource>

</asp:Content>