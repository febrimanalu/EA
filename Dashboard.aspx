<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EA.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FLEXTRONICS</title>
    <link rel="shortcut icon" href="img/flex.png" />

    <!--Required meta tags-->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!--Bootstrap CSS-->
    <link href="another/css/global.css" rel="stylesheet" />
    <link href="another/css/bootstrap.css" rel="stylesheet" />
    <link href="another/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="another/DataTables/css/dataTables.bootstrap4.min.css" rel="stylesheet" /> 
    <link href="another/Buttons/css/buttons.bootstrap4.min.css" rel="stylesheet" />
    <link href="another/Responsive/css/responsive.bootstrap4.min.css" rel="stylesheet" />
    <link href="another/font/css/all.css" rel="stylesheet" />

    <style>
        #myImg{
            border-radius:5px;
            cursor:pointer;
            transition:0.3s;
        }

        #myImg:hover {opacity:0.7;}

        .zoom{
            display:none;
            position:fixed;
            z-index:1;
            padding-top:100px;
            left:0;
            top:0;
            width:100%;
            height:100%;
            overflow:auto;
            background-color:rgb(0,0,0);
            background-color:rgba(0,0,0,0.9);
        }

        .zoom-content{
            margin:auto;
            display:block;
            width:80%;
            max-width:700px;
        }

        .zoom-content, #caption{
            animation-name:zoom;
            animation-duration:0.6s;
        }

        @keyframes zoom{
            from{
                transform:scale(0)
            }
            to{
                transform:scale(1)
            }
        }

        .close{
            position:absolute;
            top:15px;
            right:35px;
            color:#f1f1f1;
            font-size:40px;
            font-weight:bold;
            transition:0.3s
        }

        .close:hover,
        .close:focus{
            color:#bbb;
            text-decoration:none;
            cursor:pointer;
        }

        @media only screen and (max-width:700px){
            .zoom-content{
                width:100%;
            }
        }
    </style>
