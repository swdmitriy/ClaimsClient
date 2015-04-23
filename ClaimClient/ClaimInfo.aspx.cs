using Client = ClaimClient.ClaimServiceReference;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel;

namespace ClaimClient
{
    public partial class ClaimInfo : System.Web.UI.Page
    {
        ClaimServiceReference.Service1Client claimService = new ClaimServiceReference.Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            ResultLabel.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try{

                int claimId = (int)Convert.ToInt32(itemIdTextBox.Text);

                //отправляем запрос на получение истории изменения статусов заявки по ее номеру
                Client.ClaimLifeCycle claimLifeCycle = claimService.getClaimLifeCycle(claimId);

                //обрабатываем результат. В случае успешнего ответа - выводим список изменений статусов на страницу, 
                //в противном случае - обрабатывае код ошибки ответа
                if (claimLifeCycle.Result)
                {
                    ResultLabel.Text = (claimLifeCycle.value.Length == 0) ?
                        Properties.Settings.Default.noClaim + claimId.ToString() : Properties.Settings.Default.claimInfo + claimId.ToString();
                    List<Client.ClaimStatus> items = new List<Client.ClaimStatus>(claimLifeCycle.value);
                    GridView1.DataSource = items;
                    GridView1.DataBind();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + ErrCodeHadler.handle(claimLifeCycle) + "');", true);
                }
            } 
            catch (EndpointNotFoundException exc)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + Properties.Settings.Default.serverNotFound + "');", true);
                Console.WriteLine(exc.Message);
            }
            catch (Exception exc)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + Properties.Settings.Default.serverNotFound + "');", true);
                Console.WriteLine(exc.Message);
            }  
        }
    }
}