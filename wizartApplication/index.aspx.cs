using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wizartApplication
{
    public partial class index : System.Web.UI.Page
    {      
        
        SqlConnection con = new SqlConnection(@"Data Source=JANELTON\SQLEXPRESS;Initial Catalog=WIZARD;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            Label6.Visible = false;
            //Label5.Visible = false;
            DataUserDisplay();
            bouderiesWhenLoad();


        }
        
       
        protected void Page_PreRender(object sender, EventArgs e)
        {

            BoudoriesFirstLoadEveryPage();


        }

     

        protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
        {

            WhenWizardIndexIsChanged();

        }

    

        protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {

           if(Wizard1.ActiveStepIndex == 1)
            {

               
                if (TextBox1.Text == "" && TextBox2.Text == "" && TextBox3.Text == "")
                {
                    e.Cancel = true;
                    Label6.Visible = true;
                    Label6.ForeColor = System.Drawing.Color.Aquamarine;
                    Label6.Attributes["style"] = "font-family:'Roboto',sans-serif;";
                    Label6.Text = "Sorry but to move to the next step you have  to fill the box ! .  .  .";
                }
           

            }
            else if (Wizard1.ActiveStepIndex == 2)
            {

                if (TextBox4.Text == "" )
                {
                    e.Cancel = true;
                    LinkButton4.Visible = true;
                    LinkButton4.ForeColor = System.Drawing.Color.Aquamarine;
                    LinkButton4.Attributes["style"] = "font-family:'Roboto',sans-serif; text-decoration:none; background:rgba(0,0,0,0.5); padding:7px 7px;";
                    LinkButton4.Text = "Sorry but to move to the next step you have  to fill the box ! .  .  .";
                }
                else
                {
                    

                    LinkButton4.Attributes["class"] = "fa-solid fa-circle-check";              
                    LinkButton4.Text = "Email Confirm !";
                    
                }

            }



        }
   

       
      

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Button nextbtn = (Button)Wizard1.FindControl("StartNavigationTemplateContainerID").FindControl("StartNextButton");

            Button2.Visible = false;
            nextbtn.Visible = true;
            nextbtn.Text = "Create new Account";            
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
 

                    try
                    {
                
                        con.Open();
                        string query = "insert into uLOGIN values('" + TextBox1.Text + "', '" + TextBox5.Text + "', '" + TextBox2.Text + "','" + TextBox3.Text + "','" + RadioButtonList1.SelectedValue.ToString()+ "')";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                       
                        confirmation.Attributes["class"] = "fa-solid fa-circle-check";
                        Button finish = (Button)Wizard1.FindControl("FinishNavigationTemplateContainerID").FindControl("FinishButton");
                        finish.Visible = true;

               

                   }
                    catch (Exception ex)
                    {

                        LinkButton2.Text = ex.Message.ToString();
                    }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {

                String query = ("select * from  uLOGIN where FULNAME='" + TextBox6.Text + "'and  PASS='" + TextBox7.Text + "' ");
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                   

                   
                     Response.Redirect("index2.aspx");

                }
                else
                {
                    Label5.ForeColor = System.Drawing.Color.Aquamarine;
                    Label5.Text = "Ops something is wrong";
                    TextBox7.Text = "";
                    TextBox6.Text = "";
                    Label5.Visible = true;
                }

            }
            catch (Exception ex)
            {

                Label5.ForeColor = System.Drawing.Color.Aquamarine;
                Label5.Text = "Ops something is wrong : '"+ex.Message+"'";
                TextBox6.Text = "";
                TextBox7.Text = "";
            }
            con.Close();
            
        }

        protected void Wizard1_SideBarButtonClick(object sender, WizardNavigationEventArgs e)
        {


            if (Wizard1.ActiveStepIndex == 1)
            {


                if (TextBox1.Text == "" && TextBox2.Text == "" && TextBox3.Text == "")
                {
                    e.Cancel = true;
                    Label6.Visible = true;
                    Label6.ForeColor = System.Drawing.Color.Aquamarine;
                    Label6.Attributes["style"] = "font-family:'Roboto',sans-serif;";
                    Label6.Text = "Sorry but to move to the next step you have  to fill the box ! .  .  .";
                }


            }
            else if (Wizard1.ActiveStepIndex == 2)
            {


                if (TextBox4.Text == "")
                {
                    e.Cancel = true;
                    LinkButton4.Visible = true;
                    LinkButton4.ForeColor = System.Drawing.Color.Aquamarine;
                    LinkButton4.Attributes["style"] = "font-family:'Roboto',sans-serif; text-decoration:none; background:rgba(0,0,0,0.5); padding:7px 7px;";
                    LinkButton4.Text = "Sorry but to move to the next step you have  to fill the box ! .  .  .";
                }
                else
                {


                    LinkButton4.Attributes["class"] = "fa-solid fa-circle-check";
                    LinkButton4.Text = "Email Confirm !";
                    //Response.AddHeader("REFRESH", "3;URL=index2.aspx");
                }
            }
        }  
    
      // Methods area -----------------------------------------------------------
        
        public void bouderiesWhenLoad()
        {
               Button finish = (Button)Wizard1.FindControl("FinishNavigationTemplateContainerID").FindControl("FinishButton");
                finish.Visible = false;


            if (Wizard1.ActiveStepIndex == 0)
            {

                Button nextbtn = (Button)Wizard1.FindControl("StartNavigationTemplateContainerID").FindControl("StartNextButton");
                nextbtn.Visible = false;
              
                Button cancelbtn = (Button)Wizard1.FindControl("StartNavigationTemplateContainerID").FindControl("CancelButton");
                cancelbtn.Visible = false;

                
                
            }
            else if(Wizard1.ActiveStepIndex == 3)
            {
            
                Label headerText = (Label)Wizard1.FindControl("HeaderContainer").FindControl("Label1");
                headerText.Visible = false;
            }
               

           
        }  
        
        public void BoudoriesFirstLoadEveryPage()
        {
            
            
            if (Wizard1.ActiveStepIndex == 0)
            {
                TextBox6.Focus();
                DataList Sidbar = (DataList)Wizard1.FindControl("SideBarContainer").FindControl("SideBarList");
                Sidbar.Visible = false;

            }
            else if (Wizard1.ActiveStepIndex == 1)
            {
                TextBox1.Focus();

            }
            else if (Wizard1.ActiveStepIndex == 2)
            {
                TextBox4.Focus();
 
            }

        }
     
        public void WhenWizardIndexIsChanged()
        { 
            Response.Write(" eu sou janelton vunge" +Wizard1.ActiveStepIndex);
          
          
             if (Wizard1.ActiveStepIndex == 1)
            {
                DataList Sidbar = (DataList)Wizard1.FindControl("SideBarContainer").FindControl("SideBarList");
                Sidbar.Visible = true;
            }
            else if (Wizard1.ActiveStepIndex == 2)
            {
                DataList Sidbar = (DataList)Wizard1.FindControl("SideBarContainer").FindControl("SideBarList");
                Sidbar.Visible = true;
            }
            else if (Wizard1.ActiveStepIndex == 3)
            {
                Label headerText = (Label)Wizard1.FindControl("HeaderContainer").FindControl("Label1");
                headerText.Visible = false;

                
            }

        }
    
       
       
        public void DataUserDisplay()
        {
             Label12.Text = TextBox1.Text;
            Label13.Text = "**.  .  .";
            Label14.Text = RadioButtonList1.SelectedValue.ToString();
            Label15.Text = TextBox4.Text;
        }
       

        }
   
   }