</head>
<body class="bd">
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-expand-sm navbar-color mb-1 bg-light">
                <a class="navbar-brand"><img src="img/flex.png" width="60" height="30" /></a>
                <div class="collapse navbar-collapse" id="Mynavbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link text-dark" href="Dashboard.aspx"">Dashboard<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-dark" href="Login.aspx">Logout<span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <main role="row">
            <div class="container">
                <asp:Repeater ID="RptSummary" runat="server">
                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate>
                        <div>'<%# Eval("Status") %>'</div>
                            <div>'<%# Eval("Total") %>'</div>
                    </ItemTemplate>
                    <FooterTemplate></FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="ml-1 mt-5 mr-1 mb-5">
                <button class="btn btn-primary" type="button" data-target="#ModalCreate" data-toggle="modal">Create Data</button>
                <br />
                <br />
                <asp:Repeater ID="RptDashboard" runat="server">
                    <HeaderTemplate>
                        <table id="myTable" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%">
                            <thead>
                                <tr role="row">
                                    <th>SN</th>
                                    <th>Description</th>
                                    <th>Family</th>
                                    <th>BU</th>
                                    <th>BU_Line</th>
                                    <th>Status</th>
                                    <th>Owner_Engineer</th>
                                    <th>RF_ID</th>
                                    <th>CO</th>
                                    <th>EAM</th>
                                    <th>Job_No</th>
                                    <th>Asset_Group_ID</th>
                                    <th>Asset_Group_Desc</th>
                                    <th>Manufacturer</th>
                                    <th>Asset_Owner</th>
                                    <th>PM</th>
                                    <th>PM_Period</th>
                                    <th>Calibration</th>
                                    <th>Cal_Period</th>
                                    <th>Cal_ID</th>
                                    <th>Cal_Supplier</th>
                                    <th>Equip_Picture</th>
                                    <th>Manual_Doc_Attachment</th>
                                    <th>By_Whom</th>
                                    <th>Last_Update</th>
                                    <th>Remark</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                                <tr>
                                    <td>
                                        <a href='<%# "Dashboard.aspx?ID=" + Eval ("SN")  %>' target="_blank"><%# Eval ("SN") %></a>
                                    </td>
                                    <td><%# Eval ("Description") %></td>
                                    <td><%# Eval ("Family") %></td>
                                    <td><%# Eval ("BU") %></td>
                                    <td><%# Eval ("BU_Line") %></td>
                                    <td><%# Eval ("Status") %></td>
                                    <td><%# Eval ("Owner_Engineer") %></td>
                                    <td><%# Eval ("RF_ID") %></td>
                                    <td><%# Eval ("CO") %></td>
                                    <td><%# Eval ("EAM") %></td>
                                    <td><%# Eval ("Job_No") %></td>
                                    <td><%# Eval ("Asset_Group_ID") %></td>
                                    <td><%# Eval ("Asset_Group_Desc") %></td>
                                    <td><%# Eval ("Manufacturer") %></td>
                                    <td><%# Eval ("Asset_Owner") %></td>
                                    <td><%# Eval ("PM") %></td>
                                    <td><%# Eval ("PM_Period") %></td>
                                    <td><%# Eval ("Calibration") %></td>
                                    <td><%# Eval ("Cal_Period") %></td>
                                    <td><%# Eval ("Cal_ID") %></td>
                                    <td><%# Eval ("Cal_Supplier") %></td>
                                    <td><img id="myImg" src='<%# Eval("Equip_picture")%>' style="width:50px; height:auto" /></td>
                                    <td><%# Eval ("Manual_Doc_Attachment") %></td>
                                    <td><%# Eval ("By_Whom")  %></td>
                                    <td><%# Eval ("Last_Update") %></td>
                                    <td><%# Eval ("Remark") %></td>
                                    <td>
                                         &nbsp
                                        <a id="Edit_data" data-toggle="modal" data-target="#ModalEdit" onclick="Edit_data" class="fas fa-edit" data-id="<%# Eval("SN") %>" data-nama="<%# Eval("Description") %>" data-fam="<%# Eval("Family") %>"
                                        data-bu="<%# Eval("BU") %>" data-line="<%# Eval("BU_Line") %>" data-status="<%# Eval("Status") %>" data-oe="<%# Eval("Owner_Engineer") %>" data-rfid="<%# Eval("RF_ID") %>" data-co="<%# Eval("CO") %>"
                                        data-eam="<%# Eval("EAM") %>" data-jn="<%# Eval("Job_No") %>" data-agid="<%# Eval("Asset_Group_ID") %>" data-agd="<%# Eval("Asset_Group_Desc") %>" data-manu="<%# Eval("Manufacturer") %>" data-ao="<%# Eval("Asset_Owner") %>"
                                        data-pm="<%# Eval("PM") %>" data-pmp="<%# Eval("PM_Period") %>" data-cal="<%# Eval("Calibration") %>" data-cp="<%# Eval("Cal_Period") %>" data-cid="<%# Eval("Cal_ID") %>" data-cs="<%# Eval("Cal_Supplier") %>"
                                        data-ep="<%# Eval("Equip_picture") %>" data-mda="<%# Eval("Manual_Doc_Attachment") %>" data-bw="<%# Eval("By_Whom") %>" data-lu="<%# Eval("Last_Update") %>" data-re="<%# Eval("Remark") %>">
                                        </a> 
                                         &nbsp &nbsp &nbsp
                                        <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%# Eval("SN") %>' OnClick="lnkDelete_Click" class="fas fa-trash" OnClientClick="return confirm('Do you want to delete this record?');"></asp:LinkButton>
                                    </td>
                                </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div id="myModal" class="zoom">
                    <span class="close">&times;</span>
                    <img class="zoom-content" id="img"/>
                </div>
            </div>

            <!--Modal Create-->
            <div class="modal fade" id="ModalCreate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header alert-info">
                            <h5 class="modal-title" id="exampleModalLabel">Form Create Data</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" Text="SN"></asp:Label>
                                                <asp:TextBox ID="txtSN" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
                                                <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label3" runat="server" Text="Family"></asp:Label>
                                                <asp:DropDownList ID="ddlFam" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>BOOK3</asp:ListItem>
                                                    <asp:ListItem>BUS BOARD</asp:ListItem>
                                                    <asp:ListItem>CARROS</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label4" runat="server" Text="BU"></asp:Label>
                                                <asp:DropDownList ID="ddlBU" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>BU 1</asp:ListItem>
                                                    <asp:ListItem>BU 2</asp:ListItem>
                                                    <asp:ListItem>BU 3</asp:ListItem>
                                                    <asp:ListItem>WAREHOUSE</asp:ListItem>
                                                    <asp:ListItem>CUSTOMER SITE</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label5" runat="server" Text="BU_Line"></asp:Label>
                                                <asp:TextBox ID="txtBUL" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label6" runat="server" Text="Status"></asp:Label>
                                                <asp:DropDownList ID="ddlS" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>ACTIVE</asp:ListItem>
                                                    <asp:ListItem>EOL</asp:ListItem>
                                                    <asp:ListItem>STORED</asp:ListItem>
                                                    <asp:ListItem>UNKNOWN</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label7" runat="server" Text="Owner_Engineer"></asp:Label>
                                                <asp:TextBox ID="txtOE" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label8" runat="server" Text="RF_ID"></asp:Label>
                                                <asp:TextBox ID="txtRFID" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label9" runat="server" Text="CO"></asp:Label>
                                                <asp:TextBox ID="txtCO" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label10" runat="server" Text="EAM"></asp:Label>
                                                <asp:TextBox ID="txtEAM" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label11" runat="server" Text="Job_No"></asp:Label>
                                                <asp:TextBox ID="txtJN" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label12" runat="server" Text="Asset_Group_ID"></asp:Label>
                                                <asp:DropDownList ID="ddlAGID" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>ICT</asp:ListItem>
                                                    <asp:ListItem>FCT</asp:ListItem>
                                                    <asp:ListItem>SIMPLE TEST</asp:ListItem>
                                                    <asp:ListItem>EQUIPMENT</asp:ListItem>
                                                    <asp:ListItem>MODULE</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label13" runat="server" Text="Asset_Group_Desc"></asp:Label>
                                                <asp:TextBox ID="txtAGD" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label14" runat="server" Text="Manufacturer"></asp:Label>
                                                <asp:DropDownList ID="ddlManu" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>SEICO</asp:ListItem>
                                                    <asp:ListItem>CUSTOMIZE</asp:ListItem>
                                                    <asp:ListItem>PETRACARBON TEST</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label15" runat="server" Text="Asset_Owner"></asp:Label>
                                                <asp:DropDownList ID="ddlAO" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>Consigned</asp:ListItem>
                                                    <asp:ListItem>In-House</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label16" runat="server" Text="PM"></asp:Label>
                                                <asp:DropDownList ID="ddlPM" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>YES</asp:ListItem>
                                                    <asp:ListItem>NOT</asp:ListItem>
                                                    <asp:ListItem>NOT REQUIRED</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label17" runat="server" Text="PM_Period"></asp:Label>
                                                <asp:TextBox ID="txtPMP" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label18" runat="server" Text="Calibration"></asp:Label>
                                                <asp:DropDownList ID="ddlCal" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>YES</asp:ListItem>
                                                    <asp:ListItem>NOT</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label19" runat="server" Text="Cal_Period"></asp:Label>
                                                <asp:TextBox ID="txtCP" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label20" runat="server" Text="Cal_ID"></asp:Label>
                                                <asp:TextBox ID="txtCID" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label21" runat="server" Text="Cal_Supplier"></asp:Label>
                                                <asp:TextBox ID="txtCS" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label22" runat="server" Text="Equip_Picture"></asp:Label>
                                                <asp:FileUpload ID="txtEP" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label23" runat="server" Text="Manual_Doc_Attachment"></asp:Label>
                                                <asp:TextBox ID="txtMDA" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label24" runat="server" Text="By_Whom"></asp:Label>
                                                <asp:TextBox ID="txtBW" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label25" runat="server" Text="Remark"></asp:Label>
                                                <asp:TextBox ID="txtR" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-success" runat="server" Text="Save" />
                        </div>
                </div>
            </div>
            </div>

            <!--Modal Edit-->
            <div class="modal fade" id="ModalEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header alert-info">
                            <h5 class="modal-title">Form Edit Data</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label26" runat="server" Text="SN"></asp:Label>
                                                <asp:TextBox ID="txtEditSN" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label27" runat="server" Text="Description"></asp:Label>
                                                <asp:TextBox ID="txtEditDesc" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label28" runat="server" Text="Family"></asp:Label>
                                                <asp:DropDownList ID="ddlEditFam" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>BOOK3</asp:ListItem>
                                                    <asp:ListItem>BUS BOARD</asp:ListItem>
                                                    <asp:ListItem>CARROS</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label29" runat="server" Text="BU"></asp:Label>
                                                <asp:DropDownList ID="ddlEditBU" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>BU 1</asp:ListItem>
                                                    <asp:ListItem>BU 2</asp:ListItem>
                                                    <asp:ListItem>BU 3</asp:ListItem>
                                                    <asp:ListItem>WAREHOUSE</asp:ListItem>
                                                    <asp:ListItem>CUSTOMER SITE</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label30" runat="server" Text="BU_Line"></asp:Label>
                                                <asp:TextBox ID="txtEditBUL" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label31" runat="server" Text="Status"></asp:Label>
                                                <asp:DropDownList ID="ddlEditS" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>ACTIVE</asp:ListItem>
                                                    <asp:ListItem>EOL</asp:ListItem>
                                                    <asp:ListItem>STORED</asp:ListItem>
                                                    <asp:ListItem>UNKNOWN</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label32" runat="server" Text="Owner_Engineer"></asp:Label>
                                                <asp:TextBox ID="txtEditOE" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label33" runat="server" Text="RF_ID"></asp:Label>
                                                <asp:TextBox ID="txtEditRFID" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label34" runat="server" Text="CO"></asp:Label>
                                                <asp:TextBox ID="txtEditCO" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label35" runat="server" Text="EAM"></asp:Label>
                                                <asp:TextBox ID="txtEditEAM" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label36" runat="server" Text="Job_No"></asp:Label>
                                                <asp:TextBox ID="txtEditJN" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label37" runat="server" Text="Asset_Group_ID"></asp:Label>
                                                <asp:DropDownList ID="ddlEditAGID" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>ICT</asp:ListItem>
                                                    <asp:ListItem>FCT</asp:ListItem>
                                                    <asp:ListItem>SIMPLE TEST</asp:ListItem>
                                                    <asp:ListItem>EQUIPMENT</asp:ListItem>
                                                    <asp:ListItem>MODULE</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label38" runat="server" Text="Asset_Group_Desc"></asp:Label>
                                                <asp:TextBox ID="txtEditAGD" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label39" runat="server" Text="Manufacturer"></asp:Label>
                                                <asp:DropDownList ID="ddlEditManu" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>SEICO</asp:ListItem>
                                                    <asp:ListItem>CUSTOMIZE</asp:ListItem>
                                                    <asp:ListItem>PETRACARBON TEST</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label40" runat="server" Text="Asset_Owner"></asp:Label>
                                                <asp:DropDownList ID="ddlEditAO" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>Consigned</asp:ListItem>
                                                    <asp:ListItem>In-House</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label41" runat="server" Text="PM"></asp:Label>
                                                <asp:DropDownList ID="ddlEditPM" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>YES</asp:ListItem>
                                                    <asp:ListItem>NOT</asp:ListItem>
                                                    <asp:ListItem>NOT REQUIRED</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label42" runat="server" Text="PM_Period"></asp:Label>
                                                <asp:TextBox ID="txtEditPMP" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label43" runat="server" Text="Calibration"></asp:Label>
                                                <asp:DropDownList ID="ddlEditCal" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>YES</asp:ListItem>
                                                    <asp:ListItem>NOT</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label44" runat="server" Text="Cal_Period"></asp:Label>
                                                <asp:TextBox ID="txtEditCP" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label45" runat="server" Text="Cal_ID"></asp:Label>
                                                <asp:TextBox ID="txtEditCID" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label46" runat="server" Text="Cal_Supplier"></asp:Label>
                                                <asp:TextBox ID="txtEditCS" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label47" runat="server" Text="Equip_Picture"></asp:Label>
                                                <asp:FileUpload ID="txtEditEP" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label48" runat="server" Text="Manual_Doc_Attachment"></asp:Label>
                                                <asp:TextBox ID="txtEditMDA" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label49" runat="server" Text="By_Whom"></asp:Label>
                                                <asp:TextBox ID="txtEditBW" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label50" runat="server" Text="Remark"></asp:Label>
                                                <asp:TextBox ID="txtEditR" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                            <asp:Button ID="btnEdit" OnClick="btnEdit_Click" CssClass="btn btn-success" runat="server" Text="Save" />
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer></footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="another/js/jquery-3.5.1.slim.min.js"></script>
    <script src="another/js/bootstrap.bundle.min.js"></script>

    <!--DataTables-->
    <script src="another/js/jquery-3.5.1.min.js"></script>
    <script src="another/js/jquery.dataTables.min.js"></script>
    <script src="another/DataTables/js/dataTables.bootstrap4.min.js"></script>
    <script src="another/Buttons/js/dataTables.buttons.min.js"></script>
    <script src="another/Buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="another/JSZip/jszip.min.js"></script>
    <script src="another/pdfmake/pdfmake.min.js"></script>
    <script src="another/pdfmake/vfs_fonts.js"></script>
    <script src="another/Buttons/js/buttons.html5.min.js"></script>
    <script src="another/Buttons/js/buttons.print.min.js"></script>
    <script src="another/Buttons/js/buttons.colVis.min.js"></script>
    <script src="another/Responsive/js/dataTables.responsive.min.js"></script>
    <script src="another/Responsive/js/responsive.bootstrap4.min.js"></script>

    <script>
        $(document).ready(function () {
            var table = $('#myTable').DataTable({
                buttons: ['copy', 'csv', 'excel',
                    {
                        extend: 'pdfHtml5',
                        orientation: 'landscape',
                        pageSize: 'LEGAL',
                        except: ''
                    }, 'print'],
                dom:
                    "<'row'<'col-md-4'l><'col-md-4'B><'col-md-4'f>>" +
                    "<'row'<'col-md-12'tr>>" +
                    "<'row'<'col-md-7'i><'col-md-5'p>>"
            });

            table.buttons().container()
                .appendTo('#myTable_wrapper .col-md-6:eq(0)');
        });

        $(document).on("click", "#Edit_data", function () {
            var _id = $(this).data("id");
            var _nama = $(this).data("nama");
            var _fam = $(this).data("fam");
            var _bu = $(this).data("bu");
            var _line = $(this).data("line");
            var _status = $(this).data("status");
            var _oe = $(this).data("oe");
            var _rfid = $(this).data("rfid");
            var _co = $(this).data("co");
            var _eam = $(this).data("eam");
            var _jn = $(this).data("jn");
            var _agid = $(this).data("agid");
            var _agd = $(this).data("agd");
            var _manu = $(this).data("manu");
            var _ao = $(this).data("ao");
            var _pm = $(this).data("pm");
            var _pmp = $(this).data("pmp");
            var _cal = $(this).data("cal");
            var _cp = $(this).data("cp");
            var _cid = $(this).data("cid");
            var _cs = $(this).data("cs");
            var _ep = $(this).data("ep");
            var _mda = $(this).data("mda");
            var _bw = $(this).data("bw");
            var _lu = $(this).data("lu");
            var _re = $(this).data("re");

            $("#ModalEdit #txtEditSN").val(_id);
            $("#ModalEdit #txtEditDesc").val(_nama);
            $("#ModalEdit #ddlEditFam").val(_fam);
            $("#ModalEdit #ddlEditBU").val(_bu);
            $("#ModalEdit #txtEditBUL").val(_line);
            $("#ModalEdit #ddlEditS").val(_status);
            $("#ModalEdit #txtEditOE").val(_oe);
            $("#ModalEdit #txtEditRFID").val(_rfid);
            $("#ModalEdit #txtEditCO").val(_co);
            $("#ModalEdit #txtEditEAM").val(_eam);
            $("#ModalEdit #txtEditJN").val(_jn);
            $("#ModalEdit #ddlEditAGID").val(_agid);
            $("#ModalEdit #txtEditAGD").val(_agd);
            $("#ModalEdit #ddlEditManu").val(_manu);
            $("#ModalEdit #ddlEditAO").val(_ao);
            $("#ModalEdit #ddlEditPM").val(_pm);
            $("#ModalEdit #txtEditPMP").val(_pmp);
            $("#ModalEdit #ddlEditCal").val(_cal);
            $("#ModalEdit #txtEditCP").val(_cp);
            $("#ModalEdit #txtEditCID").val(_cid);
            $("#ModalEdit #txtEditCS").val(_cs);
            $("#ModalEdit #txtEditEP").val(_ep);
            $("#ModalEdit #txtEditMDA").val(_mda);
            $("#ModalEdit #txtEditBW").val(_bw);
            $("#ModalEdit #txtEditLU").val(_lu);
            $("#ModalEdit #txtEditR").val(_re);
            $("#ModalEdit #txtEditSN").attr("ReadOnly", true);;
        });

        var modal = document.getElementById("myModal");

        var img = document.getElementById("myImg");
        var modalImg = document.getElementById("img");
        img.onclick = function() {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }
        var span = document.getElementsByClassName("close")[0];

        span.onclick = function() {
            modal.style.display = "none";
        }
    </script>
    </form>
</body>
</html>