<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="BankManagementUI.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="Hanumanth" />
    <link rel="shortcut icon" href="http://getbootstrap.com/docs-assets/ico/favicon.png" />

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.css" rel="stylesheet" />

</head>
<body>
        <div class="container">
            <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title" style="font-weight:bold">Logi Please</div>

                    </div>

                    <div style="padding-top: 30px" class="panel-body">

                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                        <form id="loginform" class="form-horizontal" role="form" runat="server">

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:Textbox id="txtUsername" class="form-control" name="username" value="" placeholder="username" runat="server"  />
                            </div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:Textbox id="txtPassword"  class="form-control" name="password" placeholder="password" runat="server" />
                            </div>
                            

                            
                                <div style="margin-top:10px" class="form-group">
                                    

                                    <div class="col-sm-12 controls">
                                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success center-block" Text="LOGIN" OnClick="btnLogin_Click" />

                                    </div>
                                </div>
                        </form>

                    </div>
                </div>
            </div>

        </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</body>
</html>
