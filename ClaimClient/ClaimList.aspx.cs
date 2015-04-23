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
    public partial class ClaimList : System.Web.UI.Page
    {
        ClaimServiceReference.Service1Client claimService = new ClaimServiceReference.Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //отправляем запрос на получение полного списка заявок                
                Client.ClaimList claimList = claimService.getClaimList();
                
                //обрабатываем результат. В случае успешнего ответа - выводим список изменений статусов на страницу, 
                //в противном случае - обрабатывае код ошибки ответа                
                if (claimList.Result)
                {
                    List<Client.ClaimInfo> items = new List<Client.ClaimInfo>(claimList.value);
                    GridView1.DataSource = items;
                    GridView1.DataBind();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + ErrCodeHadler.handle(claimList) + "');", true);
                }
            }
            catch (EndpointNotFoundException excp)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + Properties.Settings.Default.serverNotFound + "');", true);
                Console.WriteLine(excp.Message);

            }
            catch (Exception excp)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + Properties.Settings.Default.serverError + "');", true);
                Console.WriteLine(excp.Message);
            }


        }
    }
}