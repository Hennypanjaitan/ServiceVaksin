using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace WcfService_RegistrasiVaksin
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Registrasi : IRegistrasi
    {
        public bool InsertDataVaksin(Data_Vaksin dataVks)
        {
            Vaksin_07Entities1 vaksin_07 = new Vaksin_07Entities1();
            Data_Vaksin newdataVaksin = new Data_Vaksin
            {
                no_register = dataVks.no_register,
                tanggal_dibuat = dataVks.tanggal_dibuat
            };
            vaksin_07.Data_Vaksin.Add(newdataVaksin);
            vaksin_07.SaveChanges();
            return true;



        }

        public bool UpdateDataVaksin(Data_Vaksin dataVks)
        {
            Vaksin_07Entities1 vaksin_07 = new Vaksin_07Entities1();
            Data_Vaksin datavaksinlama = vaksin_07.Data_Vaksin.SingleOrDefault(x => x.no_register == dataVks.no_register);
            vaksin_07.SaveChanges();
            return true;
        }

        public bool DeleteDataVaksin(string dataVks)
        {
            Vaksin_07Entities1 vaksin_07 = new Vaksin_07Entities1();
            Data_Vaksin datavaksinlama = vaksin_07.Data_Vaksin.SingleOrDefault(x => x.no_register == dataVks);
            vaksin_07.Data_Vaksin.Remove(datavaksinlama); ;
            return true;
        }

        List<Data_Vaksin> IRegistrasi.GetData_Vaksins()
        {
            Vaksin_07Entities1 vaksin_07 = new Vaksin_07Entities1();
            var dataVaksin = from x in vaksin_07.Data_Vaksin select x;
            return dataVaksin.ToList<Data_Vaksin>();
        }
    } 

}
