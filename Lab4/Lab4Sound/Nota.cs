using System;
using System.Collections.Generic;
using System.Text;

namespace Lab4Sound
{
    class Nota
    {
        public string Name { get; set; }
        public string Period { get; set; }
        public string Pulse11 { get; set; }
        public string Pulse12 { get; set; }
        public string Pulse14 { get; set; }
        public string Pulse18 { get; set; }
        public string Pulse116 { get; set; }

        public static List<Nota> allNotas { get; set; }

        public Nota(string Name, string Period, string Pulse11, string Pusle12, string Pulse14, string Pulse18, string Pulse116) 
        {
            this.Name = Name;
            this.Period = Period;
            this.Pulse11 = Pulse11;
            this.Pulse12 = Pulse12;
            this.Pulse14 = Pulse14;
            this.Pulse18 = Pulse18;
            this.Pulse116 = Pulse116;
        }

        static Nota() 
        {
            allNotas = GetAllNotes();
        }

        public string GetPulse(string pulse) 
        {
            switch (pulse)
            {
                case "1/1":
                    return Pulse11;
                case "1/2":
                    return Pulse12;
                case "1/4":
                    return Pulse14;
                case "1/8":
                    return Pulse18;
                case "1/16":
                    return Pulse116;
            }
            return pulse;
        }

        public Nota GetNota(string name) 
        {
            Nota result = null;

            foreach (var item in allNotas)
            {
                if (item.Name == name)
                    return item;
            }

            return result;
        }

        public static List<Nota> GetAllNotes() 
        {
            List<Nota> notas = new List<Nota>();

            notas.Add(new Nota("C1", "2548", "523", "262", "131", "65", "33"));
            notas.Add(new Nota("Cis1","2405", "554", "277", "139", "69", "35"));
            notas.Add(new Nota("D1", "2270", "587", "294", "147", "73", "37"));
            notas.Add(new Nota("Dis1", "2143", "622", "311", "156", "78", "39"));
            notas.Add(new Nota("E1", "2022", "659", "330", "165", "82", "41"));
            notas.Add(new Nota("F1", "1909", "698", "349", "175", "87", "44"));
            notas.Add(new Nota("Fis1", "1802", "740", "370", "185", "92", "46"));
            notas.Add(new Nota("G1", "1701", "784", "392", "196", "98", "49"));
            notas.Add(new Nota("Gis1", "1605", "831", "415", "208", "104", "52"));
            notas.Add(new Nota("A1", "1515", "880", "440", "220", "110", "55"));
            notas.Add(new Nota("Ais1", "1430", "932", "466", "233", "117", "58"));
            notas.Add(new Nota("H1", "1350", "988", "494", "247", "124", "62"));
            notas.Add(new Nota("C2", "1274", "1047", "523", "262", "131", "65"));
            notas.Add(new Nota("Cis2", "1203", "1109", "554", "277", "139", "69"));
            notas.Add(new Nota("D2", "1135", "1175", "587", "294", "147", "73"));
            notas.Add(new Nota("Dis2", "1071", "1245", "622", "311", "156", "78"));
            notas.Add(new Nota("E2", "1011", "1319", "659", "330", "165", "82"));
            notas.Add(new Nota("F2", "954", "1397", "698", "349", "175", "87"));
            notas.Add(new Nota("Fis2", "901", "1480", "740", "370", "185", "92"));
            notas.Add(new Nota("G2", "850", "1568", "784", "392", "196", "98"));
            notas.Add(new Nota("Gis2", "803", "1661", "831", "415", "208", "104"));
            notas.Add(new Nota("A2", "758", "1720", "880", "440", "220", "110"));
            notas.Add(new Nota("Ais2", "715", "1865", "932", "466", "233", "117"));
            notas.Add(new Nota("H2", "675", "1976", "988", "494", "247", "124"));
            notas.Add(new Nota("C3", "637", "2093", "1047", "523", "262", "131"));
            notas.Add(new Nota("Cis3", "601", "2218", "1109", "554", "277", "139"));
            notas.Add(new Nota("D3", "566", "2350", "1175", "587", "294", "147"));
            notas.Add(new Nota("Dis3", "536", "2490", "1245", "622", "311", "156"));
            notas.Add(new Nota("E3", "483", "2638", "1319", "659", "330", "165"));
            notas.Add(new Nota("F3", "477", "2794", "1397", "698", "349", "175"));
            notas.Add(new Nota("Fis3", "450", "2960", "1480", "740", "370", "185"));
            notas.Add(new Nota("G3", "425", "3136", "1568", "784", "392", "196"));
            notas.Add(new Nota("Gis3", "401", "3322", "1661", "831", "415", "208"));
            notas.Add(new Nota("A3", "388", "3440", "1720", "880", "440", "220"));
            notas.Add(new Nota("Ais3", "358", "3730", "1865", "932", "466", "233"));
            notas.Add(new Nota("H3", "337", "3952", "1976", "988", "494", "247"));

            return notas;
        }

        public static string ToString(string notaStr) 
        {
            string nota = notaStr.Split('(')[0];
            string pulse = notaStr.Split('(')[1].Split(')')[0];
            return notaStr;
        }
    }
}
