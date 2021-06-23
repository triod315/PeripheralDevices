using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab4Sound
{
    public partial class Form1 : Form
    {
        SerialPort port;
        public Form1()
        {
            InitializeComponent();
            try
            {
                port = new SerialPort("COM4", 9600, Parity.None, 8, StopBits.One);
                port.Open();
                port.NewLine = "\r";
            }
            catch (Exception) 
            {
                MessageBox.Show("Port not connected");
            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            port.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            port.WriteLine("0");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("Err");
            }
            else 
            {
                port.WriteLine("Change");
                port.WriteLine(textBox1.Text);
            }
        }

     
    }
}
