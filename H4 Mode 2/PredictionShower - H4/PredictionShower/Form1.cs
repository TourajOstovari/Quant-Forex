using System;
using System.Drawing;

using System.Windows.Forms;

namespace PredictionShower
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
                    var str = new System.IO.StreamReader("GOLD.txt");
                    if (str.ReadLine() == "BUY")
                    {
                        label2.Text = "BUY";
                        label2.ForeColor = Color.Green;

                    }
                    else
                    {
                        label2.Text = "SELL";
                        label2.ForeColor = Color.Red;
                    }
                    str.Dispose();
                }
                {
                    var str = new System.IO.StreamReader("EURUSD.txt");
                    if (str.ReadLine() == "BUY")
                    {
                        label4.Text = "BUY";
                        label4.ForeColor = Color.Green;

                    }
                    else
                    {
                        label4.Text = "SELL";
                        label4.ForeColor = Color.Red;
                    }
                    str.Dispose();
                }
                {
                    var str = new System.IO.StreamReader("GBPUSD.txt");
                    if (str.ReadLine() == "BUY")
                    {
                        label6.Text = "BUY";
                        label6.ForeColor = Color.Green;

                    }
                    else
                    {
                        label6.Text = "SELL";
                        label6.ForeColor = Color.Red;
                    }
                    str.Dispose();
                }

            }
            catch (Exception)
            {
            }






        }
    }
    }
