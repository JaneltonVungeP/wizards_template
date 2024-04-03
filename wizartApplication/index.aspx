<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="wizartApplication.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>zwizard stadies</title>
    <link href="index.css?Version=1" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/24e7002d97.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="all_wizart">
            <asp:Wizard ID="Wizard1" class="wizard" runat="server" OnActiveStepChanged="Wizard1_ActiveStepChanged" CssClass="wizard" DisplayCancelButton="True" ActiveStepIndex="0" OnNextButtonClick="Wizard1_NextButtonClick" FinishDestinationPageUrl="index2.aspx" OnSideBarButtonClick="Wizard1_SideBarButtonClick">
               
                <FinishNavigationTemplate>
                    <asp:Button ID="FinishPreviousButton" runat="server" CssClass="nextbtn"  CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                    <asp:Button ID="FinishButton" runat="server" CssClass="nextbtn"  CommandName="MoveComplete" Text="Go to Home" />
                    <asp:Button ID="CancelButton" runat="server" CssClass="nextbtn"  CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                   
                  
                </FinishNavigationTemplate>
               

                <HeaderTemplate>
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" CssClass="labl1-Title" Text="Login Form JD2V"></asp:Label>
                </HeaderTemplate>
               
                
                
                <SideBarTemplate>

                    <asp:DataList ID="SideBarList" runat="server">
                        <ItemTemplate>
                            
                            <asp:LinkButton ID="SideBarButton" CssClass="SideBarButton" runat="server" >
                              
                                <i class="fa-solid fa-address-book"></i>
                                
                            </asp:LinkButton>
                             <asp:LinkButton ID="LinkButton1" CssClass="SideBarButton" runat="server" >
                              
                                <i class="fa-solid fa-address-book"></i>
                                
                            </asp:LinkButton>
                            <hr />
                        </ItemTemplate>
                        <SelectedItemStyle Font-Bold="True"  />
                    </asp:DataList>

                </SideBarTemplate>
               
                
                
                <StartNavigationTemplate >
                    <asp:Button ID="StartNextButton" runat="server" CssClass=" createNewAccunt-btn"  CommandName="MoveNext" Text="Next" />
                    <asp:Button ID="CancelButton" runat="server" CssClass="nextbtn"  CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </StartNavigationTemplate>
               
                <StepNavigationTemplate>
                    <asp:Button ID="StepPreviousButton" runat="server" CssClass="nextbtn" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                    <asp:Button ID="StepNextButton" runat="server" CssClass="nextbtn" CommandName="MoveNext" Text="Next" />
                    <asp:Button ID="CancelButton" runat="server" CssClass="nextbtn" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </StepNavigationTemplate>
               
                
                
                <WizardSteps>
                   
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                        
                         <div  class="loginArea">
                              <hr />
                                <br />
                             <asp:TextBox ID="TextBox6" runat="server" CssClass="textbox-userN" placeholder="User Name"></asp:TextBox>
                             <br />
                             <br />
                             <br />
                             <asp:TextBox ID="TextBox7" runat="server" CssClass="textbox-userP" placeholder="User PassWord"></asp:TextBox>
                             <br />
                             <br />
                             <asp:Button ID="Button2" runat="server" Text="Log in " class="login-btn1" OnClick="Button2_Click" />
                             <br />
                             <br />
                             <asp:Label ID="Label5" runat="server" CssClass="login-status" Text="Label"></asp:Label>
                             <br />
                             <br />
                             <asp:LinkButton ID="LinkButton3" CssClass="createA" runat="server" OnClick="LinkButton3_Click">Create Account</asp:LinkButton>
                        </div>
                        
                    </asp:WizardStep>

                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                       <div  class="loginArea">
                              <hr />
                                <br />
                                     <asp:Label ID="Label2" runat="server" CssClass="labl1" Text="Fill All The Box"></asp:Label>
                                <br />
                                <br />
                                     <asp:TextBox ID="TextBox1" CssClass="textbox textbox-text" Placeholder="Full Name" runat="server"></asp:TextBox>                            
                                     <asp:TextBox ID="TextBox5" CssClass="textbox textbox-text"  placeholder="Your Password" runat="server"></asp:TextBox>

                                <br />
                                <br />
                                  <asp:TextBox ID="TextBox2" CssClass="textbox textbox-text" placeholder="First" runat="server"></asp:TextBox>
                                  <asp:TextBox ID="TextBox3" CssClass="textbox textbox-text" placeholder="Last Name" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                   <asp:Label ID="Label6" runat="server" Text="Status .  .  ."></asp:Label>
                                <br />
                                <br />
                                  <asp:Label ID="Label3" runat="server" CssClass="labl1-Title" Text="Marital Status"></asp:Label>
                                <br />
                                <br />
                                 
                                  <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                
                                    <asp:ListItem>Single</asp:ListItem>
                                    <asp:ListItem>Married</asp:ListItem>
                                
                                  </asp:RadioButtonList>
                             <br />
                            <br />
                                 
                        </div>
                    </asp:WizardStep>
                   
                    <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">
                        <div class="emailArea">
                            <hr />
                            <br />
                             <asp:Label ID="Label4" runat="server" CssClass="labl1-Title" Text="Email Confirmation"></asp:Label>
                            <br />
                            <br />
                             <asp:TextBox ID="TextBox4" CssClass="textbox textbox-text" TextMode="Email" placeholder="Email" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:LinkButton ID="LinkButton4" runat="server" Text="Email Status"></asp:LinkButton>
                             
                        </div>
                    </asp:WizardStep>

                    <asp:WizardStep ID="WizardStep4" runat="server" Title="Step 4">

                            <div class="card">
                            <div class="profile-img">
                                <asp:Image ID="Image1" runat="server" CssClass="photo" ImageUrl="~/250855862_494083548861576_7395277819719862248_n.jpg" />
                            </div>
                            <div class="user-details">

                                <div class="user-details-display">
                                
                                  <asp:Label ID="Label7" runat="server" CssClass="user-title1" Text="Your Details"></asp:Label>
                                <br />
                                   <asp:Label ID="Label8" runat="server" CssClass="user-detail-titles" Text="Full Name:"></asp:Label>
                                   <asp:Label ID="Label12" runat="server" CssClass="user-detail-content" Text="Name:"></asp:Label>
                                <br />
                                    <asp:Label ID="Label9" runat="server" CssClass="user-detail-titles" Text="Password:"></asp:Label>
                                    <asp:Label ID="Label13" runat="server" CssClass="user-detail-content" Text="Password"></asp:Label>
                                <br />
                                    <asp:Label ID="Label10" runat="server" CssClass="user-detail-titles mari" Text="Marital Status:"></asp:Label>
                                    <asp:Label ID="Label14" runat="server" CssClass="user-detail-content  mari" Text="Password"></asp:Label>
                                 <br />
                                    <asp:Label ID="Label11" runat="server" CssClass="user-detail-titles mari" Text="Email: "></asp:Label>
                                    <asp:Label ID="Label15" runat="server" CssClass="user-detail-content mari" Text="Password"></asp:Label>
                                </div>
                               
                            </div>

                        </div>
                        <div class="loading">

                            <asp:LinkButton ID="LinkButton2" class="btnloading" runat="server" Text="Saving">Saving
                              <i runat="server" id="confirmation" class="fa-solid fa-circle-notch fa-spin"></i>
                            </asp:LinkButton>
                         
                            <asp:Button ID="Button3" runat="server"  CssClass="saving" Text="Saving Confirmation" OnClick="Button3_Click" />

                        </div> 
                       
                    </asp:WizardStep>

                </WizardSteps>
            </asp:Wizard>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Button"  OnClientClick="return confirm('are you sure?')" />
    </form>
</body>
</html>
