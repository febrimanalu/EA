<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="EA.User" %>

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

        .bd {
            background-color: white;
            background-repeat: no-repeat;
            background-size: auto;
            height: 100vh;
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
        }

        .widget-two-warning{
            background:red;
            padding-left:4px;
            padding-right:4px;
        }

        .widget-two-primary{
            background:skyblue;
            padding-left:4px;
            padding-right:4px;
        }

        .widget-two-success{
            background:lightgreen;
            padding-left:4px;
            padding-right:4px;
        }

        .widget-two-secondary{
            background:gray;
            padding-left:4px;
            padding-right:4px;
        }
    </style>
</head>
<body class="bd">
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-expand-sm navbar-color mb-1 bg-primary">
                <a class="navbar-brand">
                    <img src="img/flex1.png" height="40" />
                </a>
                <div class="collapse navbar-collapse" id="Mynavbar">
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
                            <asp:Button ID="btnlogout" CssClass="nav-link text-dark" Text="Login" OnClick="btnLogin_Click" Style="background:white" runat="server" />
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
                                    <td><%# Eval ("Location") %></td>
                                    <td><%# Eval ("Line") %></td>
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
                                    <td>
                                        <img id="myImg" src='<%# Eval("Equip_picture")%>' style="width:50px; height:auto" />
                                    </td>
                                    <td>
                                        <a href='<%# "http://localhost/File/" + Eval ("Manual_Doc_Attachment") %>' target="_blank"><%# Eval ("Manual_Doc_Attachment") %></a> 
                                    </td>
                                    <td><%# Eval ("By_Whom")  %></td>
                                    <td><%# Eval ("Last_Update") %></td>
                                    <td><%# Eval ("Remark") %></td>
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
                    <div id="caption"></div>
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

        var modal = document.getElementById("myModal");

        var img = document.getElementById("myImg");
        var modalImg = document.getElementById("img");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }

        var span = document.getElementsByClassName("close")[0];

        span.onclick = function () {
            modal.style.display = "none";
        }
    </script>
    </form>
</body>
</html>
