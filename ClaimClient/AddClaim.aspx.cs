using ClaimClient.ClaimServiceReference;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClaimClient
{
    public partial class AddClaimForm : System.Web.UI.Page
    {
        ClaimServiceReference.Service1Client claimService = new ClaimServiceReference.Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            ClaimIdLabel.Text = "";
        }
      
        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                //формируем объект с информацией о гражданине
                Citizen citizen = new Citizen();
                citizen.LastName = LastNameTextBox.Text;
                citizen.FirstName = FirstNameTextBox.Text;
                citizen.SecondName = SecondNameTextBox.Text;
                citizen.Address = AddressTextBox.Text;
                citizen.PassSeries = PassSeriesTextBox.Text;
                citizen.PassNumber = PassNumberTextBox.Text;
                citizen.PassAgency = PassAgencyTextBox.Text;
                citizen.Tpin = TpinTextBox.Text.Replace("-", "").Replace(" ", "");
                citizen.PassDate = new DateTime(Convert.ToInt32(PassDateYYYYTextBox.Text),
                Convert.ToInt32(PassDateMMDropDownList.SelectedIndex + 1), Convert.ToInt32(PassDateDDTextBox.Text));

                ClaimClient.ClaimServiceReference.ClaimId claimId = claimService.addClaim(citizen);
                
                //обработка результата запроса и вывод на страницу номера новой заявки. В случае неудачного ответа - обработка кода ошибки
                if (claimId.Result)
                {
                    AddClaimButton.Enabled = false;
                    ClaimIdLabel.Text = Properties.Settings.Default.claimIdLabelText + claimId.value.ToString();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + ErrCodeHadler.handle(claimId) + "');", true);                       
                }
                
            }
            catch (FormatException exc)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + Properties.Settings.Default.formatException + "');", true);
                Console.WriteLine(exc.Message);
            }            
            catch (EndpointNotFoundException exc)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + Properties.Settings.Default.serverNotFound + "');", true);
            }
            catch (Exception exc)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Ошибка", "alert('" + Properties.Settings.Default.serverNotFound + "');", true);
                Console.WriteLine(exc.Message);
            }
        }
    }
}