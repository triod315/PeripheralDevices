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

namespace Lab2_v7
{
    public partial class Form1 : Form
    {
        SerialPort port;//послідовний порт, з яким взаємодіятиме дана програма
        string addres;
        public Form1()
        {
            InitializeComponent();
            try
            {
                port = new SerialPort("COM1", 9600, Parity.None, 8, StopBits.One);//ініціалізуємо послідовний порт
                port.Open();//відкриваємо послідовний порт
                port.NewLine = "\r";//встановлюємо символ перенесення строки
            }
            catch (Exception)
            {
                button1.Enabled = false;
                
                textBox1.Enabled = false;
                MessageBox.Show("Порт не підключений");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            port.RtsEnable = true;//інформуємо мікроконтролер про наявність даних для передачі
            while (!port.CtsHolding) System.Threading.Thread.Sleep(1);//очікуємо готовність мікроконтролера прийняти дані
            port.WriteLine("4");//надсилаємо на послідовний порт 1
            port.RtsEnable = false;//більше немає, що передавати
            string s = port.ReadLine();//зчитуємо строку з послідовного порту
            s = s.Substring(s.Length - 1);//видаляємо зі строки все крім останнього символу
            s = Convert.ToString(Convert.ToInt32(s, 16), 2);//конвертуємо шіснадцяткове значення у двійкове
            while (s.Length < 3)
            {
                s = "0"+s;
            }
            addres= Convert.ToInt32(s, 2).ToString("X");
            if (addres.Length < 2) 
            {
                addres = "0" + addres;
            }
            label1.Text = addres;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            port.RtsEnable = true;//інформуємо мікроконтролер про наявність даних для передачі
            while (!port.CtsHolding) System.Threading.Thread.Sleep(1);//очікуємо готовність мікроконтролера прийняти дані

            port.WriteLine("3" + addres + textBox1.Text);
            port.RtsEnable = false;//більше немає, що передавати
        }
    }
}
