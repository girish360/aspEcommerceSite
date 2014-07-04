using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace auditorne.code
{
    public class KorisnikDodatno
    {
        private Guid id;
        public Guid ID
        {
            get { return id; }
            set { id = value; }
        }
        private string imePrezime;
        public string ImePrezime
        {
            get { return imePrezime; }
            set { imePrezime = value; }
        }
        private char pol;
        public char Pol
        {
            get { return pol; }
            set { pol = value; }
        }
        private string godinaRodjenja;
        public string GodinaRodjenja
        {
            get { return godinaRodjenja; }
            set { godinaRodjenja = value; }
        }
        public void insertData()
        {
            try
            {
                BazaPodataka baza = new BazaPodataka();
                baza.DBInsertKorisnikDodatno(this);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void updateData()
        {
            try
            {
                BazaPodataka baza = new BazaPodataka();
                baza.DBUpdateKorisnikDodatno(this);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void deleteData()
        {
            try
            {
                BazaPodataka baza = new BazaPodataka();
                baza.DBDeleteKorisnikDodatno(this);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void getData()
        {
            try
            {
                BazaPodataka baza = new BazaPodataka();
                KorisnikDodatno tmp = baza.DBGetKorisnikDodatno(this.id);
                this.ImePrezime = tmp.ImePrezime;
                this.Pol = tmp.Pol;
                this.GodinaRodjenja = tmp.GodinaRodjenja;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}