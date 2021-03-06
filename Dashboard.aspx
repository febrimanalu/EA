﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EA.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FLEXTRONICS</title>
    <link rel="shortcut icon" href="img/flex.png" />

    <!--Required meta tags-->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!--Bootstrap CSS-->
    <link href="another/css/bootstrap.css" rel="stylesheet" />
    <link href="another/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="another/DataTables/css/dataTables.bootstrap4.min.css" rel="stylesheet" /> 
    <link href="another/Buttons/css/buttons.bootstrap4.min.css" rel="stylesheet" />
    <link href="another/Responsive/css/responsive.dataTables.min.css" rel="stylesheet" />
    <link href="another/Responsive/css/responsive.bootstrap4.min.css" rel="stylesheet" />
    <link href="another/font/css/all.css" rel="stylesheet" />

    <style type="text/css">
        .modal1{
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: black;
            z-index: 100;
            opacity: 0.8;
            filter: alpha(opacity=60);
            -moz-opacity: 0.8;
            min-height: 100%;
        }

        #divImage
        {
            display: none;
            z-index: 1000;
            position: fixed;
            top: 0;
            left: 0;
            background-color: White;
            height: 550px;
            width: 600px;
            padding: 3px;
            border: solid 1px black;
        }

        .bd {
            background-color: white;
            background-repeat: no-repeat;
            background-size: auto;
            width:100%;
            min-height: 200px;
        }

        .boxDiv {
            min-height: 150px;
            padding-top: 20px;
            padding-left: 20px;
            background-color:beige;
            font-weight: bold;
            color: black;
            margin: 15px;
        }

        .widget-two-teal{
            background:yellow;
            padding-left:4px;
            padding-right:4px;
            border-radius:8px;
        }

        .widget-two-warning{
            background:red;
            padding-left:4px;
            padding-right:4px;
            border-radius:8px;
        }

        .widget-two-primary{
            background:skyblue;
            padding-left:4px;
            padding-right:4px;
            border-radius:8px;
        }

        .widget-two-success{
            background:lightgreen;
            padding-left:4px;
            padding-right:4px;
            border-radius:8px;
        }

        .widget-two-secondary{
            background:gray;
            padding-left:4px;
            padding-right:4px;
            border-radius:8px;
        }
    </style>
