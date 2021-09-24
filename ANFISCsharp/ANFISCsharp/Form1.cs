using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ANFISCsharp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            timer1.Tick += Timer1_Tick;
        }

        private void Timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                {
                    var str = new System.IO.StreamReader("ANFIS_GOLD.txt");
                    string[] temp = str.ReadLine().Split('-');
                    if (temp[0] == "BUY")
                    {
                        label4.Text = "BUY";
                        label4.ForeColor = Color.Green;

                    }
                    else
                    {
                        label4.Text = "SELL";
                        label4.ForeColor = Color.Red;
                    }
                    label7.Text = string.Concat("%",temp[1]);
                    label12.Text = string.Concat("%", 1 - float.Parse(temp[1]));
                    str.Dispose();
                }
                {
                    var str = new System.IO.StreamReader("ANFIS_EURUSD.txt");
                    string[] temp = str.ReadLine().Split('-');
                    if (temp[0] == "BUY")
                    {
                        label5.Text = "BUY";
                        label5.ForeColor = Color.Green;

                    }
                    else
                    {
                        label5.Text = "SELL";
                        label5.ForeColor = Color.Red;
                    }
                    label8.Text = string.Concat("%", temp[1]);
                    label13.Text = string.Concat("%",1-float.Parse(temp[1]));
                    str.Dispose();
                }
                {
                    var str = new System.IO.StreamReader("ANFIS_GBPUSD.txt");
                    string[] temp = str.ReadLine().Split('-');
                    if (temp[0] == "BUY")
                    {
                        label6.Text = "BUY";
                        label6.ForeColor = Color.Green;

                    }
                    else
                    {
                        label6.Text = "SELL";
                        label6.ForeColor = Color.Red;
                    }
                    label9.Text = string.Concat("%", temp[1]);
                    label14.Text = string.Concat("%", 1 - float.Parse(temp[1]));
                    str.Dispose();
                }

            }
            catch (Exception)
            {
            }
        }
    }
}