</head>
<body class="bd">
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-expand-sm navbar-color mb-1 bg-primary justify-content-center align-items-start">
                <a class="navbar-brand">
                    <img src="img/flex1.png" height="40" />
                </a>
                <span class="navbar-brand position-absolute text-light"><h2>Equipment Asset Dashboard</h2></span>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ml-auto text-light">
                        <!-- Menampilkan Hari, Bulan dan Tahun -->
                        <h3>
                            <script type='text/javascript'>
                                var months = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
                                var myDays = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum&#39;at', 'Sabtu'];
                                var date = new Date();
                                var day = date.getDate();
                                var month = date.getMonth();
                                var thisDay = date.getDay(),
                                    thisDay = myDays[thisDay];
                                var yy = date.getYear();
                                var year = (yy < 1000) ? yy + 1900 : yy;
                                document.write(months[month] + '/' + day + '/' + year);
                            </script>
                        </h3>&nbsp&nbsp
                        <h6>
                        <!-- Menampilkan Jam (Aktif) -->
	                    <div id="clock"></div>
		                    <script type="text/javascript">
                                function showTime() {
                                    var a_p = "";
                                    var today = new Date();
                                    var curr_hour = today.getHours();
                                    var curr_minute = today.getMinutes();
                                    var curr_second = today.getSeconds();
                                    if (curr_hour < 12) {
                                        a_p = "AM";
                                    } else {
                                        a_p = "PM";
                                    }
                                    if (curr_hour == 0) {
                                        curr_hour = 12;
                                    }
                                    if (curr_hour > 12) {
                                        curr_hour = curr_hour - 12;
                                    }
                                    curr_hour = checkTime(curr_hour);
                                    curr_minute = checkTime(curr_minute);
                                    curr_second = checkTime(curr_second);
                                    document.getElementById('clock').innerHTML = curr_hour + ":" + curr_minute + ":" + curr_second + " " + a_p;
                                }

                                function checkTime(i) {
                                    if (i < 10) {
                                        i = "0" + i;
                                    }
                                    return i;
                                }
                                setInterval(showTime, 500);
                            </script>
                        </h6>&nbsp&nbsp&nbsp&nbsp
                        <li class="nav-item active">
                            <asp:Button ID="btnlogout" CssClass="nav-link text-dark" Text="Logout" OnClick="btnlogout_Click" Style="background:white" runat="server" />
                        </li>
                    </ul> 
                </div> 
            </nav>
        </header>
        <main role="row">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 col-xs-12">
                    <div class="boxDiv">
                        <span style="font-size:25px">STATUS  </span>
                        <br /><br /><br />
                        <div class="row">
                            <asp:Repeater ID="Rpt1" runat="server">
                                <HeaderTemplate></HeaderTemplate>
                                <ItemTemplate>
                                    <span style="padding:6px">
                                        <div class="<%# Eval("RowType") %>"> <%# Eval("Status") +" : "+ Eval("Total") %></div>
                                    </span>
                                </ItemTemplate>
                                <FooterTemplate></FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div> 
                <div class="col-lg-3 col-md-6 col-sm-8 col-xs-12">
                    <div class="boxDiv">
                        <span style="font-size:25px">LOCATION </span>
                        <br /><br /><br />
                        <div class="row">
                            <asp:Repeater ID="Rpt2" runat="server">
                                <HeaderTemplate></HeaderTemplate>
                                <ItemTemplate>
                                    <span style="padding:6px">
                                        <div class="<%# Eval("RowType") %>"> <%# Eval("Location") +" : "+ Eval("Total") %></div>
                                    </span>
                                </ItemTemplate>
                                <FooterTemplate></FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-8 col-xs-12">
                    <div class="boxDiv"> 
                        <span style="font-size:25px">ASSET </span>
                        <br /><br /><br />
                        <div class="row">
                            <asp:Repeater ID="Rpt3" runat="server">
                                <HeaderTemplate></HeaderTemplate>
                                <ItemTemplate>
                                    <span style="padding:6px">
                                        <div class="<%# Eval("RowType") %>"><%# Eval("Asset") +" : "+ Eval("Total") %></div>
                                    </span>
                                </ItemTemplate>
                                <FooterTemplate></FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-8 col-xs-12">
                    <div class="boxDiv"> 
                        <span style="font-size:25px">OWNER </span>
                        <br /><br /><br />
                        <div class="row">
                            <asp:Repeater ID="Rpt4" runat="server">
                                <HeaderTemplate></HeaderTemplate>
                                <ItemTemplate>
                                    <span style="padding:6px">
                                        <div class="<%# Eval("RowType") %>"> <%# Eval("Asset_Owner") +" : "+ Eval("Total") %></div>
                                    </span>
                                </ItemTemplate>
                                <FooterTemplate></FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ml-1 mt-5 mr-1 mb-5">
                <button class="btn btn-primary" type="button" data-target="#ModalCreate" data-toggle="modal">Create Data</button>
                <br /><br />
                <asp:Repeater ID="RptDashboard" runat="server">
                    <HeaderTemplate>
                        <table id="myTable" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%">
                            <thead>
                                <tr role="row">
                                    <th>SN</th>
                                    <th>Description</th>
                                    <th>Family</th>
                                    <th>Location</th>
                                    <th>Line</th>
                                    <th>Status</th>
                                    <th>Owner_Engineer</th>
                                    <th>RFID</th>
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
                                    <td><%# Eval ("SN") %></td>
                                    <td><%# Eval ("Description") %></td>
                                    <td><%# Eval ("Family") %></td>
                                    <td><%# Eval ("Location") %></td>
                                    <td><%# Eval ("Line") %></td>
                                    <td><%# Eval ("Status") %></td>
                                    <td><%# Eval ("Owner_Engineer") %></td>
                                    <td><%# Eval ("RFID") %></td>
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
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("Equip_picture")%>' Width="50px" Height="40px" Style="cursor:pointer" OnClientClick="return LoadDiv(this.src);" />
                                    </td>
                                    <td>
                                        <a href='<%# "http://localhost/File/" + Eval ("Manual_Doc_Attachment") %>' target="_blank"><%# Eval ("Manual_Doc_Attachment") %></a> 
                                    </td>
                                    <td><%# Eval ("By_Whom")  %></td>
                                    <td><%# Eval ("Last_Update") %></td>
                                    <td><%# Eval ("Remark") %></td>
                                    <td>
                                         &nbsp
                                        <a id="Edit_data" data-toggle="modal" data-target="#ModalEdit" onclick="Edit_data" class="fas fa-edit" data-id="<%# Eval("SN") %>" data-nama="<%# Eval("Description") %>" data-fam="<%# Eval("Family") %>"
                                        data-loc="<%# Eval("Location") %>" data-li="<%# Eval("Line") %>" data-status="<%# Eval("Status") %>" data-oe="<%# Eval("Owner_Engineer") %>" data-rfid="<%# Eval("RFID") %>" data-co="<%# Eval("CO") %>"
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
                <div id="divBackground" class="modal1"></div>
                <div id="divImage">
                    <table style="height:100%; width:100%">
                        <tr>
                            <td valign="middle" align="center">
                                <img id="imgFull" alt="" src="" style="display:none; height:500px; width:590px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="bottom">
                                <input id="btnClose" type="button" value="close" onclick="HideDiv()" />
                            </td>
                        </tr>
                    </table>
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
                                                    <asp:ListItem>SPECTRUM</asp:ListItem>
                                                    <asp:ListItem>BUS BOARD</asp:ListItem>
                                                    <asp:ListItem>CARROS</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label4" runat="server" Text="Location"></asp:Label>
                                                <asp:DropDownList ID="ddlLoc" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>BU1</asp:ListItem>
                                                    <asp:ListItem>BU2</asp:ListItem>
                                                    <asp:ListItem>BU3</asp:ListItem>
                                                    <asp:ListItem>WAREHOUSE</asp:ListItem>
                                                    <asp:ListItem>CUSTOMER SITE</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label5" runat="server" Text="Line"></asp:Label>
                                                <asp:TextBox ID="txtLi" CssClass="form-control" runat="server"></asp:TextBox>
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
                                                <asp:Label ID="Label8" runat="server" Text="RFID"></asp:Label>
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
                                                <asp:DropDownList ID="ddlAGDesc" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>FIXTURE</asp:ListItem>
                                                    <asp:ListItem>EQUIPMENT</asp:ListItem>
                                                    <asp:ListItem>TESTER</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label14" runat="server" Text="Manufacturer"></asp:Label>
                                                <asp:DropDownList ID="ddlManu" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>SPECTRUM</asp:ListItem>
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
                                                    <asp:ListItem>CONSIGNED</asp:ListItem>
                                                    <asp:ListItem>IN-HOUSE</asp:ListItem>
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
                                                <asp:FileUpload ID="fpEP" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label23" runat="server" Text="Manual_Doc_Attachment"></asp:Label>
                                                <asp:FileUpload ID="fpMDA" runat="server" />
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
                                                    <asp:ListItem>SPECTRUM</asp:ListItem>
                                                    <asp:ListItem>BUS BOARD</asp:ListItem>
                                                    <asp:ListItem>CARROS</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label29" runat="server" Text="Location"></asp:Label>
                                                <asp:DropDownList ID="ddlEditLoc" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>BU1</asp:ListItem>
                                                    <asp:ListItem>BU2</asp:ListItem>
                                                    <asp:ListItem>BU3</asp:ListItem>
                                                    <asp:ListItem>WAREHOUSE</asp:ListItem>
                                                    <asp:ListItem>CUSTOMER SITE</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label30" runat="server" Text="Line"></asp:Label>
                                                <asp:TextBox ID="txtEditLi" CssClass="form-control" runat="server"></asp:TextBox>
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
                                                <asp:Label ID="Label33" runat="server" Text="RFID"></asp:Label>
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
                                                <asp:DropDownList ID="ddlEditAGDesc" CssClass="form-control" runat="server">
                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                    <asp:ListItem>FIXTURE</asp:ListItem>
                                                    <asp:ListItem>EQUIPMENT</asp:ListItem>
                                                    <asp:ListItem>TESTER</asp:ListItem>
                                                </asp:DropDownList>
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
                                                <asp:FileUpload ID="fpEditEP" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label48" runat="server" Text="Manual_Doc_Attachment"></asp:Label>
                                                <asp:FileUpload ID="fpEditMDA" runat="server" />
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
        <footer class="foot">
            <p style="text-align: center;">&copy; Febriana Manalu </p>
        </footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="another/js/jquery-3.5.1.js"></script>
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
        //table
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

        //form edit
        $(document).on("click", "#Edit_data", function () {
            var _id = $(this).data("id");
            var _nama = $(this).data("nama");
            var _fam = $(this).data("fam");
            var _loc = $(this).data("loc");
            var _li = $(this).data("li");
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

            //pertinggal di form edit
            $("#ModalEdit #txtEditSN").val(_id);
            $("#ModalEdit #txtEditDesc").val(_nama);
            $("#ModalEdit #ddlEditFam").val(_fam);
            $("#ModalEdit #ddlEditLoc").val(_loc);
            $("#ModalEdit #txtEditLi").val(_li);
            $("#ModalEdit #ddlEditS").val(_status);
            $("#ModalEdit #txtEditOE").val(_oe);
            $("#ModalEdit #txtEditRFID").val(_rfid);
            $("#ModalEdit #txtEditCO").val(_co);
            $("#ModalEdit #txtEditEAM").val(_eam);
            $("#ModalEdit #txtEditJN").val(_jn);
            $("#ModalEdit #ddlEditAGID").val(_agid);
            $("#ModalEdit #ddlEditAGDesc").val(_agd);
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

        //zoom image
        function LoadDiv(url) {
            var img = new Image();
            var bcg = document.getElementById("divBackground");
            var image = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
            };
            img.src = url;
            var width = document.body.clientWidth;
            if (document.body.clientHeight > document.body.clientHeight) {
                bcg.style.height = document.body.clientHeight + "px";
            } else {
                bcg.style.height = document.body.scrollHeight + "px";
            }
            image.style.left = (width - 650) / 2 + "px";
            image.style.top = "20px";
            bcg.style.width = "100%"

            bcg.style.display = "block";
            image.style.display = "block";
            return false;
        }

        function HideDiv() {
            var bcg = document.getElementById("divBackground");
            var image = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            if (bcg != null) {
                bcg.style.display = "none";
                image.style.display = "none";
                imgFull.style.display = "none";
            }
        }
    </script>
    </form>
</body>
</html>